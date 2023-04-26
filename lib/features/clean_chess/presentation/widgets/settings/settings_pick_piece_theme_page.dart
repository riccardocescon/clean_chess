import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/utilities/enum_pieces.dart';
import 'package:cleanchess/core/utilities/enum_themes.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/settings/settings_pick_table_page.dart';
import 'package:flutter/material.dart';
import 'package:cleanchess/core/utilities/secure_storage_helper.dart'
    as secure_storage_helper;

class SettingsPickPieceThemePage extends StatelessWidget {
  const SettingsPickPieceThemePage({
    super.key,
    required this.pieceTheme,
    required this.boardTheme,
  });

  final PieceTheme pieceTheme;
  final BoardTheme boardTheme;

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
            ? Image.asset(
                '${item.location}bR.svg',
              )
            : index == 1
                ? Image.asset('${item.location}bN.svg')
                : index == 2
                    ? Image.asset('${item.location}bB.svg')
                    : index == 3
                        ? Image.asset('${item.location}bQ.svg')
                        : index == 4
                            ? Image.asset('${item.location}bK.svg')
                            : index < 10
                                ? Image.asset('${item.location}bP.svg')
                                : index > 14 && index < 20
                                    ? Image.asset('${item.location}wP.svg')
                                    : index == 20
                                        ? Image.asset('${item.location}wR.svg')
                                        : index == 21
                                            ? Image.asset(
                                                '${item.location}wN.svg')
                                            : index == 22
                                                ? Image.asset(
                                                    '${item.location}wB.svg')
                                                : index == 23
                                                    ? Image.asset(
                                                        '${item.location}wQ.svg')
                                                    : index == 24
                                                        ? Image.asset(
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
