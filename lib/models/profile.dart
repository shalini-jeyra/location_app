import 'dart:convert';

enum ThemeColor { Red, Green, Blue }
enum TextSize { Small, Medium, Large }

class Profile {
  final String name;
  final double latitude;
  final double longitude;
  final ThemeColor themeColor;
  final TextSize textSize;

  Profile({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.themeColor,
    required this.textSize,
  });
}