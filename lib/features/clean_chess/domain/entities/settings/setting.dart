import 'package:cleanchess/core/utilities/mixins/nameable.dart';
import 'package:flutter/cupertino.dart';

abstract class Setting {
  final String name;
  final IconData icon;

  Setting({required this.name, required this.icon});
}

abstract class SwitchSetting extends Setting {
  late bool value;
  SwitchSetting(
      {required String name, required IconData icon, required this.value})
      : super(name: name, icon: icon);
}

abstract class ButtonsSetting<T extends Namable> extends Setting {
  final List<T> options;
  late int _value;
  ButtonsSetting({
    required String name,
    required IconData icon,
    required this.options,
    required T value,
  })  : _value = options.indexOf(value),
        super(name: name, icon: icon);

  T get value => options[_value];
  int get valueIndex => _value;
  set setDirectValue(int value) => _value = value;
  set setValueByReference(T value) => _value = options.indexOf(value);
}
