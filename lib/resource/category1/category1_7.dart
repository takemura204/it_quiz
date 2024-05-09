import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///その他の法律・ガイドライン
List<QuizItem> get category1_7 {
  final quizItems = [
    QuizItem(
      question: '企業が法令や社内規則を遵守するための体制や取り組みを何というか？',
      ans: 'コンプライアンス',
      choices: ["コンプライアンス", "コーポレートガバナンス", "ネチケット", "ソーシャルメディアポリシー"],
      comment: "コンプライアンスは、企業が法令や社内規則、倫理規定などを遵守することを確保するための体制や取り組みを指す。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'インターネット上での礼儀やマナーを指す言葉は何か？',
      ans: 'ネチケット',
      choices: ["ネチケット", "コンプライアンス", "フェイクニュース", "チェーンメール"],
      comment:
          "ネチケットは、インターネット上でのコミュニケーションにおける礼儀やマナーを指す造語で、「ネット」と「エチケット」の組み合わせ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '企業が従業員のSNS利用に関するルールを定めた指針を何というか？',
      ans: 'ソーシャルメディアポリシー',
      choices: ["ソーシャルメディアポリシー", "ネチケット", "コーポレートガバナンス", "コンプライアンス"],
      comment: "ソーシャルメディアポリシーは、企業が従業員のソーシャルメディアの利用に関して定めたルールや指針のこと。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '事実ではない情報が真実であるかのように広まる現象を何というか？',
      ans: 'フェイクニュース',
      choices: ["フェイクニュース", "チェーンメール", "ヘイトスピーチ", "ファクトチェック"],
      comment: "フェイクニュースは、事実ではない情報が真実であるかのようにインターネット上で広まる現象を指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '多くの人に無差別に転送を促すメールを何というか？',
      ans: 'チェーンメール',
      choices: ["チェーンメール", "フェイクニュース", "ヘイトスピーチ", "ネチケット"],
      comment: "チェーンメールは、受け取った人に対してさらに多くの人へ転送するよう促す内容のメールのこと。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '特定の個人や集団に対する憎悪や差別をあおる発言を何というか？',
      ans: 'ヘイトスピーチ',
      choices: ["ヘイトスピーチ", "フェイクニュース", "チェーンメール", "ソーシャルメディアポリシー"],
      comment: "ヘイトスピーチは、人種、民族、性別、宗教、性的指向など特定の属性を持つ個人や集団に対して憎悪や差別をあおる発言のこと。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '情報の真偽を検証する行為を何というか？',
      ans: 'ファクトチェック',
      choices: ["ファクトチェック", "フェイクニュース対策", "情報検証", "真実確認"],
      comment: "ファクトチェックは、公表された情報やニュースの真偽を調査し、検証する行為のこと。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'ビジネスや技術における判断が社会的な規範や法律に沿っているかどうかを評価する観点は何と呼ばれるか？',
      ans: '倫理的・法的・社会的な課題',
      choices: ["倫理的・法的・社会的な課題", "公益通報者保護法", "情報公開法", "データプライバシー"],
      comment:
          "倫理的・法的・社会的な課題は、特に新しい技術やビジネスモデルが社会に導入される際に、その活動が現行の法律や倫理、社会的価値観とどのように関係しているかを考慮する必要がある。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '企業の経営構造や運営の仕組みをどのように整えるかを示す概念は何か？',
      ans: 'コーポレートガバナンス',
      choices: ["コーポレートガバナンス", "コンプライアンス", "内部統制", "ソーシャルメディアガイドライン"],
      comment: "コーポレートガバナンスは、企業が健全な経営を行い、株主や関係者の信頼を確保するための経営構造や運営の仕組みを整える概念。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: '不正行為を公に報告する者を保護する日本の法律は何か？',
      ans: '公益通報者保護法',
      choices: ["公益通報者保護法", "個人情報保護法", "独占禁止法", "特定商取引法"],
      comment: "公益通報者保護法は、公の利益に関わる不正行為を内部告発する者（ホイッスルブロワー）を保護するための法律。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '企業が内部で適切な統制を行うための報告制度を何というか？',
      ans: '内部統制報告制度',
      choices: ["内部統制報告制度", "コーポレートガバナンス", "リスク管理制度", "コンプライアンスプログラム"],
      comment: "内部統制報告制度は、企業が内部の統制（内部管理体制）の有効性について報告し、経営の透明性を高めるための制度。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '政府機関が保有する情報について公開を義務付ける日本の法律は何か？',
      ans: '情報公開法',
      choices: ["情報公開法", "プライバシー保護法", "公益通報者保護法", "情報セキュリティ管理基準"],
      comment:
          "情報公開法は、公的機関が保有する情報の開示を求めることができる法律で、市民の知る権利を保障し、行政の透明性を高める目的がある。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 701);
  });
}
