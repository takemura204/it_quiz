part of '../quizzes_resource.dart';

extension Category3Quiz on QuizModel {
  ///問題ジャンル
  List<Quiz> get category3QuizList {
    final quizList = [
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
        title: "プログラム言語①",
        quizItemList: category3_5,
      ),
      Quiz(
        title: "プログラム言語②",
        quizItemList: category3_6,
      ),
      Quiz(
        title: "プロセッサ・メモリ①",
        quizItemList: category3_7,
      ),
      Quiz(
        title: "プロセッサ・メモリ②",
        quizItemList: category3_8,
      ),
      Quiz(
        title: "入出力デバイス①",
        quizItemList: category3_9,
      ),
      Quiz(
        title: "入出力デバイス②",
        quizItemList: category3_10,
      ),
      Quiz(
        title: "システムの構成",
        quizItemList: category3_11,
      ),
      Quiz(
        title: "システムの評価指標①",
        quizItemList: category3_12,
      ),
      Quiz(
        title: "システムの評価指標②",
        quizItemList: category3_13,
      ),
      Quiz(
        title: "オペレーティングシステム",
        quizItemList: category3_14,
      ),
      Quiz(
        title: "ファイルシステム",
        quizItemList: category3_15,
      ),
      Quiz(
        title: "コンピュータ・入出力装置①",
        quizItemList: category3_16,
      ),
      Quiz(
        title: "コンピュータ・入出力装置②",
        quizItemList: category3_17,
      ),
      Quiz(
        title: "情報デザイン",
        quizItemList: category3_18,
      ),
      Quiz(
        title: "インタフェース設計①",
        quizItemList: category3_19,
      ),
      Quiz(
        title: "インタフェース設計②",
        quizItemList: category3_20,
      ),
      Quiz(
        title: "マルチメディア技術①",
        quizItemList: category3_21,
      ),
      Quiz(
        title: "マルチメディア技術②",
        quizItemList: category3_22,
      ),
      Quiz(
        title: "マルチメディア応用①",
        quizItemList: category3_23,
      ),
      Quiz(
        title: "データベース方式・設計",
        quizItemList: category3_24,
      ),
      Quiz(
        title: "トランザクション処理",
        quizItemList: category3_25,
      ),
      Quiz(
        title: "ネットワーク方式①",
        quizItemList: category3_26,
      ),
      Quiz(
        title: "ネットワーク方式②",
        quizItemList: category3_27,
      ),
      Quiz(
        title: "ネットワーク方式③",
        quizItemList: category3_28,
      ),
      Quiz(
        title: "通信プロトコル",
        quizItemList: category3_29,
      ),
      Quiz(
        title: "ネットワーク応用①",
        quizItemList: category3_30,
      ),
      Quiz(
        title: "ネットワーク応用②",
        quizItemList: category3_31,
      ),
      Quiz(
        title: "ネットワーク応用③",
        quizItemList: category3_32,
      ),
      Quiz(
        title: "情報セキュリティ①",
        quizItemList: category3_33,
      ),
      Quiz(
        title: "情報セキュリティ②",
        quizItemList: category3_34,
      ),
      Quiz(
        title: "情報セキュリティ③",
        quizItemList: category3_35,
      ),
      Quiz(
        title: "情報セキュリティ④",
        quizItemList: category3_36,
      ),
      Quiz(
        title: "情報セキュリティ⑤",
        quizItemList: category3_37,
      ),
      Quiz(
        title: "情報セキュリティ管理①",
        quizItemList: category3_38,
      ),
      Quiz(
        title: "情報セキュリティ管理②",
        quizItemList: category3_39,
      ),
      Quiz(
        title: "実装技術①",
        quizItemList: category3_40,
      ),
      Quiz(
        title: "実装技術②",
        quizItemList: category3_41,
      ),
      Quiz(
        title: "実装技術③",
        quizItemList: category3_42,
      ),
      Quiz(
        title: "実装技術④",
        quizItemList: category3_43,
      ),
      Quiz(
        title: "実装技術⑤",
        quizItemList: category3_44,
      ),
    ];
    return List.generate(quizList.length, (index) {
      return quizList[index].copyWith(
          categoryId: 3, category: I18n().setCategory(3), id: index + 1 + 300);
    });
  }
}
