class I18n {
  static I18n? _instance;

  I18n._();

  factory I18n() => _instance ??= I18n._();

  ///アプリ全体
  String get appName => "Kentei Quiz";

  ///Group
  String get group1 => "TeamA";
  String get group2 => "TeamB";
  String get group3 => "TeamC";
  String get group4 => "TeamD";

  ///title
  String get titleStudy => "クイズ";
  String get titleReview => "チャレンジ";
  String get titleScore => "スコア";
  String get titleSetting => "マイページ";

  ///「学ぶ」形式
  String get styleLeanQuiz => "一問一答で学習する";
  String get styleChoiceQuiz => "クイズに挑戦する";
  String get styleTestQuiz => "力だめしに挑戦する";

  ///「復習形式」
  String get reviewLearnQuiz => "一問一答を復習する";
  String get reviewChoiceQuiz => "選択問題を復習する";
  String get reviewTrueFalseQuiz => "○×問題を復習する";

  ///Button
  String get buttonConfirm => "確認する";
  String get buttonKnow => "知ってる";
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
  String get caseHideText7 => "＿＿＿＿＿＿＿";
  String get caseHideText8 => "＿＿＿＿＿＿＿＿";
  String get caseHideText9 => "＿＿＿＿＿＿＿＿＿";

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
      case "[firebase_auth/too-many-requests] Access to this account has been temporarily disabled due to many failed login attempts. You can immediately restore it by resetting your password or you can try again later.":
        return caseErrorText5;
      default:
        return caseErrorText6;
    }
  }

  ///　テキスト候補
  String get caseErrorText1 => "このメールアドレスは既に登録済みです。\nログイン画面から入力をお願いします。";
  String get caseErrorText2 =>
      "このメールアドレスは正しくありません。メールアドレスが正しい形式かご確認の上、もう一度お試しください。";
  String get caseErrorText3 => "このメールアドレスは登録されていません。\n新規登録画面から入力をお願いします。";
  String get caseErrorText4 =>
      "入力したメールアドレスまたはパスワードは正しくありません。\n正しい情報かご確認の上、もう一度お試しください。";
  String get caseErrorText5 => "このアカウントは一時的に無効となってます。\nしばらくしてから、もう一度お試しください。";
  String get caseErrorText6 => "予期せぬエラーが発生しました。\nしばらくしてから、もう一度お試しください。";
}
