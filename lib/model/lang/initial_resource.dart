import '../../untils/enums.dart';

class I18n {
  static I18n? _instance;

  I18n._();

  factory I18n() => _instance ??= I18n._();

  ///アプリ全体
  String get appName => "IT用語クイズ";

  String get appNamePremium => "IT用語クイズ Premium";

  ///category
  String setCategory(int categoryId) {
    switch (categoryId) {
      case 0:
        return category0;
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
        return styleRandomQuiz;
      default:
        return 'その他';
    }
  }

  String get category0 => "頻出単語";

  String get category1 => "ストラテジ系";

  String get category2 => "マネジメント系";

  String get category3 => "テクノロジ系";

  String get category4 => "雑学";

  int get category0Index => 0;

  int get category0_1Index => 1000;

  int get category0_2Index => 2000;

  int get category0_3Index => 3000;

  int get category1Index => 10000;

  int get category2Index => 20000;

  int get category3Index => 30000;

  ///title
  String get titleName => "IT用語クイズ";

  String get titleLearn => "覚える";

  String get titleQuiz => "クイズ";

  String get titleSearch => "検索";

  String get titleDashboard => "スコア";

  String get titleSetting => "設定";

  ///「学ぶ」形式
  String get styleLeanQuiz => "一問一答で覚える";

  String get styleChoiceQuiz => "クイズに挑戦する";

  String get styleWeakQuiz => "苦手克服";

  String get styleRandomQuiz => "ランダム出題";

  String challengeQuiz(String quizStyle) {
    return "$quizStyleに挑戦する";
  }

  ///クイズの状況
  String quizStatusTypeText(QuizStatusType statusType) {
    switch (statusType) {
      case QuizStatusType.correct:
        return '正解済';
      case QuizStatusType.incorrect:
        return '不正解';
      case QuizStatusType.learned:
        return '学習済';
      case QuizStatusType.unlearned:
        return '未学習';
      default:
        return '〇〇';
    }
  }

  ///HomeQuiz
  String quizCorrectRate(int correctRate) {
    return "正解率:$correctRate％";
  }

  String get quizResultAnswer => "正解率";

  String get quizResultProgress => "学習率";

  String get lastWeakResult => "現在の苦手問題数";

  ///Button
  String get buttonConfirm => "確認する";

  String get buttonKnow => "知ってる";

  String get buttonUnKnow => "知らない";

  ///URL
  String get contactUrl => 'https://forms.gle/tt9kz7qFJRsBGtT47';

  ///利用規約
  String get termsUrl =>
      'https://takemurataiki.notion.site/IT-fa92543c55634514b10e177827679675?pvs=4';

  String get privacyPolicyUrl =>
      'https://takemurataiki.notion.site/IT-9dac9d65f24d49dd886c9303892a1cd2?pvs=4';

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

  String quizImportanceText(QuizImportanceType importanceType) {
    switch (importanceType) {
      case QuizImportanceType.none:
        return '☆☆☆';
      case QuizImportanceType.low:
        return '★☆☆';
      case QuizImportanceType.normal:
        return '★★☆';
      case QuizImportanceType.high:
        return '★★★';
      default:
        return '';
    }
  }

  String notificationTitle(int index) {
    switch (index) {
      case 0:
        return "🎓今日のクイズ！";
      case 1:
        return "✨今日のレッスン！";
      case 2:
        return '🎯今日の1問！';
      case 3:
        return "🔥今日のチャレンジ！";
      case 4:
        return "🔍今日の発見！";
      case 5:
        return "🏆今日のミッション！";
      case 6:
        return "📚今日の学習！";
      case 7:
        return "🌟今日の学び！";
      case 8:
        return "📈今日の成長！";
      case 9:
        return "✍️今日の挑戦！";
      case 10:
        return "🗒️️今日の問題！";
      default:
        return '😊今日の問題';
    }
  }

  String notificationText(int index) {
    switch (index) {
      case 0:
        return "クイズに挑戦して、新しいことを学ぼう！";
      case 1:
        return "今日も一歩前進して、始めましょう！";
      case 2:
        return '今日のレッスンをチェック！';
      case 3:
        return "継続は力なり！少しずつ進めていきましょう。";
      case 4:
        return "楽しい学習で新たな知識を！";
      case 5:
        return "あなたの努力が実を結ぶ時。今日も挑戦してみましょう！";
      case 6:
        return "短いレッスンで大きな進歩を。今すぐチェック！";
      case 7:
        return "毎日少しずつでOK。今日のレッスンを始めましょう！";
      case 8:
        return "あなたの学びは一生です。さあ、今日のレッスンへ！";
      case 9:
        return "新しい発見を見つめけていこう！";
      case 10:
        return "新しい発見を見つめけていこう！";
      default:
        return 'あなたの目標に近づくチャンスです！';
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

  String get caseErrorText2 => "このメールアドレスは正しくありません。メールアドレスが正しい形式かご確認の上、もう一度お試しください。";

  String get caseErrorText3 => "このメールアドレスは登録されていません。\n新規登録画面から入力をお願いします。";

  String get caseErrorText4 => "入力したメールアドレスまたはパスワードは正しくありません。\n正しい情報かご確認の上、もう一度お試しください。";

  String get caseErrorText5 => "このアカウントは一時的に無効となってます。\nしばらくしてから、もう一度お試しください。";

  String get caseErrorText6 => "予期せぬエラーが発生しました。\nしばらくしてから、もう一度お試しください。";
}
