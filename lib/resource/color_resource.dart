import 'package:flutter/material.dart';

class AppColor {
  static const MaterialColor skin0 = MaterialColor(0xFF52C2CD, {
    100: Color(0xFFDAF2F4),
    200: Color(0xFF9FDEE3),
    300: Color(0xFF52C2CD),
    400: Color(0xFF3F959D),
  });

  static const MaterialColor skin1 = MaterialColor(0xFF52C2CD, {
    100: Color(0xFFDAF2F4),
    200: Color(0xFF9FDEE3),
    300: Color(0xFF52C2CD),
    400: Color(0xFF3F959D),
  });

  static const MaterialColor skin2 = MaterialColor(0xffFC9797, {
    100: Color(0xffFEE9E9),
    200: Color(0xffFDC5C5),
    300: Color(0xffFC9797),
    400: Color(0xffCC6E6E),
  });

  static const MaterialColor skin3 = MaterialColor(0xffFA9F00, {
    100: Color(0xffFFEBC9),
    200: Color(0xffFFCB70),
    300: Color(0xffFA9F00),
    400: Color(0xffC07A00),
  });

  static const MaterialColor skin4 = MaterialColor(0xff374142, {
    100: Color(0xFFDAF2F4),
    200: Color(0xFF9FDEE3),
    300: Color(0xff374142),
    400: Color(0xFF3F959D),
  });

  static const MaterialColor skin5 = MaterialColor(0xff2E4180, {
    100: Color(0xFFDAF2F4),
    200: Color(0xFF9FDEE3),
    300: Color(0xff2E4180),
    400: Color(0xFF3F959D),
  });

  static const MaterialColor skin6 = MaterialColor(0xff52C2CD, {
    100: Color(0xffDAF2F4),
    200: Color(0xff9FDEE3),
    300: Color(0xff52C2CD),
    400: Color(0xff3F959D),
  });

  static const MaterialColor skin7 = MaterialColor(0xffFE9158, {
    100: Color(0xffF4E4DC),
    200: Color(0xffE3B7A0),
    300: Color(0xffFE9158),
    400: Color(0xff9D5F3F),
  });

  static Color getSkinTurnColor(int skinId) {
    if (skinId == 0 ||
        skinId == 1 ||
        skinId == 2 ||
        skinId == 3 ||
        skinId == 6 ||
        skinId == 7) {
      return const Color(0xff374142);
    } else {
      return const Color(0xffFFFFFF);
    }
  }

  static const MaterialColor main = MaterialColor(0xFF52C2CD, {
    100: Color(0xFFDAF2F4),
    200: Color(0xFF9FDEE3),
    300: Color(0xFF52C2CD),
    400: Color(0xFF3F959D),
    700: Color(0xFF3F959D),
  });

  static const MaterialColor background = MaterialColor(0xFFF8FAFA, {
    100: Color(0xFFF8FAFA),
    200: Color(0xFFF8FAFA),
    300: Color(0xFFF8FAFA),
    400: Color(0xFFF8FAFA),
  });

  static const MaterialColor white = MaterialColor(0xFFFFFFFF, {
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
  });

  static const MaterialColor black = MaterialColor(0xFF374142, {
    100: Color(0xFF374142),
    200: Color(0xFF374142),
    300: Color(0xFF374142),
    400: Color(0xFF374142),
  });

  static const MaterialColor gray = MaterialColor(0xFF374142, {
    100: Color(0xFFEAEEEF),
    200: Color(0xFFCAD5D6),
    300: Color(0xFFA4B6B8),
    400: Color(0xFF768D8F),
  });

  static const Color gray100 = Color(0xFFEAEEEF);

  static const Color gray200 = Color(0xFFCAD5D6);

  static const Color gray300 = Color(0xFFA4B6B8);

  static const Color gray400 = Color(0xFF768D8F);

  static const MaterialColor accent = MaterialColor(0xFFF87951, {
    100: Color(0xFFF87951),
    200: Color(0xFFF87951),
    300: Color(0xFFF87951),
    400: Color(0xFFF87951),
  });
}
