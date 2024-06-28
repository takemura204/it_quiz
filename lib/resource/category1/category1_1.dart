import 'package:kentei_quiz/model/lang/initial_resource.dart';
import 'package:kentei_quiz/untils/enums.dart';

import '../../model/quiz_item/quiz_item.dart';

///経営・組織論
List<QuizItem> get category1_1 {
  final quizItems = [
    QuizItem(
      word: '経営理念',
      question: '企業の経営に関する信念や価値観を社員や顧客，社会に対して示すものとして最も適切なものはどれか。',
      ans: '経営理念',
      choices: ["経営課題", "経営計画", "経営戦略", "経営理念"],
      comment: "経営理念とは、企業の経営に関する信念や価値観を社員や顧客，社会に対して示すもの。",
      source: '平成22年春期 問16',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: '株主総会',
      question: '株式会社の最高意思決定機関はどれか。',
      ans: '株主総会',
      choices: ["株主総会", "監査役会", "代表取締役", "取締役会"],
      comment:
          "株主総会とは、株式会社の実質的な所有者である株主によって構成され、経営の基本的方針や重要事項を決定する株式会社の最高意思決定機関。",
      source: '平成23年秋期 問16',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: '決算',
      question: '企業が一定期間の経済活動の結果を財務的にまとめた報告は何か？',
      ans: '決算',
      choices: ["決算", "CSR", "SRI", "ディスクロージャ"],
      comment: "決算とは、企業が一定期間の経済活動の結果を財務的にまとめ、収益や費用、利益などを報告すること。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'CSR（Corporate Social Responsibility）',
      question:
          '利益の追求だけでなく，社会に対する貢献や地球環境の保護などの社会課題を認識して取り組むという企業活動の基本となる考え方はどれか。',
      ans: 'CSR',
      choices: ["BCP", "CSR", "M&A", "MBO"],
      comment:
          "CSR（Corporate Social Responsibility）とは、企業が環境保護や社会貢献など、社会的責任を果たすことを目的とした経営活動。",
      source: '平成27年秋期 問21',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'SRI（Socially Responsible Investment）',
      question:
          '社会的責任投資と訳され、企業への投資を行う際に、従来から投資基準となっていた経済・財務的な分析に加えて、CSR（企業の社会的責任）への取組みを考慮する投資手法は何か？',
      ans: 'SRI',
      choices: ["SRI", "CSR", "決算", "グリーンIT"],
      comment:
          "SRI（Socially Responsible Investment）は、社会的責任投資と訳され、企業への投資を行う際に、従来から投資基準となっていた経済・財務的な分析に加えて、CSR（企業の社会的責任）への取組みを考慮する投資手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ディスクロージャ',
      question: '企業の経営状況を外部に公開することを何というか。',
      ans: 'ディスクロージャ',
      choices: ["株式公開", "企業格付け", "コンプライアンス", "ディスクロージャ"],
      comment: "ディスクロージャは、企業が株主や投資家などのステークホルダーに対して、経営状況や財務情報などを透明に公開すること。",
      source: '平成22年春期 問19',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: '監査役',
      comment: "監査役とは、日本の株式会社において取締役と会計参与の職務の執行を監査する役割をもつ役職・機関。",
      question: '監査役の役割の説明として，適切なものはどれか。',
      ans: '監査役',
      choices: [
        "公認会計士の資格を有して，会社の計算書類を監査すること",
        "財務部門の最高責任者として職務を執行すること",
        "特定の事業に関する責任と権限を有して，職務を執行すること",
        "取締役の職務執行を監査すること"
      ],
      source: '平成26年秋期 問26',
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'グリーンIT',
      comment:
          "グリーンITとは、PCやサーバ、ネットワークなどの情報通信機器の省エネや資源の有効利用だけでなく、それらの機器を利用することによって社会の省エネを推進し、環境保全をしていくという考え方",
      question: 'グリーンITの考え方に基づく取組みの事例として，適切なものはどれか。',
      ans: '資料の紙への印刷は制限して，PCのディスプレイによる閲覧に留めることを原則とする。',
      choices: [
        "LEDの青色光による目の疲労を軽減するよう配慮したディスプレイを使用する。",
        "サーバ室の出入口にエアシャワー装置を設置する。",
        "災害時に備えたバックアップシステムを構築する。",
        "資料の紙への印刷は制限して，PCのディスプレイによる閲覧に留めることを原則とする。"
      ],
      source: '平成26年秋期 問20',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'SDGs（Sustainable Development Goals）',
      comment:
          "SDGs（Sustainable Development Goals）とは、持続可能な世界を実現するために国連が採択した，2030年までに達成されるべき開発目標。",
      question:
          '持続可能な世界を実現するために国連が採択した，2030年までに達成されるべき開発目標を示す言葉として，最も適切なものはどれか。',
      ans: 'SDGs',
      choices: ["SDGs", "SDK", "SGA", "SGML"],
      source: '令和元年秋期 問35',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'ゼロエミッション',
      comment: "ゼロエミッションは、産業活動などによる環境への負荷（CO2排出など）をゼロにすることを目指す環境保全の取り組み。",
      question: '環境への負荷をゼロにすることを目指す環境保全の取り組みは何か？',
      ans: 'ゼロエミッション',
      choices: ["ゼロエミッション", "SDGs", "グリーンIT", "CSR"],
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: 'ステークホルダ',
      comment: "ステークホルダは、企業活動に関わる利害関係者（株主、従業員、顧客、地域社会など）を総称する言葉。",
      question: '企業活動に関わる利害関係者を総称して何というか？',
      ans: 'ステークホルダ',
      choices: ["ステークホルダ", "コーポレートブランド", "PDCA", "OODAループ"],
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'コーポレートブランド',
      question: '企業の総合的な価値やイメージを構築するためのブランドは何か？',
      ans: 'コーポレートブランド',
      choices: ["コーポレートブランド", "ステークホルダ", "PDCA", "OODAループ"],
      comment: "コーポレートブランドは、企業の総合的な価値やイメージを構築し、外部に伝えるためのブランド。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'PDCA',
      comment:
          "PDCAサイクルは、計画（Plan）、実行（Do）、評価（Check）、改善（Act）のプロセスを繰り返すことで、業務やプロジェクトの継続的な改善を目指す手法。",
      question:
          'ISMSの運用において，監査結果をインプットとし，ISMSを継続的に改善するための是正処置及び予防処置を行うプロセスはPDCAサイクルのどれにあたるか。',
      choices: ["P", "D", "C", "A"],
      ans: 'C',
      source: '平成27年春期 問75',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'OODAループ',
      question: '観察・指向・決定・行動のサイクルを通じて、迅速な意思決定と行動を促す概念は何か？',
      ans: 'OODAループ',
      choices: ["OODAループ", "PDCA", "コーポレートブランド", "ステークホルダ"],
      comment:
          "OODAループ（Observe, Orient, Decide, Act）は、状況を迅速に把握し、適切な意思決定と行動を促すための概念。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'BCP（Business Continuity Plan）',
      comment:
          "BCP（Business Continuity Plan）は、災害や緊急事態が発生した際に、最低限の事業を継続し、または早期に復旧・再開できるようにする企業が定めた行動計画",
      question:
          '地震，洪水といった自然災害，テロ行為といった人為災害などによって企業の業務が停止した場合，顧客や取引先の業務にも重大な影響を与えることがある。こうした事象の発生を想定して，製造業のX社は次の対策を採ることにした。対策aとbに該当する用語の組合せはどれか。\n〔対策〕\na.異なる地域の工場が相互の生産ラインをバックアップするプロセスを準備する。b.準備したプロセスへの切換えがスムーズに行えるように，定期的にプロセスの試験運用と見直しを行う。',
      ans: 'a.BCP,b.BCM',
      choices: ["a.BCP,b.BCM", "a.BCP,b.SCM", "a.BCR,b.BCM", "a.BCR,b.SCM"],
      source: '平成27年秋期 問7',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'BCM（Business Continuity Management）',
      question: '事業継続性を確保するための組織的な管理プロセスは何か？',
      ans: 'BCM',
      choices: ["BCM", "BCP", "OODAループ", "PDCA"],
      comment:
          "BCM（Business Continuity Management）は、事業の継続性を確保し、災害や緊急事態からの迅速な回復を目指すための組織的な管理プロセス。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'OJT（On-the-Job Training）',
      comment:
          "OJT（On-the-Job Training）とは、職場内訓練とも呼ばれ、実際の業務現場で上司や先輩の指導のもとで体系的・計画的に仕事を習得させていく教育方法。",
      question: '現在担当している業務の実践を通じて，業務の遂行に必要な技術や知識を習得させる教育訓練の手法はどれか。',
      ans: 'OJT',
      choices: ["CDP", "Off-JT", "e-ラーニング", "OJT"],
      source: '平成27年春期 問3',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'Off-JT（Off-the-Job Training）',
      comment:
          "Off-JT（Off-the-Job Training）とは、実際の現場で行われるOJTに対して、研修や外部セミナーへの参加などの普段の職場を離れた場所で行われる人材教育のこと",
      question: '社員育成方法のうち，Off-JTに分類されるものはどれか。',
      ans: '仕事を離れて実施される教育訓練を通じて，知識や技術を習得させる。',
      choices: [
        "現場に権限を与えることによって自主性を生み出す。",
        "仕事を離れて実施される教育訓練を通じて，知識や技術を習得させる。",
        "実際の仕事を通じて計画的に指導・育成し，必要な知識や技術を習得させる。",
        "質問や簡単なアドバイスを投げかけ，自ら目標に向かって行動を起こすように仕向ける。"
      ],
      source: '平成24年秋期 問6',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'e-ラーニング',
      comment:
          "e-ラーニングとは、パソコンやCD,DVD、携帯端末などの機器を使い、インターネットなどのネットワークを利用して学習や教育を行う形態",
      question:
          '全国の業務担当者を対象として，販売予測システムの利用方法に関する研修を計画している。研修にe-ラーニングを利用することで得られるメリットはどれか。',
      ans: '業務担当者が自分の業務の空き時間を利用して，好きなときに受講できる。',
      choices: [
        '業務担当者がシステムの内容を設計担当者から直接受講し，その場で質疑を行える。',
        '業務担当者が自分の業務の空き時間を利用して，好きなときに受講できる。',
        '業務担当者が複数同席し，システムの利用方法について意見を交換できる。',
        '業務担当者を一堂に集めて，一度で研修できる。'
      ],
      source: '平成26年春期 問20',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'アダプティブラーニング',
      comment: "アダプティブラーニングは、学習者の能力や進捗に応じて、学習内容や進行速度を自動的に調整する個別最適化学習形態。",
      question: '学習者の能力や進捗に応じて学習内容を自動的に調整する学習形態は何か？',
      ans: 'アダプティブラーニング',
      choices: ["アダプティブラーニング", "e-ラーニング", "Off-JT", "OJT"],
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'CDP（Career Development Planning）',
      question: '従業員がキャリア開発のために自身のスキルや経験を管理するためのデータベースは何か？',
      ans: 'CDP',
      choices: ["CDP", "メンタルヘルス", "HRテック", "MBO"],
      comment:
          "CDP（Career Development Planning）は、従業員が自身のスキルや経験、キャリア目標などを管理し、キャリア開発を計画するための個人データベースやプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'メンタルヘルス',
      question: '従業員の精神的健康を保つための取り組みは何と呼ばれるか？',
      ans: 'メンタルヘルス',
      choices: ["メンタルヘルス", "CDP", "HRテック", "MBO"],
      comment:
          "メンタルヘルスは、従業員の精神的健康やストレスマネジメントに関する取り組みで、職場の生産性や従業員の満足度向上に貢献すること。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'HRテック',
      question: '人事管理を効率化するために利用されるテクノロジーは何か？',
      ans: 'HRテック',
      choices: ["HRテック", "メンタルヘルス", "CDP", "MBO"],
      comment: "HRテックは、採用、評価、教育訓練などの人事管理プロセスを効率化するために利用されるテクノロジー。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'MBO（Management by Objectives）',
      question: '従業員と管理職が目標を共有し、評価する管理手法は何か？',
      ans: 'MBO',
      choices: ["MBO", "HRテック", "メンタルヘルス", "CDP"],
      comment:
          "MBO（Management by Objectives）は、従業員と管理職が目標を共有し、その達成を目指して行動する管理手法。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'HRM（Human Resource Management）',
      question: '組織内の人材管理全般を指す言葉は何か？',
      ans: 'HRM',
      choices: ["HRM", "MBO", "HRテック", "メンタルヘルス"],
      comment:
          "HRM（Human Resource Management）は、採用、教育訓練、評価、報酬など、組織内の人材管理全般を指す言葉。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'リテンション',
      question: '従業員が退職しないように留める取り組みは何か？',
      ans: 'リテンション',
      choices: ["リテンション", "HRM", "MBO", "HRテック"],
      comment:
          "リテンションは、従業員が組織に長く留まり、離職しないようにするための取り組み。従業員満足度の向上やエンゲージメントの強化が目的。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'タレントマネジメント',
      question: '組織内の才能ある人材を発見し、育成し、維持するプロセスは何か？',
      ans: 'タレントマネジメント',
      choices: ["タレントマネジメント", "リテンション", "HRM", "MBO"],
      comment: "タレントマネジメントは、組織内の才能ある人材を発見し、育成し、維持することを目的とした戦略的なプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ワークエンゲージメント',
      question: '従業員が仕事に没頭し、熱心に取り組む状態は何と呼ばれるか？',
      ans: 'ワークエンゲージメント',
      choices: ["ワークエンゲージメント", "タレントマネジメント", "リテンション", "HRM"],
      comment: "ワークエンゲージメントは、従業員が自らの仕事に対して熱心に取り組み、高いモチベーションを持つ状態。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'ワークライフバランス',
      question: '仕事と私生活の調和を目指す考え方は何か？',
      ans: 'ワークライフバランス',
      choices: ["ワークライフバランス", "ワークエンゲージメント", "タレントマネジメント", "リテンション"],
      comment: "ワークライフバランスは、仕事と私生活の両方に満足できるように調和を図ることを目指す考え方。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ダイバーシティ',
      question: '多様な個性や価値観を尊重し、活用する経営戦略は何か？',
      ans: 'ダイバーシティ',
      choices: ["ダイバーシティ", "ワークライフバランス", "ワークエンゲージメント", "タレントマネジメント"],
      comment:
          "ダイバーシティは、性別、年齢、国籍、文化、価値観など、多様な個性や背景を持つ人々を尊重し、その能力や特性を組織の成長に活用する経営戦略。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'インバスケット',
      question: '実際の業務状況を想定した問題を解決する訓練方法は何か？',
      ans: 'インバスケット',
      choices: ["インバスケット", "ロールプレイング", "ケーススタディ", "アメーバ組織"],
      comment: "インバスケットは、実際の業務状況を想定した問題や課題を解決することを通じて、意思決定能力や問題解決能力を養う訓練方法。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: 'ロールプレイング',
      question: '実際のビジネスシーンを模擬して行う役割演技の訓練は何か？',
      ans: 'ロールプレイング',
      choices: ["ロールプレイング", "インバスケット", "ケーススタディ", "アメーバ組織"],
      comment:
          "ロールプレイングは、実際のビジネスシーンを模擬して役割を演じることで、コミュニケーション能力や問題解決能力を向上させる訓練方法。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: 'ケーススタディ',
      question: '実際のビジネス事例に基づいて学習する教育手法は何か？',
      ans: 'ケーススタディ',
      choices: ["ケーススタディ", "ロールプレイング", "インバスケット", "アメーバ組織"],
      comment: "ケーススタディは、実際のビジネス事例を用いて、その状況分析や意思決定プロセスを学習する教育手法。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: 'グラスシーリング',
      question: '女性が上位職に就くことを阻む見えない障壁を何というか？',
      ans: 'グラスシーリング',
      choices: ["グラスシーリング", "ケーススタディ", "ロールプレイング", "インバスケット"],
      comment: "グラスシーリングは、女性が上位職や経営層に進出することを阻む、組織内外の見えない障壁や制度的な偏見を指す言葉。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: 'ホワイトカラーエグゼンプション',
      question: '労働時間の規制から一部の専門職を除外する制度は何か？',
      ans: 'ホワイトカラーエグゼンプション',
      choices: ["ホワイトカラーエグゼンプション", "グラスシーリング", "カンパニ制", "マトリックス組織"],
      comment: "ホワイトカラーエグゼンプションは、一部の専門職や管理職などを労働時間の規制から除外する制度。成果に基づく評価が中心となる。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: '階層型組織',
      question: '明確な上下関係を持ち、一元的な指揮系統が特徴の組織形態は何か？',
      ans: '階層型組織',
      choices: ["階層型組織", "事業部制", "職能別組織", "プロジェクト組織"],
      comment: "階層型組織は、明確な上下関係と一元的な指揮系統を持つ組織形態。効率的な意思決定が可能だが、柔軟性に欠けることがある。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '事業部制',
      comment: "事業部制とは、製品別や商品別、地域別、市場別などの単位で分化し、分化した組織ごとに意思決定を行う組織形態.",
      question: '事業部制組織を説明したものはどれか。',
      ans: '利益責任と業務遂行に必要な職能を，製品別，顧客別又は地域別にもつことによって，自己完結的な経営活動が展開できる組織である。',
      choices: [
        "構成員が，自己の専門とする職能部門と特定の事業を遂行する部門の両方に所属する組織である。",
        "購買・生産・販売・財務などの仕事の性質によって，部門を編成した組織である。",
        "特定の課題のもとに各部門から専門家を集めて編成し，期間と目標を定めて活動する一時的かつ柔軟な組織である。",
        "利益責任と業務遂行に必要な職能を，製品別，顧客別又は地域別にもつことによって，自己完結的な経営活動が展開できる組織である。"
      ],
      source: '平成25年春期 問22',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: '職能別組織',
      comment: "職能別組織とは、製造，営業，経理，開発などのように職能ごとにに部門を分けることで専門性を高め、効率的な運営を目指す組織形態。",
      question: '職能別組織を説明したものはどれか。',
      ans: '業務を専門的な機能に分け，各機能を単位として構成する組織',
      choices: [
        "ある問題を解決するために必要な機能だけを集めて一定の期間に限って結成し，問題解決とともに解散する組織",
        "業務を専門的な機能に分け，各機能を単位として構成する組織",
        "製品，地域などを単位として，事業の利益責任をもつように構成する組織",
        "製品や機能などの単位を組み合わせることによって，縦と横の構造をもつように構成する組織"
      ],
      source: '平成27年春期 問26',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'マトリックス組織',
      comment: "マトリックス組織は、機能別の組織構造とプロジェクト別の組織構造を併用することで、柔軟性と専門性の両方を追求する組織形態。",
      question: '2人又はそれ以上の上司から指揮命令を受けるが，プロジェクトの目的管理と職能部門の職能的責任との調和を図る組織構造はどれか。',
      ans: 'マトリックス組織',
      choices: ["事業部制組織", "職能別組織", "マトリックス組織", "プロジェクト組織"],
      source: '平成21年秋期 問9',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'プロジェクト組織',
      question: '特定のプロジェクト達成のために一時的に組織されるチームは何か？',
      ans: 'プロジェクト組織',
      choices: ["プロジェクト組織", "マトリックス組織", "職能別組織", "カンパニ制"],
      comment: "プロジェクト組織は、特定のプロジェクトや目標達成のために一時的に組織されるチーム。プロジェクト完了後は通常解散する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'アメーバ組織',
      question: '小さな単位の組織が独立採算制で運営される組織形態は何か？',
      ans: 'アメーバ組織',
      choices: ["アメーバ組織", "プロジェクト組織", "マトリックス組織", "職能別組織"],
      comment: "アメーバ組織は、組織内の小さなグループがそれぞれ独立採算制で運営され、各アメーバ単位で収益責任を持つ組織形態。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      question: '独立採算制を採用し、小さな会社のように運営される組織単位は何か？',
      ans: 'カンパニ制',
      choices: ["カンパニ制", "プロジェクト組織", "マトリックス組織", "職能別組織"],
      comment: "カンパニ制は、大企業内に独立採算制の小組織（カンパニ）を設け、それぞれが小さな会社のように運営される組織形態。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ネットワーク組織',
      comment: "ネットワーク組織とは、複数の企業、部門、個人が共通目的をもって、本来の組織の枠組みを越えて水平的かつ柔軟に協働する組織構造。",
      question: '次の特徴をもつ組織形態として，適切なものはどれか。',
      ans: 'ネットワーク組織',
      choices: ["ネットワーク組織", "アウトソーシング", "タスクフォース", "マトリックス組織"],
      source: '平成28年春期 問34',
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '持株会社',
      question: '子会社を持つことで、経営資源の最適化を図る企業形態は何か？',
      ans: '持株会社',
      choices: ["持株会社", "ネットワーク組織", "カンパニ制", "プロジェクト組織"],
      comment: "持株会社は、他の会社の株式を保有し、経営管理を行う企業形態。子会社を通じてビジネスポートフォリオの最適化を図る。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'CEO（Chief Executive Officer）',
      question: '企業の最高経営責任者を指す役職は何か？',
      ans: 'CEO',
      choices: ["CEO", "CIO", "持株会社", "ネットワーク組織"],
      comment:
          "CEO（Chief Executive Officer）は、企業の最高経営責任者で、中長期的な経営事項についての責任を負う役職で中長期的な経営事項についての責任を負い、経営方針や戦略を決定し、全体の経営をリードする役職。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'CIO（Chief Information Officer）',
      comment:
          "CIO（Chief Information Officer）は、経営戦略に沿った情報戦略や、IT投資計画の策定とその実現に直接の責任を持つ最高情報責任者。",
      question: 'CIOの役割として，最も適切なものはどれか。',
      ans: '経営戦略を実現するための情報戦略の立案及び実施を主導する。',
      choices: [
        "客観的な立場から，自社の業務に問題がないか，ITの統制が有効に機能しているかなどを監査する。",
        "経営戦略を実現するための情報戦略の立案及び実施を主導する。",
        "経営戦略を実現するための人事制度を構築し，勤務の実態を把握するなど管理・運営全般を掌握する。",
        "自社の資金効率の向上，及び財務会計の正確性を維持する。"
      ],
      source: '平成23年秋期 問2',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: '第4次産業革命',
      question: '情報技術の進化がもたらす社会や産業の大変革を指す言葉は何か？',
      ans: '第4次産業革命',
      choices: ["第4次産業革命", "Society5.0", "データ駆動型社会", "デジタルトランスフォーメーション"],
      comment: "第4次産業革命は、IoT、AI、ビッグデータなどの先進技術により、社会や産業の構造が大きく変化する現象を指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'Society5.0',
      question: '超スマート社会を目指す日本独自の社会構想は何か？',
      ans: 'Society5.0',
      choices: ["Society5.0", "第4次産業革命", "データ駆動型社会", "デジタルトランスフォーメーション"],
      comment:
          "Society5.0は、日本が提唱する超スマート社会の構想で、あらゆるモノやサービスがネットワークでつながり、人々の生活や経済活動が大きく向上する社会を目指す。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'データ駆動型社会',
      question: 'データと分析に基づいて意思決定や業務を行う社会は何と呼ばれるか？',
      ans: 'データ駆動型社会',
      choices: ["データ駆動型社会", "Society5.0", "第4次産業革命", "デジタルトランスフォーメーション"],
      comment: "データ駆動型社会は、ビッグデータや分析技術を活用して、より効率的で精密な意思決定やサービス提供を行う社会のこと。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'デジタルトランスフォーメーション',
      question: 'デジタル技術を活用してビジネスモデルや組織文化を変革するプロセスは何か？',
      ans: 'デジタルトランスフォーメーション',
      choices: ["デジタルトランスフォーメーション", "データ駆動型社会", "Society5.0", "第4次産業革命"],
      comment:
          "デジタルトランスフォーメーションは、デジタル技術を活用してビジネスモデルや組織文化を根本から変革し、新たな価値を創出するプロセス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '国家戦略特区法',
      question: '新しいビジネスモデルの創出や社会課題の解決を目指し、特定地域で規制緩和を図る日本の法制度は何か？',
      ans: '国家戦略特区法',
      choices: ["国家戦略特区法", "官民データ活用推進基本法", "デジタル社会形成基本法", "デジタルトランスフォーメーション"],
      comment: "国家戦略特区法は、特定地域において新たなビジネスモデルの創出や社会課題の解決を目指し、規制緩和や特例措置を行う日本の法制度。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '官民データ活用推進基本法',
      question: '官民のデータを有効活用し、新たな価値創出や公共サービスの向上を図るための日本の法律は何か？',
      ans: '官民データ活用推進基本法',
      choices: ["官民データ活用推進基本法", "国家戦略特区法", "デジタル社会形成基本法", "デジタルトランスフォーメーション"],
      comment:
          "官民データ活用推進基本法は、官民のデータを有効活用することにより、経済の活性化や公共サービスの向上を図ることを目的とした日本の法律。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'デジタル社会形成基本法',
      question: 'デジタル技術を活用して、包括的な社会システムの変革を目指す日本の法律は何か？',
      ans: 'デジタル社会形成基本法',
      choices: ["デジタル社会形成基本法", "官民データ活用推進基本法", "国家戦略特区法", "デジタルトランスフォーメーション"],
      comment:
          "デジタル社会形成基本法は、デジタル技術を活用して社会のあらゆる分野でのシステム改革を推進し、包括的なデジタル社会の形成を目指す日本の法律。",
      importance: QuizImportanceType.low,
    ),
  ];

  // quizId を自動的に割り当て
  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 101);
  });
}
