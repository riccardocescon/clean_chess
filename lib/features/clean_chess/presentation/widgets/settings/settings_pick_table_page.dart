import 'package:flutter/material.dart';

import '../titled_app_bar.dart';

class SettingsPickTablePage<T> extends StatefulWidget {
  const SettingsPickTablePage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.items,
    required this.currentSelectedItemIdentifier,
    required this.itemBuilder,
    required this.cellItemBuilder,
    required this.onGetItemIdentifier,
    this.handlePop,
  });

  final String title;
  final String subtitle;
  final List<T> items;
  final String currentSelectedItemIdentifier;
  final Widget Function(int) itemBuilder;
  final Widget Function(T, int) cellItemBuilder;
  final String Function(T) onGetItemIdentifier;
  final Future<void> Function(String)? handlePop;

  @override
  State<SettingsPickTablePage<T>> createState() =>
      _SettingsPickTablePageState<T>();
}

class _SettingsPickTablePageState<T> extends State<SettingsPickTablePage<T>> {
  double get _boardSize => MediaQuery.of(context).size.width * 0.3;
  final double _selectorPadding = 10;

  late String _selectedIdentifier = widget.currentSelectedItemIdentifier;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: widget.title,
      subtitle: widget.subtitle,
      onPop: () =>
          widget.handlePop?.call(_selectedIdentifier) ?? Future.value(),
      body: _body(),
    );
  }

  Widget _body() {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        for (final item in widget.items) _boardType(item),
      ],
    );
  }

  Widget _boardType(T item) {
    return Column(
      children: [
        _board(item),
        Text(widget.onGetItemIdentifier(item)),
      ],
    );
  }

  Widget _board(T item) {
    final identifier = widget.onGetItemIdentifier(item);
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIdentifier = identifier;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: _boardSize + _selectorPadding * 2,
        padding: EdgeInsets.all(_selectorPadding),
        decoration: BoxDecoration(
          color: identifier == _selectedIdentifier
              ? Colors.grey.withAlpha(100)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: SizedBox(
          width: _boardSize,
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: StatefulBuilder(
                builder: (context, localSetState) {
                  return GridView.count(
                    crossAxisCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      25,
                      (index) => widget.cellItemBuilder(item, index),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
