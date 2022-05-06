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
  String get quizOneQuestion => "一問一答で学習する";
  String get quizFourChoice => "4択クイズで挑戦する";
  String get quizTrueFalse => "◯×クイズで挑戦する";
  String get quizFillBlank => "穴埋めクイズで挑戦する";

  ///Button
  String get buttonConfirm => "確認する";
}
