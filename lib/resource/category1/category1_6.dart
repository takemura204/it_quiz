import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///労働関連・取引関連法規
List<QuizItem> get category1_6 {
  final quizItems = [
    QuizItem(
      question: '労働者の最低労働条件を定め、労働者の健康と福祉を保護する日本の法律は何か？',
      ans: '労働基準法',
      choices: ["労働基準法", "労働契約法", "労働者派遣法", "独占禁止法"],
      comment:
          "労働基準法は、労働者の最低限の労働条件を定め、労働時間、休日、休暇、賃金、安全衛生など労働者の健康と福祉を保護するための法律。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '労働時間の開始と終了時刻を労働者が自由に設定できる労働制度を何というか？',
      ans: 'フレックスタイム制',
      choices: ["裁量労働制", "フレックスタイム制", "シフト制", "定時制"],
      comment: "フレックスタイム制は、一定のコアタイムを除き、労働者が労働時間の開始と終了時刻を自由に設定できる労働時間制度。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '労働時間に関わらず、労働の成果によって評価される労働制度を何というか？',
      ans: '裁量労働制',
      choices: ["フレックスタイム制", "裁量労働制", "変形労働時間制", "タスク制"],
      comment: "裁量労働制は、労働者が自らの裁量で仕事の進め方を決めることができ、労働時間ではなく成果によって評価される労働制度。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '労働者と使用者間の労働条件を定める契約の内容を規定する法律は何か？',
      ans: '労働契約法',
      choices: ["労働基準法", "労働契約法", "労働者派遣法", "最低賃金法"],
      comment: "労働契約法は、労働契約の締結、変更、解除など労働者と使用者間の労働条件に関する契約の内容を規定する法律。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '労働者を他の事業者に派遣して働かせることを規制する法律は何か？',
      ans: '労働者派遣法',
      choices: ["労働基準法", "労働契約法", "労働者派遣法", "独占禁止法"],
      comment: "労働者派遣法は、労働者を他の事業者に派遣して働かせる派遣労働に関するルールや条件を定めることで、派遣労働者の保護を図る法律。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '事業上の秘密を守るために、従業員が秘密情報を外部に漏らさないことを約束する契約を何というか？',
      ans: '守秘義務契約',
      choices: ["守秘義務契約", "非競争契約", "業務委託契約", "秘密保持契約"],
      comment: "守秘義務契約は、従業員や取引先などが事業上の秘密情報を外部に漏洩しないよう義務付ける契約。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '消費者トラブルを防ぐために、特定の商取引に関する情報の提供を義務付ける法律は何か？',
      ans: '特定商取引法',
      choices: ["消費者契約法", "特定商取引法", "独占禁止法", "下請法"],
      comment:
          "特定商取引法は、通信販売や訪問販売など特定の商取引において、事業者が消費者に対して適切な情報を提供することを義務付けることで、消費者トラブルを防ぐための法律。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '企業間の公正な競争を保つために、独占の禁止や不当な取引制限の禁止を定める法律は何か？',
      ans: '独占禁止法',
      choices: ["独占禁止法", "公正取引法", "競争促進法", "商慣行法"],
      comment: "独占禁止法は、企業間の公正な競争を確保し、消費者の利益を守るために、独占やカルテルなどの競争を制限する行為を禁止する法律。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'デジタルプラットフォーム事業者の透明性と公正性を向上させるために設けられた日本の法律は何か？',
      ans: '特定デジタルプラットフォームの透明性',
      choices: ["特定デジタルプラットフォームの透明性", "下請代金支払遅延等防止法", "資金決済法", "金融商品取引法"],
      comment:
          "特定デジタルプラットフォームの透明性及び公正性の向上に関する法律は、大手デジタルプラットフォーム事業者の取引透明性を確保し、公正な市場環境を促進することを目的としている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '下請け業者への代金支払いを適正に行うことを義務付ける日本の法律は何か？',
      ans: '下請代金支払遅延等防止法',
      choices: ["下請代金支払遅延等防止法", "金融商品取引法", "資金決済法", "製造物責任法"],
      comment: "下請代金支払遅延等防止法は、下請け業者への代金支払いを適正に行うことを義務付け、遅延や不当な取引条件の防止を目的とする法律。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '電子決済サービスや仮想通貨に関する取引を規制し、利用者保護を目的とする日本の法律は何か？',
      ans: '資金決済法',
      choices: ["資金決済法", "下請代金支払遅延等防止法", "特定デジタルプラットフォームの透明性", "金融商品取引法"],
      comment: "資金決済法は、プリペイドカードや電子マネー、仮想通貨などの資金決済サービスの提供条件を規制し、利用者保護を図るための法律。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '金融商品の取引に関して投資家保護を目的として設けられている日本の法律は何か？',
      ans: '金融商品取引法',
      choices: ["金融商品取引法", "資金決済法", "下請代金支払遅延等防止法", "製造物責任法"],
      comment: "金融商品取引法は、証券取引の透明性を確保し、不正取引を防止することで投資家を保護する目的の法律。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '使用済み製品の再利用やリサイクルを促進するために設けられている日本の法律は何か？',
      ans: 'リサイクル法',
      choices: ["リサイクル法", "製造物責任法", "金融商品取引法", "特定商取引法"],
      comment:
          "リサイクル法は、使用済みの製品や廃材を再利用し、リサイクルすることを促進するために設けられている法律。これにより、環境保護と資源の持続的な利用が図られる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '製品による損害が発生した際、製造者の責任を定める法律は何か？',
      ans: '製造物責任法',
      choices: ["製造物責任法", "資金決済法", "金融商品取引法", "下請代金支払遅延等防止法"],
      comment: "製造物責任法（PL法）は、製品に欠陥があった場合に、製造者が消費者に対して損害賠償責任を負うことを定めた法律。",
      importance: QuizImportanceType.normal,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 601);
  });
}
