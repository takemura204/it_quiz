part of '../quizzes_resource.dart';

extension Category3Quiz on QuizModel {
  ///問題ジャンル
  List<Quiz> get category3QuizList {
    final quizList = [
      Quiz(
        title: "【頻出】構成要素",
        quizItemList: category0_3_1,
        isPremium: false,
      ),
      Quiz(
        title: "【頻出】ソフトウェア",
        quizItemList: category0_3_2,
        isPremium: false,
      ),
      Quiz(
        title: "【頻出】ネットワーク",
        quizItemList: category0_3_3,
        isPremium: false,
      ),
      Quiz(
        title: "【頻出】セキュリティ",
        quizItemList: category0_3_4,
        isPremium: false,
      ),
      Quiz(
        title: "応用数学",
        quizItemList: category3_1,
      ),
      Quiz(
        title: "情報に関する理論",
        quizItemList: category3_2,
      ),
      Quiz(
        title: "データ構造",
        quizItemList: category3_3,
      ),
      Quiz(
        title: "アルゴリズム",
        quizItemList: category3_4,
      ),
      Quiz(
        title: "プログラム言語",
        quizItemList: category3_5,
      ),
      Quiz(
        title: "プロセッサ・メモリ",
        quizItemList: category3_6,
      ),
      Quiz(
        title: "入出力デバイス",
        quizItemList: category3_7,
      ),
      Quiz(
        title: "システムの構成",
        quizItemList: category3_8,
      ),
      Quiz(
        title: "システムの評価指標",
        quizItemList: category3_9,
      ),
      Quiz(
        title: "オペレーティングシステム",
        quizItemList: category3_10,
      ),
      Quiz(
        title: "ファイルシステム",
        quizItemList: category3_11,
      ),
      Quiz(
        title: "コンピュータ・入出力装置",
        quizItemList: category3_12,
      ),
      Quiz(
        title: "情報デザイン",
        quizItemList: category3_13,
      ),
      Quiz(
        title: "インタフェース設計",
        quizItemList: category3_14,
      ),
      Quiz(
        title: "マルチメディア技術",
        quizItemList: category3_15,
      ),
      Quiz(
        title: "マルチメディア応用",
        quizItemList: category3_16,
      ),
      Quiz(
        title: "データベース方式・設計",
        quizItemList: category3_17,
      ),
      Quiz(
        title: "トランザクション処理",
        quizItemList: category3_18,
      ),
      Quiz(
        title: "ネットワーク方式",
        quizItemList: category3_19,
      ),
      Quiz(
        title: "通信プロトコル",
        quizItemList: category3_20,
      ),
      Quiz(
        title: "ネットワーク応用",
        quizItemList: category3_21,
      ),
      Quiz(
        title: "情報セキュリティ",
        quizItemList: category3_22,
      ),
      Quiz(
        title: "情報セキュリティ管理",
        quizItemList: category3_23,
      ),
      Quiz(
        title: "実装技術",
        quizItemList: category3_24,
      ),
    ];
    return List.generate(quizList.length, (index) {
      return quizList[index].copyWith(
          categoryId: 3,
          category: I18n().setCategory(3),
          id: index + I18n().category3Index + 1);
    });
  }
}
