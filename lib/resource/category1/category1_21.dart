import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///システム活用促進・評価
List<QuizItem> get category1_21 {
  final quizItems = [
    QuizItem(
      word: 'ITリテラシ',
      question: '情報リテラシーに該当するものはどれか。',
      ans: '業務に必要なデータを検索し，目的に合わせて活用できること',
      choices: [
        "PCの新製品情報，各機種の性能を知っていること",
        "技術革新が社会に及ぼす影響を洞察できること",
        "業務に必要なデータを検索し，目的に合わせて活用できること",
        "高度なプログラム言語を使ってソフトウェアを開発できること"
      ],
      comment:
          "ITリテラシは、情報と識字を合わせた言葉で、PCを利用して情報の整理・蓄積や分析などを行ったり、インターネットなどを使って必要な情報を適切に収集・評価・発信したりするなどの、情報を活用する能力。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'ゲーミフィケーション',
      question: 'ゲームの要素を非ゲームのコンテキストに応用することで、ユーザーの関与を高める手法を何というか？',
      ans: 'ゲーミフィケーション',
      choices: ["ITリテラシ", "ゲーミフィケーション", "ディジタルディバイド", "ディジタルネイティブ"],
      comment:
          "ゲーミフィケーションは、ゲームの要素（ポイント、バッジ、ランキングなど）を非ゲームのコンテキスト（教育、マーケティング、健康管理など）に応用し、ユーザーの関与やモチベーションを高める手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ディジタルディバイド',
      question: '情報を活用できる環境や能力の差によって，待遇や収入などの格差が生じることを表すものはどれか。',
      ans: 'ディジタルディバイド',
      choices: ["情報バリアフリー", "情報リテラシー", "デジタルディバイド", "データマイニング"],
      comment:
          "ディジタルディバイドは、インターネットやコンピュータなどの情報技術へのアクセスや利用スキルにおける格差が、人々や地域間で社会的な分断を生じさせる現象。",
      source: '平成27年秋期 問16',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'ディジタルネイティブ',
      question: 'デジタル技術に囲まれた環境で育った世代を指す用語は何か？',
      ans: 'ディジタルネイティブ',
      choices: ["ディジタルディバイド", "ディジタルネイティブ", "レガシーシステム", "SaaS"],
      comment:
          "ディジタルネイティブは、生まれたときからデジタル技術（インターネット、スマートフォンなど）に囲まれ、それらを自然に利用する世代を指す。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: 'レガシーシステム',
      question: '古くから使われているが、更新が難しいシステムや技術を何というか？',
      ans: 'レガシーシステム',
      choices: ["ディジタルネイティブ", "レガシーシステム", "クラウドコンピューティング", "IaaS"],
      comment:
          "レガシーシステムは、古くから使われているが、新しい技術やシステムへの更新が困難なために現役で使われ続けているITシステムや技術を指す。",
      importance: QuizImportanceType.low,
    ),
  ];
  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 2101);
  });
}
