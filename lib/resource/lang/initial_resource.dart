class I18n {
  static I18n? _instance;

  I18n._();

  factory I18n() => _instance ??= I18n._();

  ///アプリ全体
  String get appName => "Kentei Quiz";

  ///title
  String get titleStudy => "学ぶ";
  String get titleReview => "復習";
  String get titleTest => "テスト";
  String get titleSetting => "設定";

  ///「学ぶ」形式
  String get styleLeanQuiz => "一問一答で学習する";
  String get styleChoiceQuiz => "4択クイズで挑戦する";
  String get styleTrueFalseQuiz => "◯×クイズで挑戦する";

  ///「復習形式」
  String get reviewLearnQuiz => "一問一答を復習する";
  String get reviewChoiceQuiz => "選択問題を復習する";
  String get reviewTrueFalseQuiz => "○×問題を復習する";

  ///Button
  String get buttonConfirm => "確認する";
  String get buttonKnow => "知っている";
  String get buttonUnKnow => "知らない";

  ///　問題画面
  String hideText(String ans) {
    switch (ans.length) {
      case 1:
        return caseHideText1;
      case 2:
        return caseHideText2;
      case 3:
        return caseHideText3;
      case 4:
        return caseHideText4;
      case 5:
        return caseHideText5;
      case 6:
        return caseHideText6;
      case 7:
        return caseHideText7;
      case 8:
        return caseHideText8;
      case 9:
        return caseHideText8;
      default:
        return caseHideText9;
    }
  }

  ///　テキスト候補
  String get caseHideText1 => "＿";
  String get caseHideText2 => "＿＿";
  String get caseHideText3 => "＿＿＿";
  String get caseHideText4 => "＿＿＿＿";
  String get caseHideText5 => "＿＿＿＿＿";
  String get caseHideText6 => "＿＿＿＿＿＿";
  String get caseHideText7 => "＿＿＿＿＿＿";
  String get caseHideText8 => "＿＿＿＿＿＿＿";
  String get caseHideText9 => "＿＿＿＿＿＿＿＿";

  ///　ログインエラー
  String loginErrorText(String errorText) {
    switch (errorText) {
      case "[firebase_auth/email-already-in-use] The email address is already in use by another account.":
        return caseErrorText1;
      case "[firebase_auth/invalid-email] The email address is badly formatted.":
        return caseErrorText2;
      case "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.":
        return caseErrorText3;
      case "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.":
        return caseErrorText4;
      default:
        return caseErrorText5;
    }
  }

  ///　テキスト候補
  String get caseErrorText1 => "このメールアドレスは既に登録済みです";
  String get caseErrorText2 => "このメールアドレスは無効となっています";
  String get caseErrorText3 => "このメールアドレスは登録されていません。新規登録画面からお願いします";
  String get caseErrorText4 => "メールアドレスまたはパスワードが正しくありません";
  String get caseErrorText5 => "予期せぬエラーが発生しました";
}
