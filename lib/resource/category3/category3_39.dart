import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_39 {
  final quizItems = [
    QuizItem(
      question: '情報システムが正しく機能し、予想されるサービスを提供する能力は何か？',
      ans: '信頼性',
      choices: ["信頼性", "否認防止", "責任追跡性", "真正性"],
      comment:
          "信頼性は、情報システムが正しく機能し、予想されるサービスを提供する能力、つまり予測可能で信頼できる状態を維持する情報セキュリティの特性。",
    ),
    QuizItem(
      question: '組織が個人情報の適切な管理を実施していることを証明するための制度は何か？',
      ans: 'プライバシーマーク制度',
      choices: ["プライバシーマーク制度", "プライバシーポリシー", "サイバー保険", "情報セキュリティ委員会"],
      comment: "プライバシーマーク制度は、組織が個人情報の適切な管理を実施していることを証明するために、プライバシーマークを取得する制度。",
    ),
    QuizItem(
      question: '組織が個人情報の取り扱いに関する基本的な方針を公表する文書は何か？',
      ans: 'プライバシーポリシー',
      choices: ["プライバシーポリシー", "プライバシーマーク制度", "サイバー保険", "情報セキュリティ委員会"],
      comment: "プライバシーポリシーは、組織が個人情報の取り扱いに関する基本的な方針を公表する文書。",
    ),
    QuizItem(
      question: 'サイバー攻撃による損害から組織を保護するための保険は何か？',
      ans: 'サイバー保険',
      choices: ["サイバー保険", "プライバシーポリシー", "プライバシーマーク制度", "情報セキュリティ委員会"],
      comment:
          "サイバー保険は、サイバー攻撃によるデータの損失やシステムのダウンタイムなど、サイバーリスクによる損害から組織を保護するための保険。",
    ),
    QuizItem(
      question: '組織内で情報セキュリティに関する意思決定を行うための委員会は何か？',
      ans: '情報セキュリティ委員会',
      choices: ["情報セキュリティ委員会", "サイバー保険", "プライバシーポリシー", "プライバシーマーク制度"],
      comment: "情報セキュリティ委員会は、組織内で情報セキュリティに関する方針や対策の意思決定を行うための委員会。",
    ),
    QuizItem(
      question: '組織内のセキュリティインシデントに迅速に対応するためのチームは何か？',
      ans: 'CSIRT',
      choices: ["CSIRT", "SOC", "コンピュータ不正アクセス届出制度", "コンピュータウイルス届出制度"],
      comment:
          "CSIRT（Computer Security Incident Response Team）は、セキュリティインシデントが発生した際に迅速に対応するための専門チーム。",
    ),
    QuizItem(
      question: '組織の情報セキュリティを監視し、管理するための専門部署は何か？',
      ans: 'SOC',
      choices: ["SOC", "CSIRT", "コンピュータ不正アクセス届出制度", "コンピュータウイルス届出制度"],
      comment:
          "SOC（Security Operations Center）は、組織の情報セキュリティを24時間体制で監視し、管理するための専門部署。",
    ),
    QuizItem(
      question: '不正アクセスが発生した際に、それを届け出るための制度は何か？',
      ans: 'コンピュータ不正アクセス届出制度',
      choices: [
        "コンピュータ不正アクセス届出制度",
        "コンピュータウイルス届出制度",
        "ソフトウェア等の脆弱性関連情報に関する届出制度",
        "CSIRT"
      ],
      comment: "コンピュータ不正アクセス届出制度は、不正アクセスが発生した際に、その事実を関連機関に届け出るための制度。",
    ),
    QuizItem(
      question: 'コンピュータウイルスの発生を届け出るための制度は何か？',
      ans: 'コンピュータウイルス届出制度',
      choices: [
        "コンピュータウイルス届出制度",
        "コンピュータ不正アクセス届出制度",
        "ソフトウェア等の脆弱性関連情報に関する届出制度",
        "CSIRT"
      ],
      comment: "コンピュータウイルス届出制度は、コンピュータウイルスの発生を関連機関に届け出るための制度。",
    ),
    QuizItem(
      question: 'ソフトウェアの脆弱性に関する情報を届け出るための制度は何か？',
      ans: 'ソフトウェア等の脆弱性関連情報に関する届出制度',
      choices: [
        "ソフトウェア等の脆弱性関連情報に関する届出制度",
        "コンピュータ不正アクセス届出制度",
        "コンピュータウイルス届出制度",
        "CSIRT"
      ],
      comment: "ソフトウェア等の脆弱性関連情報に関する届出制度は、ソフトウェアやシステムの脆弱性に関する情報を関連機関に届け出るための制度。",
    ),
    QuizItem(
      question: '日本のサイバーセキュリティに関する情報共有のためのプラットフォームは何か？',
      ans: 'J-CSIP',
      choices: ["J-CSIP", "J-CRAT", "SECURITY ACTION", "CSIRT"],
      comment:
          "J-CSIP（Japan Cybersecurity Information Platform）は、日本におけるサイバーセキュリティに関する情報共有のためのプラットフォーム。",
    ),
    QuizItem(
      question: 'サイバーリスクの自己評価ツールを提供する日本のプロジェクトは何か？',
      ans: 'J-CRAT',
      choices: ["J-CRAT", "J-CSIP", "SECURITY ACTION", "SOC"],
      comment:
          "J-CRAT（Japan Cybersecurity Risk Assessment Tool）は、企業が自身のサイバーリスクを自己評価するためのツールを提供する日本のプロジェクト。",
    ),
    QuizItem(
      question: '企業がセキュリティ対策を実施するための行動指針を提供するイニシアティブは何か？',
      ans: 'SECURITY ACTION',
      choices: ["SECURITY ACTION", "J-CRAT", "J-CSIP", "CSIRT"],
      comment: "SECURITY ACTIONは、企業がセキュリティ対策を実施するための具体的な行動指針や情報を提供するイニシアティブ。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 381 + 3000);
  });
}
