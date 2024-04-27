part of '../quizzes_resource.dart';

extension Category1Quiz on QuizModel {
  ///問題ジャンル
  List<Quiz> get category1QuizList {
    final quizList = [
      Quiz(
        title: "【頻出】ストラテジ系①",
        quizItemList: category0_1,
        isPremium: false,
      ),
      Quiz(
        title: "【頻出】ストラテジ系②",
        quizItemList: category0_2,
        isPremium: false,
      ),
      Quiz(
        title: "【頻出】ストラテジ系③",
        quizItemList: category0_3,
        isPremium: false,
      ),
      Quiz(
        title: "経営・組織論",
        quizItemList: category1_1,
      ),
      Quiz(
        title: "業務分析・データ利活用",
        quizItemList: category1_2,
      ),
      Quiz(
        title: "分析・データ活用",
        quizItemList: category1_3,
      ),
      Quiz(
        title: "知的財産権",
        quizItemList: category1_4,
      ),
      Quiz(
        title: "セキュリティ関連法規",
        quizItemList: category1_5,
      ),
      Quiz(
        title: "労働関連・取引関連法規",
        quizItemList: category1_6,
      ),
      Quiz(
        title: "その他の法律・ガイドライン",
        quizItemList: category1_7,
      ),
      Quiz(
        title: "標準化関連",
        quizItemList: category1_8,
      ),
      Quiz(
        title: "経営戦略手法",
        quizItemList: category1_9,
      ),
      Quiz(
        title: "マーケティング",
        quizItemList: category1_10,
      ),
      Quiz(
        title: "ビジネス戦略と目標・評価",
        quizItemList: category1_11,
      ),
      Quiz(
        title: "経営管理システム",
        quizItemList: category1_12,
      ),
      Quiz(
        title: "技術開発戦略の立案・技術開発計画",
        quizItemList: category1_13,
      ),
      Quiz(
        title: "ビジネスシステム",
        quizItemList: category1_14,
      ),
      Quiz(
        title: "エンジニアリングシステム",
        quizItemList: category1_15,
      ),
      Quiz(
        title: "e-ビジネス",
        quizItemList: category1_16,
      ),
      Quiz(
        title: "IoTシステム・組込みシステム",
        quizItemList: category1_17,
      ),
      Quiz(
        title: "情報システム戦略",
        quizItemList: category1_18,
      ),
      Quiz(
        title: "業務プロセス",
        quizItemList: category1_19,
      ),
      Quiz(
        title: "ソリューションビジネス",
        quizItemList: category1_20,
      ),
      Quiz(
        title: "システム活用促進・評価",
        quizItemList: category1_21,
      ),
      Quiz(
        title: "システム企画",
        quizItemList: category1_22,
      ),
    ];
    return List.generate(quizList.length, (index) {
      return quizList[index].copyWith(
          categoryId: 1,
          category: I18n().setCategory(1),
          id: index + I18n().category1Index + 1);
    });
  }
}
