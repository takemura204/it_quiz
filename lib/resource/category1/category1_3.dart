import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category1_3 {
  final quizItems = [
    QuizItem(
      question: '従業員がキャリア開発のために自身のスキルや経験を管理するためのデータベースは何か？',
      ans: 'CDP',
      choices: ["CDP", "メンタルヘルス", "HRテック", "MBO"],
      comment:
          "CDP（Career Development Planning）は、従業員が自身のスキルや経験、キャリア目標などを管理し、キャリア開発を計画するための個人データベースやプロセス。",
    ),
    QuizItem(
      question: '従業員の精神的健康を保つための取り組みは何と呼ばれるか？',
      ans: 'メンタルヘルス',
      choices: ["メンタルヘルス", "CDP", "HRテック", "MBO"],
      comment: "メンタルヘルスは、従業員の精神的健康やストレスマネジメントに関する取り組みで、職場の生産性や従業員の満足度向上に貢献する。",
    ),
    QuizItem(
      question: '人事管理を効率化するために利用されるテクノロジーは何か？',
      ans: 'HRテック',
      choices: ["HRテック", "メンタルヘルス", "CDP", "MBO"],
      comment:
          "HRテック（Human Resources Technology）は、採用、評価、教育訓練などの人事管理プロセスを効率化するために利用されるテクノロジー。",
    ),
    QuizItem(
      question: '従業員と管理職が目標を共有し、評価する管理手法は何か？',
      ans: 'MBO',
      choices: ["MBO", "HRテック", "メンタルヘルス", "CDP"],
      comment:
          "MBO（Management by Objectives）は、従業員と管理職が目標を共有し、その達成を目指して行動する管理手法。",
    ),
    QuizItem(
      question: '組織内の人材管理全般を指す言葉は何か？',
      ans: 'HRM',
      choices: ["HRM", "MBO", "HRテック", "メンタルヘルス"],
      comment:
          "HRM（Human Resource Management）は、採用、教育訓練、評価、報酬など、組織内の人材管理全般を指す言葉。",
    ),
    QuizItem(
      question: '従業員が退職しないように留める取り組みは何か？',
      ans: 'リテンション',
      choices: ["リテンション", "HRM", "MBO", "HRテック"],
      comment:
          "リテンションは、従業員が組織に長く留まり、離職しないようにするための取り組み。従業員満足度の向上やエンゲージメントの強化が目的。",
    ),
    QuizItem(
      question: '組織内の才能ある人材を発見し、育成し、維持するプロセスは何か？',
      ans: 'タレントマネジメント',
      choices: ["タレントマネジメント", "リテンション", "HRM", "MBO"],
      comment: "タレントマネジメントは、組織内の才能ある人材を発見し、育成し、維持することを目的とした戦略的なプロセス。",
    ),
    QuizItem(
      question: '従業員が仕事に没頭し、熱心に取り組む状態は何と呼ばれるか？',
      ans: 'ワークエンゲージメント',
      choices: ["ワークエンゲージメント", "タレントマネジメント", "リテンション", "HRM"],
      comment: "ワークエンゲージメントは、従業員が自らの仕事に対して熱心に取り組み、高いモチベーションを持つ状態。",
    ),
    QuizItem(
      question: '仕事と私生活の調和を目指す考え方は何か？',
      ans: 'ワークライフバランス',
      choices: ["ワークライフバランス", "ワークエンゲージメント", "タレントマネジメント", "リテンション"],
      comment: "ワークライフバランスは、仕事と私生活の両方に満足できるように調和を図ることを目指す考え方。",
    ),
    QuizItem(
      question: '多様な個性や価値観を尊重し、活用する経営戦略は何か？',
      ans: 'ダイバーシティ',
      choices: ["ダイバーシティ", "ワークライフバランス", "ワークエンゲージメント", "タレントマネジメント"],
      comment:
          "ダイバーシティ（Diversity）は、性別、年齢、国籍、文化、価値観など、多様な個性や背景を持つ人々を尊重し、その能力や特性を組織の成長に活用する経営戦略。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 21 + 1000);
  });
}
