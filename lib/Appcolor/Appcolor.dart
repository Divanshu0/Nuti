import 'dart:ui';

class AppColor {
  static Color btncolor = HexColor("#F0E8D7");
  static Color a = HexColor("#E7EAF3");
  static Color b = HexColor("#C2AE65");
  static Color c = HexColor("#F0E8D5");
  static Color d = HexColor("#F4F6FA");
  static Color e = HexColor("#0A1640");
  static Color f = HexColor("#000000");
  static Color g = HexColor("#3164F4");
  static Color h = HexColor("#D9D9D9");
  static Color i = HexColor("#F0F3FF");
  static Color j = HexColor("#F2F2F2");
  static Color k = HexColor("#04534E");
  static Color l = HexColor("#E7FFFD");
  static Color m = HexColor("#EAEAEA");
  static Color n = HexColor("#F8F7FF");
  static Color o = HexColor("#626262");
  static Color buttoncolor = HexColor("#DA7535");
  static Color p = HexColor("#666161");
  static Color textfield = HexColor("#F5F5F5");
  static Color iconback = HexColor("#E58649");
  static Color border = HexColor("#E2E2E2");
  static Color cuttext = HexColor("#D3A07F");
  static Color onemin = HexColor("#808080");
  static Color editpro = HexColor("#3F9CFF");
  static Color bar = HexColor("#E9E9E9");
  static Color address = HexColor("#0085FF");
  static Color backgound = HexColor("F4F6FA");
  static Color z = HexColor("EDEDED");
  static Color a12 = HexColor("758C86");
  static Color profile = HexColor("D9D9D9");
  static Color line = HexColor("DADADA");


}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}