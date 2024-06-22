import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_23 {
  final quizItems = [
    QuizItem(
      word: 'リスクマネジメント',
      question: '情報セキュリティにおけるリスクマネジメントに関する記述のうち，最も適切なものはどれか。',
      ans: '組織の全員が役割を分担して，組織全体で取り組む。',
      choices: [
        "最終責任者は，現場の情報セキュリティ管理担当者の中から選ぶ。",
        "組織の業務から切り離した単独の活動として行う。",
        "組織の全員が役割を分担して，組織全体で取り組む。",
        "一つのマネジメントシステムの下で各部署に個別の基本方針を定め，各部署が独立して実施する。"
      ],
      comment:
          "リスクマネジメントは、組織体の活動に伴い発生するあらゆるリスクを、統合的、包括的、戦略的に把握、評価、最適化し、価値の最大化を図る手法のことで、リスクアセスメントとリスク対応がある。",
      source: '平成25年春期 問71',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'リスクアセスメント',
      question: '組織がセキュリティリスクのレベルを評価するために行うプロセスは何か？',
      ans: 'リスクアセスメント',
      choices: ["リスクアセスメント", "リスクマネジメント", "リスク対応情報", "セキュリティポリシー"],
      comment: "リスクアセスメントは、リスクの特定、リスクの影響と発生確率の評価を行うプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'リスク対応',
      question: 'リスクに対処するための選択肢や行動計画を含む情報は何か？',
      ans: 'リスク対応',
      choices: ["リスク対応", "リスクマネジメント", "リスクアセスメント", "セキュリティポリシー"],
      comment: "リスク対応情報は、特定されたリスクに対して取るべき行動や対策の選択肢を含む情報。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '情報セキュリティポリシー',
      question: '組織で策定する情報セキュリティポリシーに関する記述のうち，最も適切なものはどれか。',
      ans: '組織内の複数の部門で異なる情報セキュリティ対策を実施する場合でも，情報セキュリティ基本方針は組織全体で統一させるべきである。',
      choices: [
        "情報セキュリティ基本方針だけでなく，情報セキュリティに関する規則や手順の策定も経営者が行うべきである。",
        "情報セキュリティ基本方針だけでなく，情報セキュリティに関する規則や手順も社外に公開することが求められている。",
        "情報セキュリティに関する規則や手順は組織の状況にあったものにすべきであるが，最上位の情報セキュリティ基本方針は業界標準の雛(ひな)形をそのまま採用することが求められている。",
        "組織内の複数の部門で異なる情報セキュリティ対策を実施する場合でも，情報セキュリティ基本方針は組織全体で統一させるべきである。"
      ],
      comment:
          "情報セキュリティポリシーは、企業や組織として一貫したセキュリティ対策を行うために、技術的対策だけでなく、利用・運用面、管理面、組織体制をも含めた、企業や組織のセキュリティ方針と対策の基準を示したもの。",
      source: '平成26年秋期 問61',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: '機密性',
      question: '情報セキュリティの機密性を直接的に高めることになるものはどれか。',
      ans: '機密情報のファイルを暗号化し，漏えいしても解読されないようにする。',
      choices: [
        "一日の業務の終了時に機密情報のファイルの操作ログを取得し，漏えいの痕跡がないことを確認する。",
        "機密情報のファイルにアクセスするときに，前回のアクセス日付が適正かどうかを確認する。",
        "機密情報のファイルはバックアップを取得し，情報が破壊や改ざんされてもバックアップから復旧できるようにする。",
        "機密情報のファイルを暗号化し，漏えいしても解読されないようにする。"
      ],
      comment:
          "機密性は、情報セキュリティマネジメントの概念の一要素で、許可された正規のユーザだけが情報にアクセスできる特性を示し、アクセス権をもたない者からのアクセスを遮断し、情報改ざん、不正情報の混入や漏えいを防止することで高まる。",
      source: '平成25年秋期 問75',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: '完全性',
      question: '情報セキュリティにおける"完全性"が損なわれる行為はどれか。',
      ans: 'Webページの改ざん',
      choices: ["DoS攻撃", "Webページの改ざん", "サーバの各ポートへの順次アクセス", "ネットワークを流れるデータの盗聴"],
      comment:
          "完全性は、情報セキュリティマネジメントの概念の一要素で、情報が完全で、改ざん・破壊されていない特性を示し、データや情報の正確性、正当性、網羅性、一貫性を維持することが重要。",
      source: '平成22年秋期 問53',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: '可用性',
      question: '情報セキュリティにおいて，可用性が損なわれる事象はどれか。',
      ans: '取引先との電子決済システムがDoS攻撃を受け，処理ができなくなった。',
      choices: [
        "機密情報のコピーが格納されたUSBメモリが盗難にあった。",
        "顧客情報管理システムの顧客情報が誤った内容のまま運用されていた。",
        "社内のサーバに不正侵入されて，社外秘の情報が漏えいした。",
        "取引先との電子決済システムがDoS攻撃を受け，処理ができなくなった。"
      ],
      comment:
          "可用性は、情報セキュリティマネジメントの概念の一要素で、障害が発生しても安定したサービスを提供でき、ユーザーが必要な時にシステムを利用可能である特性を示す。",
      source: '平成28年春期 問83',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: '真正性',
      question: '情報や取引の当事者が本物であることを保証する特性は何か？',
      ans: '真正性',
      choices: ["真正性", "機密性", "完全性", "可用性"],
      comment: "真正性は、情報や取引の当事者が本物であり、偽装されていないことを保証する情報セキュリティの特性。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '責任追跡性',
      question: '行動やイベントの実施者を特定できる特性は何か？',
      ans: '責任追跡性',
      choices: ["責任追跡性", "否認防止", "信頼性", "機密性"],
      comment: "責任追跡性は、行動やイベントが誰によって実施されたかを特定できる情報セキュリティの特性。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '否認防止',
      question: '行為者が自身の行為を否認できないようにする特性は何か？',
      ans: '否認防止',
      choices: ["否認防止", "責任追跡性", "真正性", "信頼性"],
      comment: "否認防止は、行為者が自身の行為（例えば、送信したメッセージや行った取引）を否認できないようにする情報セキュリティの特性。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '信頼性',
      question: '情報システムが正しく機能し、予想されるサービスを提供する能力は何か？',
      ans: '信頼性',
      choices: ["信頼性", "否認防止", "責任追跡性", "真正性"],
      comment:
          "信頼性は、情報システムが正しく機能し、予想されるサービスを提供する能力、つまり予測可能で信頼できる状態を維持する情報セキュリティの特性。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'プライバシーマーク制度',
      question: 'プライバシーマークを取得している事業者が，個人情報保護に関する理念や取組みを内外に宣言する文書はどれか。',
      ans: '個人情報保護方針',
      choices: ["個人情報保護ガイドライン", "個人情報保護規程", "個人情報保護方針", "個人情報保護マニュアル"],
      comment:
          "プライバシーマーク制度は、個人情報を適切に取り扱っている企業を公的機関が認定する制度で、個人情報を適切に扱う社内体制を整備していると認められた企業だけが名刺や店頭などにマークを使用できる。",
      source: '平成23年特別 問30',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'プライバシーポリシー',
      question: '組織が個人情報の取り扱いに関する基本的な方針を公表する文書は何か？',
      ans: 'プライバシーポリシー',
      choices: ["プライバシーポリシー", "プライバシーマーク制度", "サイバー保険", "情報セキュリティ委員会"],
      comment: "プライバシーポリシーは、組織が個人情報の取り扱いに関する基本的な方針を公表する文書。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'サイバー保険',
      question: 'サイバー攻撃による損害から組織を保護するための保険は何か？',
      ans: 'サイバー保険',
      choices: ["サイバー保険", "プライバシーポリシー", "プライバシーマーク制度", "情報セキュリティ委員会"],
      comment:
          "サイバー保険は、サイバー攻撃によるデータの損失やシステムのダウンタイムなど、サイバーリスクによる損害から組織を保護するための保険。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '情報セキュリティ委員会',
      question: '組織内で情報セキュリティに関する意思決定を行うための委員会は何か？',
      ans: '情報セキュリティ委員会',
      choices: ["情報セキュリティ委員会", "サイバー保険", "プライバシーポリシー", "プライバシーマーク制度"],
      comment: "情報セキュリティ委員会は、組織内で情報セキュリティに関する方針や対策の意思決定を行うための委員会。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'CSIRT（Computer Security Incident Response Team）',
      question: '組織内のセキュリティインシデントに迅速に対応するためのチームは何か？',
      ans: 'CSIRT',
      choices: ["CSIRT", "SOC", "コンピュータ不正アクセス届出制度", "コンピュータウイルス届出制度"],
      comment:
          "CSIRT（Computer Security Incident Response Team）は、セキュリティインシデントが発生した際に迅速に対応するための専門チーム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'SOC（Security Operations Center）',
      question: '組織の情報セキュリティを監視し、管理するための専門部署は何か？',
      ans: 'SOC',
      choices: ["SOC", "CSIRT", "コンピュータ不正アクセス届出制度", "コンピュータウイルス届出制度"],
      comment:
          "SOC（Security Operations Center）は、組織の情報セキュリティを24時間体制で監視し、管理するための専門部署。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'コンピュータ不正アクセス届出制度',
      question: '不正アクセスが発生した際に、それを届け出るための制度は何か？',
      ans: 'コンピュータ不正アクセス届出制度',
      choices: [
        "コンピュータ不正アクセス届出制度",
        "コンピュータウイルス届出制度",
        "ソフトウェア等の脆弱性関連情報に関する届出制度",
        "CSIRT"
      ],
      comment: "コンピュータ不正アクセス届出制度は、不正アクセスが発生した際に、その事実を関連機関に届け出るための制度。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'コンピュータウイルス届出制度',
      question: 'コンピュータウイルスの発生を届け出るための制度は何か？',
      ans: 'コンピュータウイルス届出制度',
      choices: [
        "コンピュータウイルス届出制度",
        "コンピュータ不正アクセス届出制度",
        "ソフトウェア等の脆弱性関連情報に関する届出制度",
        "CSIRT"
      ],
      comment: "コンピュータウイルス届出制度は、コンピュータウイルスの発生を関連機関に届け出るための制度。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ソフトウェア等の脆弱性関連情報に関する届出制度',
      question: 'ソフトウェアの脆弱性に関する情報を届け出るための制度は何か？',
      ans: 'ソフトウェア等の脆弱性関連情報に関する届出制度',
      choices: [
        "ソフトウェア等の脆弱性関連情報に関する届出制度",
        "コンピュータ不正アクセス届出制度",
        "コンピュータウイルス届出制度",
        "CSIRT"
      ],
      comment: "ソフトウェア等の脆弱性関連情報に関する届出制度は、ソフトウェアやシステムの脆弱性に関する情報を関連機関に届け出るための制度。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'J-CSIP',
      question: '日本のサイバーセキュリティに関する情報共有のためのプラットフォームは何か？',
      ans: 'J-CSIP',
      choices: ["J-CSIP", "J-CRAT", "SECURITY ACTION", "CSIRT"],
      comment:
          "J-CSIP（Japan Cybersecurity Information Platform）は、日本におけるサイバーセキュリティに関する情報共有のためのプラットフォーム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'J-CRAT',
      question: 'サイバーリスクの自己評価ツールを提供する日本のプロジェクトは何か？',
      ans: 'J-CRAT',
      choices: ["J-CRAT", "J-CSIP", "SECURITY ACTION", "SOC"],
      comment:
          "J-CRAT（Japan Cybersecurity Risk Assessment Tool）は、企業が自身のサイバーリスクを自己評価するためのツールを提供する日本のプロジェクト。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'SECURITY ACTION',
      question: '企業がセキュリティ対策を実施するための行動指針を提供するイニシアティブは何か？',
      ans: 'SECURITY ACTION',
      choices: ["SECURITY ACTION", "J-CRAT", "J-CSIP", "CSIRT"],
      comment: "SECURITY ACTIONは、企業がセキュリティ対策を実施するための具体的な行動指針や情報を提供するイニシアティブ。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 2301);
  });
}
