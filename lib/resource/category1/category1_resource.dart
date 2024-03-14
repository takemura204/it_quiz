part of '../quizzes_resource.dart';

extension Category1Quiz on QuizModel {
  ///問題ジャンル
  List<Quiz> get category1QuizList {
    final quizList = [
      Quiz(
        title: "経営・組織論①",
        quizItemList: category1_1,
      ),
      Quiz(
        title: "経営・組織論②",
        quizItemList: category1_2,
      ),
      Quiz(
        title: "経営・組織論③",
        quizItemList: category1_3,
      ),
      Quiz(
        title: "経営・組織論④",
        quizItemList: category1_4,
      ),
      Quiz(
        title: "経営・組織論⑤",
        quizItemList: category1_5,
      ),
      Quiz(
        title: "分析・データ活用①",
        quizItemList: category1_6,
      ),
      Quiz(
        title: "分析・データ活用②",
        quizItemList: category1_7,
      ),
      Quiz(
        title: "分析・データ活用③",
        quizItemList: category1_8,
      ),
      Quiz(
        title: "分析・データ活用④",
        quizItemList: category1_9,
      ),
      Quiz(
        title: "分析・データ活用⑤",
        quizItemList: category1_10,
      ),
      Quiz(
        title: "会計・財務①",
        quizItemList: category1_11,
      ),
      Quiz(
        title: "会計・財務②",
        quizItemList: category1_12,
      ),
      Quiz(
        title: "知的財産権①",
        quizItemList: category1_13,
      ),
      Quiz(
        title: "知的財産権②",
        quizItemList: category1_14,
      ),
      Quiz(
        title: "セキュリティ関連法規①",
        quizItemList: category1_15,
      ),
      Quiz(
        title: "セキュリティ関連法規②",
        quizItemList: category1_16,
      ),
      Quiz(
        title: "労働関連・取引関連法規",
        quizItemList: category1_17,
      ),
      Quiz(
        title: "ガイドライン",
        quizItemList: category1_18,
      ),
      Quiz(
        title: "標準化関連①",
        quizItemList: category1_19,
      ),
      Quiz(
        title: "標準化関連②",
        quizItemList: category1_20,
      ),
      Quiz(
        title: "経営戦略手法①",
        quizItemList: category1_21,
      ),
      Quiz(
        title: "経営戦略手法②",
        quizItemList: category1_22,
      ),
      Quiz(
        title: "経営戦略手法③",
        quizItemList: category1_23,
      ),
      Quiz(
        title: "マーケティング①",
        quizItemList: category1_24,
      ),
      Quiz(
        title: "マーケティング②",
        quizItemList: category1_25,
      ),
      Quiz(
        title: "マーケティング③",
        quizItemList: category1_26,
      ),
      Quiz(
        title: "マーケティング④",
        quizItemList: category1_27,
      ),
      Quiz(
        title: "経営管理システム",
        quizItemList: category1_28,
      ),
      Quiz(
        title: "技術戦略マネジメント①",
        quizItemList: category1_29,
      ),
      Quiz(
        title: "技術戦略マネジメント②",
        quizItemList: category1_30,
      ),
      Quiz(
        title: "エンジニアリングシステム",
        quizItemList: category1_31,
      ),
      Quiz(
        title: "e-ビジネス①",
        quizItemList: category1_32,
      ),
      Quiz(
        title: "e-ビジネス②",
        quizItemList: category1_33,
      ),
      Quiz(
        title: "IoTシステム・組込みシステム①",
        quizItemList: category1_34,
      ),
      Quiz(
        title: "IoTシステム・組込みシステム②",
        quizItemList: category1_35,
      ),
      Quiz(
        categoryId: 1,
        category: I18n().setCategory(1),
        title: "業務プロセス①",
        quizItemList: category1_36,
      ),
      Quiz(
        title: "業務プロセス②",
        quizItemList: category1_37,
      ),
      Quiz(
        title: "ソリューションビジネス",
        quizItemList: category1_38,
      ),
      Quiz(
        title: "システム活用促進・評価",
        quizItemList: category1_39,
      ),
      Quiz(
        title: "システム企画",
        quizItemList: category1_40,
      ),
    ];
    return List.generate(quizList.length, (index) {
      return quizList[index].copyWith(
          categoryId: 1, category: I18n().setCategory(1), id: index + 1 + 100);
    });
  }
}
