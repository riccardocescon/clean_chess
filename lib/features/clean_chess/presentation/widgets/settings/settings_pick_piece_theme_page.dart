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
  const SettingsPickPieceThemePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PieceTheme pieceTheme = sl<UserSettingsModel>().pieceTheme;
    final BoardTheme boardTheme = sl<UserSettingsModel>().boardTheme;
    return SettingsPickTablePage<PieceTheme>(
      title: 'Piece Theme'.hardcoded,
      subtitle: 'Pick a piece theme'.hardcoded,
      handlePop: _handlePop,
      items: PieceTheme.values,
      currentSelectedItemIdentifier: pieceTheme.name,
      itemBuilder: (index) => const SizedBox.shrink(),
      cellItemBuilder: (item, index) {
        final path = _getAssetPath(index, item);
        return Container(
          color: getCellColor(
            index,
            boardSize: 5,
            whiteColor: boardTheme.lightColor,
            blackColor: boardTheme.darkColor,
          ),
          child: path == null ? null : SvgPicture.asset(path),
        );
      },
      onGetItemIdentifier: (item) => item.name,
    );
  }

  String? _getAssetPath(int index, PieceTheme item) {
    final paths = {
      0: '${item.location}bR.svg',
      1: '${item.location}bN.svg',
      2: '${item.location}bB.svg',
      3: '${item.location}bQ.svg',
      4: '${item.location}bK.svg',
      5: '${item.location}bP.svg',
      6: '${item.location}bP.svg',
      7: '${item.location}bP.svg',
      8: '${item.location}bP.svg',
      9: '${item.location}bP.svg',
      15: '${item.location}wP.svg',
      16: '${item.location}wP.svg',
      17: '${item.location}wP.svg',
      18: '${item.location}wP.svg',
      19: '${item.location}wP.svg',
      20: '${item.location}wR.svg',
      21: '${item.location}wN.svg',
      22: '${item.location}wB.svg',
      23: '${item.location}wQ.svg',
      24: '${item.location}wK.svg',
    };
    return paths[index];
  }

  Future<void> _handlePop(String identifier) async {
    final selectedPiece =
        PieceTheme.values.firstWhere((element) => element.name == identifier);
    sl<UserSettingsModel>().setPieceTheme = selectedPiece;
    await secure_storage_helper.savePieceTheme(selectedPiece);
  }
}
