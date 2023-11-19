import 'package:kentei_quiz/model/quiz/quiz.dart';

class I18n {
  static I18n? _instance;

  I18n._();

  factory I18n() => _instance ??= I18n._();

  ///アプリ全体
  String get appName => "Kentei Quiz";

  ///category
  String setCategory(int categoryId) {
    switch (categoryId) {
      case 1:
        return category1;
      case 2:
        return category2;
      case 3:
        return category3;
      case 4:
        return category4;
      case 5:
        return styleWeakQuiz;
      case 6:
        return styleTestQuiz;
      default:
        return 'その他';
    }
  }

  String get category1 => "特性";

  String get category2 => "健康";

  String get category3 => "生活";

  String get category4 => "雑学";

  ///title
  String get titleStudy => "クイズ";

  String get titleSearch => "検索";

  String get titleDashboard => "スコア";

  String get titleSetting => "マイページ";

  ///「学ぶ」形式
  String get styleLeanQuiz => "用語を覚える";

  String get styleChoiceQuiz => "クイズに挑戦する";

  String get styleWeakQuiz => "苦手克服";

  String get styleTestQuiz => "力だめし";

  String challengeQuiz(String quizStyle) {
    return "$quizStyleに挑戦する";
  }

  ///HomeQuiz
  String quizCorrectRate(int correctRate) {
    return "正解率:$correctRate％";
  }

  String get lastQuizResult => "前回の挑戦結果";

  ///Button
  String get buttonConfirm => "確認する";

  String get buttonKnow => "知ってる";

  String get buttonUnKnow => "知らない";

  String studyTypeText(StudyType studyType) {
    switch (studyType) {
      case StudyType.learn:
        return styleLeanQuiz;
      case StudyType.choice:
        return styleChoiceQuiz;
      default:
        return caseHideText9;
    }
  }

  /// 問題画面
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

  /// テキスト候補
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
