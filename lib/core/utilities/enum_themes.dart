import 'package:flutter/material.dart';

enum BoardTheme {
  blue('Blue', Color(0xFFdee3e6), Color(0xFF8ca2ad)),
  blue2('Blue 2', Color(0xFF8297ad), Color(0xFF5f748a)),
  blue3('Blue 3', Color(0xFFc3ced8), Color(0xFF4676ab)),
  blueMarble('Blue Marble', Color(0xFFe6e3de), Color(0xFF99a5b5)),
  canvas('Canvas', Color(0xFFced0e1), Color(0xFF6f7f9c)),
  brown('Brown', Color(0xFFd9a25d), Color(0xFFb48965)),
  leather('Leather', Color(0xFFcbcac1), Color(0xFFbe8b11)),
  green('Green', Color(0xFFfffedb), Color(0xFF85a665)),
  marble('Marble', Color(0xFF7f9581), Color(0xFF627862)),
  greenPlastic('Green Plastic', Color(0xFFf1f6b3), Color(0xFF57955c)),
  grey('Grey', Color(0xFFaaaaaa), Color(0xFF888888)),
  metal('Metal', Color(0xFFaeaeae), Color(0xFF838383)),
  olive('Olive', Color(0xFFaea795), Color(0xFF857e6c)),
  newspaper('Newspaper', Color(0xFFdcdcdc), Color(0xFFc7c7c7)),
  purple('Purple', Color(0xFFa090af), Color(0xFF7e4a8d)),
  purple2('Purple 2', Color(0xFFe7dcf1), Color(0xFF967bb1)),
  pink('Pink', Color(0xFFeff0c2), Color(0xFFf27879)),
  ic('IC', Color(0xFFececec), Color(0xFFc2c18e)),
  horsey('Horsey', Color(0xFFf4e6d1), Color(0xFF8f6548));

  const BoardTheme(this.name, this.lightColor, this.darkColor);

  final String name;
  final Color lightColor;
  final Color darkColor;
}
