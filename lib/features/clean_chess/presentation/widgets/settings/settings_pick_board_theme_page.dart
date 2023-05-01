import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/utilities/enum_themes.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/data/models/user_settings_model.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/settings/settings_pick_table_page.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:cleanchess/core/utilities/secure_storage_helper.dart'
    as secure_storage_helper;

class SettingsPickBoardThemePage extends StatelessWidget {
  const SettingsPickBoardThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentBoardTheme = sl<UserSettingsModel>().boardTheme;
    return SettingsPickTablePage<BoardTheme>(
      title: 'Board Theme'.hardcoded,
      subtitle: 'Pick a board theme'.hardcoded,
      handlePop: _handlePop,
      items: BoardTheme.values,
      currentSelectedItemIdentifier: currentBoardTheme.name,
      itemBuilder: (index) => const SizedBox.shrink(),
      cellItemBuilder: (item, index) => Container(
        color: getCellColor(
          index,
          boardSize: 5,
          whiteColor: item.lightColor,
          blackColor: item.darkColor,
        ),
      ),
      onGetItemIdentifier: (item) => item.name,
    );
  }

  Future<void> _handlePop(String identifier) async {
    final selectedBoard =
        BoardTheme.values.firstWhere((element) => element.name == identifier);
    sl<UserSettingsModel>().setBoardTheme = selectedBoard;
    await secure_storage_helper.saveBoardTheme(selectedBoard);
  }
}
