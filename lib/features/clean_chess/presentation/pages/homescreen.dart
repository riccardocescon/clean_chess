import 'package:clean_chess/chess/core/utilities/assets.dart';
import 'package:clean_chess/chess/core/utilities/navigation.dart';
import 'package:clean_chess/core/clean_chess/presentation/widgets/diamond_bottom_bar.dart';
import 'package:clean_chess/core/clean_chess/utilities/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: const Text(
            'Clean Chess',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: DiamondBottomNavigation(
          itemIcons: const [Icons.home_rounded, Icons.person_rounded],
          centerIcon: Image.asset(
            flatWhitePawn,
            scale: 8,
          ),
          selectedIndex: _selectedIndex,
          onItemPressed: (index) => setState(() {
            _selectedIndex = index;
          }),
        ),
        body: _body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            const String charset =
                'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';

            final codeVerifier = List.generate(
                    128,
                    (i) =>
                        charset[math.Random.secure().nextInt(charset.length)])
                .join();

            final state = List.generate(
                    128,
                    (i) =>
                        charset[math.Random.secure().nextInt(charset.length)])
                .join();

            final grant = oauth2.AuthorizationCodeGrant(
              'clean_chess',
              Uri.parse('https://lichess.org/oauth'),
              Uri.parse('https://lichess.org/api/token'),
              httpClient: http.Client(),
              codeVerifier: codeVerifier,
            );

            final authorizationUrl = grant.getAuthorizationUrl(
              Uri.parse(
                'https://lichess.org?'
                'response_type=code&'
                'client_id=clean_chess&'
                'redirect_uri=login&'
                'code_challenge_method=S256&'
                'code_challenge=$codeVerifier&'
                'state=$state',
              ),
              scopes: ['challenge:read', 'challenge:write'],
            );

            // Present the dialog to the user
            final result = await FlutterWebAuth.authenticate(
              url: authorizationUrl.toString(),
              callbackUrlScheme: 'login',
            );

            // Never reached
            final uri = Uri.parse(result);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _topCards(),
        const SizedBox(height: 10),
        _middleCards(),
        const SizedBox(height: 20),
        _bottomListView(),
      ],
    );
  }

  //#region Top Cards
  Widget _topCards() => SizedBox(
        height: 200,
        child: PageView.builder(
          controller: PageController(
            viewportFraction: 0.8,
          ),
          padEnds: false,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(20),
              ),
              child: _buildCards[index],
            );
          },
          itemCount: _buildCards.length,
        ),
      );

  List<Widget> get _buildCards => [
        _topCard(
          title: 'Challenge a friend',
          imageAsset: flatWhitePawn,
          iconPath: 'assets/img/handshake.png',
          small: true,
          onTap: () {},
        ),
        _topCard(
          title: 'Puzzle',
          imageAsset: flatWhiteKnight,
          iconPath: 'assets/img/idea.png',
          onTap: () {
            Navigator.pushNamed(context, Navigation.homepage);
          },
        ),
      ];

  Widget _topCard({
    required String title,
    required String imageAsset,
    required String iconPath,
    bool small = false,
    required void Function() onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned(
              bottom: -15,
              left: -15,
              child: Transform.rotate(
                angle: math.pi / 6,
                child: Image.asset(
                  imageAsset,
                  scale: 3,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GridView.count(
                                crossAxisCount: 8,
                                children: List.generate(
                                  64,
                                  (index) => Container(
                                    decoration: BoxDecoration(
                                      color: getCellColor(index),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: small ? null : 35,
                                height: small ? null : 35,
                                child: Image.asset(
                                  iconPath,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  //#endregion

  //#region Middle Cards

  Widget _middleCards() => SizedBox(
        height: 140,
        child: PageView.builder(
          controller: PageController(
            viewportFraction: 0.26,
          ),
          padEnds: false,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(20),
              ),
              child: _statCards[index],
            );
          },
          itemCount: _statCards.length,
        ),
      );

  List<Widget> get _statCards => [
        _middleCard(
          title: 'Rapid',
          icon: Icon(
            Icons.timer_outlined,
            color: Colors.green.shade400,
            size: 36,
          ),
          score: '+9999',
          increase: '999',
        ),
        _middleCard(
          title: 'Bullet',
          icon: const Icon(
            Icons.flash_on_rounded,
            color: Colors.amber,
            size: 36,
          ),
          score: '+9999',
          increase: '999',
        ),
        _middleCard(
          title: 'Lampo',
          icon: Image.asset('assets/img/bullet.png', scale: 16),
          score: '+9999',
          increase: '999',
        ),
        _middleCard(
          title: 'Daily',
          icon: const Icon(
            Icons.sunny,
            color: Colors.yellow,
            size: 36,
          ),
          score: '+9999',
          increase: '999',
        ),
        _middleCard(
          title: 'Puzzle',
          icon: const Icon(
            Icons.extension_rounded,
            color: Colors.orange,
            size: 36,
          ),
          score: '+9999',
          increase: '999',
        ),
      ];

  Widget _middleCard({
    required String title,
    required Widget icon,
    required String score,
    required String increase,
  }) =>
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon,
            Text(
              score,
              style: TextStyle(
                color: Colors.green.shade400,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.keyboard_double_arrow_up_rounded,
                  color: Colors.green.shade400,
                  size: 12,
                ),
                Text(
                  increase,
                  style: TextStyle(
                    color: Colors.green.shade400,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  //#endregion

  // #region Bottom ListView

  Widget _bottomListView() => Expanded(
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: Image.asset(
                          'assets/img/idea.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: const [
                            Text(
                              'Username ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '(9999)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.green.shade400,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Transform.rotate(
                            angle: -math.pi / 2,
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ),
                        Text(
                          '+999',
                          style: TextStyle(
                            color: Colors.green.shade400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(
                  color: Colors.grey,
                  height: 0,
                ),
              ],
            ),
          ),
        ),
      );

  //#endregion
}
