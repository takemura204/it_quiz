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

  ///BottomNavigationBar

}
