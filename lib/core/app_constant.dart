import 'package:flutter/widgets.dart';
import 'package:math_riddle/data/model/language.dart';
import 'package:math_riddle/data/model/option.dart';

enum GameType {
  numpad,
  option,
  imageOption,
}

const List<Option> abcdOption = [
  Option(name: "A"),
  Option(name: "B"),
  Option(name: "C"),
  Option(name: "D"),
];

const List<Option> abcdefOption = [
  Option(name: "A"),
  Option(name: "B"),
  Option(name: "C"),
  Option(name: "D"),
  Option(name: "E"),
  Option(name: "F"),
];

const List<Language> languageList = [
  Language(
    name: "English",
    flag: "🇺🇸",
    locale: Locale('en', ''),
  ),
  Language(
    name: "Spanish",
    flag: "🇪🇸",
    locale: Locale('es', ''),
  ),
  Language(
    name: "French",
    flag: "🇫🇷",
    locale: Locale('fr', ''),
  ),
  Language(
    name: "Russian",
    flag: "🇷🇺",
    locale: Locale('ru', ''),
  ),
  Language(
    name: "Portuguese",
    flag: "🇵🇹",
    locale: Locale('pt', ''),
  ),
  Language(
    name: "Indonesian",
    flag: "🇮🇩",
    locale: Locale('id', ''),
  ),
  Language(
    name: "Korean",
    flag: "🇰🇷",
    locale: Locale('ko', ''),
  ),
  Language(
    name: "Italian",
    flag: "🇮🇹",
    locale: Locale('it', ''),
  ),
];
