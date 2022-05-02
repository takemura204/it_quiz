class I18n {
  static I18n? _instance;

  I18n._();

  factory I18n() => _instance ??= I18n._();

  ///アプリ全体
  String get appName => "Kentei Quiz";

  ///title
  String get titleStudy => "問題";
  String get titleReview => "復習";
  String get titleTest => "テスト";
  String get titleSetting => "設定";

  ///問題形式
  String get ansOneQuestion => "一問一答形式で学習する";
  String get ansFourChoice => "4択形式で挑戦する";
  String get ansTrueFalse => "◯×形式で挑戦する";
  String get ansFillBlank => "穴埋め形式で挑戦する";

  ///BottomNavigationBar

}
