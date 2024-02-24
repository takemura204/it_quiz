import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_2 {
  final quizItems = [
    QuizItem(
      question: '企業活動に関わる利害関係者を総称して何というか？',
      ans: 'ステークホルダ',
      choices: ["ステークホルダ", "コーポレートブランド", "PDCA", "OODAループ"],
      comment: "ステークホルダは、企業活動に関わる利害関係者（株主、従業員、顧客、地域社会など）を総称する言葉。",
    ),
    QuizItem(
      question: '企業の総合的な価値やイメージを構築するためのブランドは何か？',
      ans: 'コーポレートブランド',
      choices: ["コーポレートブランド", "ステークホルダ", "PDCA", "OODAループ"],
      comment: "コーポレートブランドは、企業の総合的な価値やイメージを構築し、外部に伝えるためのブランド。",
    ),
    QuizItem(
      question: '計画・実行・評価・改善のサイクルを回すことで、継続的な改善を目指す手法は何か？',
      ans: 'PDCA',
      choices: ["PDCA", "コーポレートブランド", "ステークホルダ", "OODAループ"],
      comment:
          "PDCAサイクルは、計画（Plan）、実行（Do）、評価（Check）、改善（Act）のプロセスを繰り返すことで、業務やプロジェクトの継続的な改善を目指す手法。",
    ),
    QuizItem(
      question: '観察・指向・決定・行動のサイクルを通じて、迅速な意思決定と行動を促す概念は何か？',
      ans: 'OODAループ',
      choices: ["OODAループ", "PDCA", "コーポレートブランド", "ステークホルダ"],
      comment:
          "OODAループ（Observe, Orient, Decide, Act）は、状況を迅速に把握し、適切な意思決定と行動を促すための概念。",
    ),
    QuizItem(
      question: '災害や緊急事態が発生した際に事業を継続させるための計画は何か？',
      ans: 'BCP',
      choices: ["BCP", "BCM", "OODAループ", "PDCA"],
      comment:
          "BCP（Business Continuity Plan）は、災害や緊急事態が発生した際に、事業の継続や迅速な復旧を目指すための計画。",
    ),
    QuizItem(
      question: '事業継続性を確保するための組織的な管理プロセスは何か？',
      ans: 'BCM',
      choices: ["BCM", "BCP", "OODAループ", "PDCA"],
      comment:
          "BCM（Business Continuity Management）は、事業の継続性を確保し、災害や緊急事態からの迅速な回復を目指すための組織的な管理プロセス。",
    ),
    QuizItem(
      question: '職場で実際の業務を通じて行われる教育訓練は何か？',
      ans: 'OJT',
      choices: ["OJT", "Off-JT", "e-ラーニング", "アダプティブラーニング"],
      comment: "OJT（On-the-Job Training）は、職場での実務を通じて、実際の業務環境の中で行われる教育訓練。",
    ),
    QuizItem(
      question: '職場外で行われる教育訓練、例えばセミナーや研修などは何と呼ばれるか？',
      ans: 'Off-JT',
      choices: ["Off-JT", "OJT", "e-ラーニング", "アダプティブラーニング"],
      comment:
          "Off-JT（Off-the-Job Training）は、職場外で行われる教育訓練で、セミナーや研修など、職場を離れて行われる学習活動を指す。",
    ),
    QuizItem(
      question: 'インターネットを利用して行われる学習のことを何というか？',
      ans: 'e-ラーニング',
      choices: ["e-ラーニング", "Off-JT", "OJT", "アダプティブラーニング"],
      comment: "e-ラーニングは、インターネットやコンピュータを利用して行われる遠隔教育やオンライン学習のこと。",
    ),
    QuizItem(
      question: '学習者の能力や進捗に応じて学習内容を自動的に調整する学習形態は何か？',
      ans: 'アダプティブラーニング',
      choices: ["アダプティブラーニング", "e-ラーニング", "Off-JT", "OJT"],
      comment: "アダプティブラーニングは、学習者の能力や進捗に応じて、学習内容や進行速度を自動的に調整する個別最適化学習形態。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 1 + 10001);
  });
}
