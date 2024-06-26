import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///セキュリティ関連法規
List<QuizItem> get category1_5 {
  final quizItems = [
    QuizItem(
      question: '国におけるサイバーセキュリティの推進に関する基本的な方針を定めた法律は何か？',
      ans: 'サイバーセキュリティ基本法',
      choices: ["サイバーセキュリティ基本法", "不正アクセス禁止法", "個人情報保護法", "マイナンバー法"],
      comment: "サイバーセキュリティ基本法は、国のサイバーセキュリティに関する基本的な方針や体制の整備などを定めた法律。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '個人の情報を保護するための法律は何か？',
      ans: '個人情報保護法',
      choices: ["個人情報保護法", "サイバーセキュリティ基本法", "不正アクセス禁止法", "プロバイダ責任制限法"],
      comment: "個人情報保護法は、個人情報の適正な取り扱いや保護を規定し、個人の権利と利益を守るための法律。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '個人情報を取り扱う事業者のことを何というか？',
      ans: '個人情報取扱事業者',
      choices: ["個人情報取扱事業者", "情報セキュリティ管理者", "データコントローラー", "プロセッサー"],
      comment: "個人情報取扱事業者は、個人情報を取り扱う事業の実施者であり、個人情報保護法に基づき適切な情報管理が求められる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '個人情報の保護を専門的に行う独立した行政委員会は何か？',
      ans: '個人情報保護委員会',
      choices: ["個人情報保護委員会", "情報セキュリティ委員会", "データ保護委員会", "サイバーセキュリティ対策本部"],
      comment: "個人情報保護委員会は、個人情報の保護に関する政策の企画・立案や監視・指導等を行うために設置された独立行政委員会。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '個人を識別するために用いられる情報を何というか？',
      ans: '個人識別符号',
      choices: ["個人識別符号", "個人情報", "機微情報", "要配慮情報"],
      comment: "個人識別符号は、個人を識別するために用いられる番号や記号などの情報で、特定の個人を識別することができる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '特に注意して取り扱う必要のある個人情報を何というか？',
      ans: '要配慮個人情報',
      choices: ["要配慮個人情報", "一般個人情報", "敏感個人情報", "保護個人情報"],
      comment: "要配慮個人情報は、人種、信条、社会的身分、医療履歴、犯罪歴などの特に注意して取り扱う必要のある個人情報。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '個人を特定できないよう加工された情報を何というか？',
      ans: '匿名加工情報',
      choices: ["匿名加工情報", "非個人化情報", "脱個人情報", "アノニマイズド情報"],
      comment:
          "匿名加工情報は、特定の個人を識別することができないように加工された情報で、元の個人情報からは個人を特定できない状態になっている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '事前に同意を得て個人情報を収集・利用することを何というか？',
      ans: 'オプトイン',
      choices: ["オプトイン", "オプトアウト", "インフォームドコンセント", "プライバシーコンセント"],
      comment: "オプトインは、事前に利用者の同意を得てから個人情報を収集・利用するシステムや方針を指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '事前に提供を拒否する権利を行使することを何というか？',
      ans: 'オプトアウト',
      choices: ["オプトイン", "オプトアウト", "プライバシーポリシー", "データプロテクション"],
      comment: "オプトアウトは、個人情報の収集・利用に対して、事前にまたは事後に拒否の意志を表明することができるシステムや方針を指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '日本の国民に一人一つずつ与えられる番号制度の法律は何か？',
      ans: 'マイナンバー法',
      choices: ["マイナンバー法", "個人情報保護法", "社会保障・税番号制度法", "公的個人認証法"],
      comment:
          "マイナンバー法は、全ての日本国民及び日本に住む外国人に一人一つずつ固有の番号（マイナンバー）を与え、社会保障、税、災害対策の効率化を目的とした制度の法律。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'EUにおける個人データの保護に関する規則は何か？',
      ans: '一般データ保護規則',
      choices: ["一般データ保護規則", "個人情報保護法", "データプライバシー法", "サイバーセキュリティ法"],
      comment: "一般データ保護規則（GDPR）は、ヨーロッパ連合（EU）における個人データの保護とプライバシーの強化を目的とした法規則。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '個人が自分に関する情報を削除する権利を何というか？',
      ans: '消去権',
      choices: ["アクセス権", "訂正権", "消去権", "データポータビリティ権"],
      comment: "消去権（忘れられる権利）は、個人が自分に関する情報を保有する事業者に対して、特定の条件の下でその情報の削除を要求する権利。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '特定の電子メールの送信を規制する法律は何か？',
      ans: '特定電子メール法',
      choices: [
        "特定電子メール法",
        "不正アクセス禁止法",
        "サイバーセキュリティ基本法",
        "情報通信網利用促進及び情報保護等に関する法律"
      ],
      comment: "特定電子メール法は、迷惑メール対策として、無差別や大量の広告メールの送信を規制するための法律。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'コンピュータウイルスの作成や提供を禁止する行為を定めた罪は何か？',
      ans: 'ウイルス作成罪',
      choices: ["ウイルス作成罪", "データ改ざん罪", "不正アクセス罪", "サイバー犯罪罪"],
      comment: "ウイルス作成罪は、コンピュータウイルスを作成、提供、保有することを禁止し、これらの行為に対する罰則を定めた罪。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '情報システムの適切な管理を目的とした企業や組織の基準を何というか？',
      ans: 'システム管理基準',
      choices: ["システム管理基準", "情報セキュリティポリシー", "プライバシーマネジメントシステム", "情報セキュリティ管理基準"],
      comment: "システム管理基準は、情報システムのセキュリティを確保し、適切な運用や管理を行うために企業や組織が定める一連の基準やポリシー。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '企業の経営層がサイバーセキュリティを経営の一部として取り組むためのガイドラインは何か？',
      ans: 'サイバーセキュリティ経営ガイドライン',
      choices: [
        "サイバーセキュリティ経営ガイドライン",
        "情報セキュリティポリシー",
        "サイバーセキュリティ基本方針",
        "情報セキュリティ管理基準"
      ],
      comment:
          "サイバーセキュリティ経営ガイドラインは、企業の経営層がサイバーセキュリティを経営戦略の一部として組み込み、実践するための指針やガイドライン。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '情報セキュリティを維持するために企業や組織が定めるべき基準は何か？',
      ans: '情報セキュリティ管理基準',
      choices: ["情報セキュリティ管理基準", "プライバシーポリシー", "データ保護基準", "セキュリティガバナンス"],
      comment:
          "情報セキュリティ管理基準は、情報資産の保護や情報セキュリティインシデントの予防・対応を目的として、企業や組織が定める一連の管理基準やポリシー。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'サイバー空間と物理空間のセキュリティ対策を統合的に行うための枠組みを何というか？',
      ans: 'サイバー・フィジカル・セキュリティ対策フレームワーク',
      choices: [
        "情報セキュリティガバナンス",
        "サイバーセキュリティポリシー",
        "サイバー・フィジカル・セキュリティ対策フレームワーク",
        "統合セキュリティ管理フレームワーク"
      ],
      comment:
          "サイバー・フィジカル・セキュリティ対策フレームワークは、サイバー空間だけでなく物理空間におけるセキュリティ対策も統合的に考慮し、全体的なセキュリティ強化を目指すための枠組み。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'インターネットサービス提供者がユーザーの行為によって生じた損害に対する責任を限定する法律は何か？',
      ans: 'プロバイダ責任制限法',
      choices: ["プロバイダ責任制限法", "電子情報通信法", "不正アクセス禁止法", "情報セキュリティ法"],
      comment:
          "プロバイダ責任制限法は、インターネットサービス提供者（ISP）が、ユーザーの違法な行為によって第三者に損害が生じた場合の責任を一定の条件下で限定するための法律。",
      importance: QuizImportanceType.normal,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 501);
  });
}
