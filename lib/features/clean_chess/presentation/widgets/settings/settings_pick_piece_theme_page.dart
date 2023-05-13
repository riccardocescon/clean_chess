import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/utilities/enum_pieces.dart';
import 'package:cleanchess/core/utilities/enum_themes.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/data/models/user_settings_model.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/settings/settings_pick_table_page.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:cleanchess/core/utilities/secure_storage_helper.dart'
    as secure_storage_helper;
import 'package:flutter_svg/svg.dart';

class SettingsPickPieceThemePage extends StatelessWidget {
  SettingsPickPieceThemePage({
    super.key,
  });

  final PieceTheme pieceTheme = sl<UserSettingsModel>().pieceTheme;

  final BoardTheme boardTheme = sl<UserSettingsModel>().boardTheme;

  @override
  Widget build(BuildContext context) {
    return SettingsPickTablePage<PieceTheme>(
      title: 'Piece Theme'.hardcoded,
      subtitle: 'Pick a piece theme'.hardcoded,
      handlePop: _handlePop,
      items: PieceTheme.values,
      currentSelectedItemIdentifier: pieceTheme.name,
      itemBuilder: (index) => const SizedBox.shrink(),
      cellItemBuilder: (item, index) => Container(
        color: getCellColor(
          index,
          boardSize: 5,
          whiteColor: boardTheme.lightColor,
          blackColor: boardTheme.darkColor,
        ),
        child: index == 0
            ? SvgPicture.asset(
                '${item.location}bR.svg',
              )
            : index == 1
                ? SvgPicture.asset('${item.location}bN.svg')
                : index == 2
                    ? SvgPicture.asset('${item.location}bB.svg')
                    : index == 3
                        ? SvgPicture.asset('${item.location}bQ.svg')
                        : index == 4
                            ? SvgPicture.asset('${item.location}bK.svg')
                            : index < 10
                                ? SvgPicture.asset('${item.location}bP.svg')
                                : index > 14 && index < 20
                                    ? SvgPicture.asset('${item.location}wP.svg')
                                    : index == 20
                                        ? SvgPicture.asset(
                                            '${item.location}wR.svg')
                                        : index == 21
                                            ? SvgPicture.asset(
                                                '${item.location}wN.svg')
                                            : index == 22
                                                ? SvgPicture.asset(
                                                    '${item.location}wB.svg')
                                                : index == 23
                                                    ? SvgPicture.asset(
                                                        '${item.location}wQ.svg')
                                                    : index == 24
                                                        ? SvgPicture.asset(
                                                            '${item.location}wK.svg')
                                                        : null,
      ),
      onGetItemIdentifier: (item) => item.name,
    );
  }

  Future<void> _handlePop(String identifier) async {
    await secure_storage_helper.savePieceTheme(
      PieceTheme.values.firstWhere(
        (element) => element.name == identifier,
      ),
    );
  }
}
