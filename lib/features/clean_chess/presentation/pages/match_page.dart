import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard_interpreter.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/dialogs/pawn_promotion_dialog.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/titled_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart' as lichess;

class MatchPage extends StatefulWidget {
  const MatchPage({
    super.key,
    required this.gameMode,
    required this.white,
    required this.black,
  });

  final String gameMode;
  final lichess.User white;
  final lichess.User black;

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  final List<String> _moves = List.generate(10, (index) => 'e4');
  int _selectedMoveIndex = 0;
  //TODO: callback on [BoardInterpreter] to change turn
  bool _whiteTurn = true;

  // Colors
  final Color _bottomNavigationBarColor = Colors.grey.shade900;
  final Color _bottomNavigationBarItemsColor = Colors.grey;
  final Color _selectedMoveViewBgColor = Colors.grey;
  final Color _ratingTextColor = Colors.grey;
  final Color _turnTimerColor = Colors.pink;

  // Sizes
  final double _selectedMoveViewBgRadius = 8.0;
  final PageController _movesViewController = PageController(
    initialPage: 0,
    viewportFraction: 0.1,
  );

  // Spaces
  final double _boardUsersPadding = 20.0;
  final double _usersHorizontalPadding = 10.0;
  final double _onlineRadiusSize = 6.0;
  final double _onlineStatusTitleSpace = 10;
  final double _titleNameSpace = 5;
  double get _ratingLeftPadding =>
      _onlineRadiusSize * 2 + _onlineStatusTitleSpace;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: _body(),
      title: widget.gameMode,
      subtitle: 'Playing right now',
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _movesView(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _userData(widget.black, !_whiteTurn),
              Padding(
                padding: EdgeInsets.symmetric(vertical: _boardUsersPadding),
                child: ChessboardInterpreter(
                  controller: BaseController(),
                  onPromotion: (turn) => showPromotionDialog(context, turn),
                ),
              ),
              _userData(widget.white, _whiteTurn),
            ],
          ),
        ),
      ],
    );
  }

  Widget _userData(lichess.User user, bool myTurn) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _usersHorizontalPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      //TODO: decide how to handle realtime.online status
                      // a stream should be needed in order to update the status
                      // otherwise we have to call it every minute
                      backgroundColor: Colors.green,
                      maxRadius: _onlineRadiusSize,
                    ),
                    SizedBox(width: _onlineStatusTitleSpace),
                    Text(
                      user.title?.raw ?? '',
                      style: const TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                    SizedBox(width: _titleNameSpace),
                    Text(
                      user.username ?? '',
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: _ratingLeftPadding),
                  child: Text(
                    user.perfs?.blitz?.rating.toString() ?? '',
                    style: TextStyle(
                      color: _ratingTextColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            '0:22',
            style: TextStyle(
              color: myTurn ? _turnTimerColor : null,
              fontWeight: myTurn ? FontWeight.bold : null,
              fontSize: Theme.of(context).textTheme.titleMedium!.fontSize!,
            ),
          ),
        ],
      ),
    );
  }

  Widget _movesView() {
    return SizedBox(
      height: Theme.of(context).textTheme.titleLarge!.fontSize!,
      child: PageView.builder(
        itemCount: _moves.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: _selectedMoveIndex == index
                  ? _selectedMoveViewBgColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(_selectedMoveViewBgRadius),
            ),
            child: Text(
              '$index. ${_moves[index]}',
              style: TextStyle(
                color: Colors.white.withOpacity(_getMoveAlphaColor(index)),
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
        controller: _movesViewController,
        onPageChanged: (value) {
          setState(() {
            _selectedMoveIndex = value;
          });
        },
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      fixedColor: _bottomNavigationBarItemsColor,
      unselectedItemColor: _bottomNavigationBarItemsColor,
      backgroundColor: _bottomNavigationBarColor,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Analyze',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sync_outlined),
          label: 'Sync',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          label: 'Back',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_forward_ios_rounded),
          label: 'Forward',
        ),
      ],
    );
  }

  // return 1 if _selectedMoveIndex == index,
  // otherwise return a value between 0 and 1
  // depending on the distance between _selectedMoveIndex and index
  double _getMoveAlphaColor(int index) {
    if (_selectedMoveIndex == index) return 1;

    final int distance = (_selectedMoveIndex - index).abs();
    final double alpha = 1 - (distance * 0.15);
    return alpha;
  }
}
