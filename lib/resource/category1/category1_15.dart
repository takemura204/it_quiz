import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

///エンジニアリングシステム
List<QuizItem> get category1_15 {
  final quizItems = [
    QuizItem(
      word: 'CAD',
      question: 'CADの説明として，適切なものはどれか。',
      ans: 'コンピュータを利用して設計や製図を行うこと',
      choices: [
        "コンピュータを利用して教育を行うこと",
        "コンピュータを利用して製造作業を行うこと",
        "コンピュータを利用して設計や製図を行うこと",
        "コンピュータを利用してソフトウェアの設計・開発やメンテナンスを行うこと"
      ],
      comment:
          "CAD(Computer Aided Design)は、コンピュータ支援設計とも呼ばれ、コンピュータを用いて製品の形状等の設計や製図をすること、またはそのためのシステムのこと。",
      source: '平成29年春期 問16',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'CAM',
      question: 'CAMの導入効果として適切なものはどれか。',
      ans: 'コンピュータを利用して工作機械を制御することで，製造作業の精度や効率を高める。',
      choices: [
        "コンピュータを利用して工作機械を制御することで，製造作業の精度や効率を高める。",
        "コンピュータを利用して生産に必要な部品の時期と量を計算することで，発注の効率を高める。",
        "コンピュータを利用して設計中の製品の性能について条件を変えながらシミュレー卜することで，開発の効率を高める。",
        "コンピュータを利用して立体的な形状を見ながら設計することで，設計作業の品質や効率を高める。"
      ],
      comment:
          "CAM(Computer Aided Manufacturing)は、コンピュータ支援製造とも呼ばれ、工場などの生産ラインをコンピュータを利用して制御するシステムのこと。",
      source: '平成24年秋期 問12',
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'CIM',
      question: '製造業において、さまざまな製造工程をコンピュータで統合し自動化するシステムは何というか？',
      ans: 'CIM',
      choices: ["CIM", "CAD", "MRP", "FMS"],
      comment:
          "CIM（Computer Integrated Manufacturing）は、設計から製造、在庫管理、品質管理までの製造工程をコンピュータで統合し、効率化と自動化を図るシステム。このシステムにより、製造業の生産性と柔軟性が大幅に向上する。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: 'コンカレントエンジニアリング',
      question: 'コンカレントエンジニアリングの目的として，適切なものはどれか。',
      ans: '開発期間の短縮',
      choices: ["開発期間の短縮", "開発する製品の性能向上", "開発する製品の品質向上", "生産工程の歩留り率向上"],
      comment:
          "コンカレントエンジニアリング(Concurrent Engineering)は、主に製造業において、設計から生産に至るまでの各プロセスを同時並行的に行うことで、開発期間や納期の短縮および生産コストの削減を図る手法。",
      source: '平成26年春期 問28',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'シミュレーション',
      question: '現実の挙動をコンピュータ上で再現し、事前に性能や挙動を予測する技術は何か？',
      ans: 'シミュレーション',
      choices: ["コンカレントエンジニアリング", "シミュレーション", "センシング技術", "FMS"],
      comment:
          "シミュレーションは、現実世界の物理的な挙動をコンピュータ上でモデル化し再現する技術。事前に性能や問題点を予測し、開発や改善に役立てる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'センシング技術',
      question: '物理的な変化を検出し、データとして取得する技術は何か？',
      ans: 'センシング技術',
      choices: ["シミュレーション", "センシング技術", "JIT", "MRP"],
      comment:
          "センシング技術は、温度、圧力、光などの物理的な変化を検出し、それを電気信号などのデータとして取得する技術。多様な分野での応用が可能。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'JIT',
      question: 'ジャストインタイム生産方式を説明したものはどれか。',
      ans: 'JIT',
      choices: [
        "1人又は数人の作業員が，生産の全工程を担当する方式",
        "顧客からの注文を受けてから，生産を開始する方式",
        "生産開始時の計画に基づき，見込み数量を生産する方式",
        "必要な物を，必要なときに，必要な量だけ生産する方式"
      ],
      comment:
          "JIT（Just In Time）は、トヨタ自動車の生産方式の代表的な要素で、必要な物を、必要なときに、必要な量だけ生産すること追求するという概念で、在庫の無駄をなくし生産を最適化する目的がある。。",
      source: '平成21年春期 問28',
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'FMS',
      question: '柔軟性の高い製造システムで、様々な製品を少量多品種生産するためのシステムを何というか？',
      ans: 'FMS',
      choices: ["JIT", "FMS", "MRP", "リーン生産方式"],
      comment:
          "FMS（Flexible Manufacturing System）は、コンピュータ制御により、柔軟性の高い製造システムを実現し、様々な製品を少量多品種生産することが可能なシステム。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'MRP',
      question:
          '最終製品の納期と製造量に基づいて，製造に必要な構成部品の在庫量の最適化を図りたい。この目的を実現するための施策として，最も適切なものはどれか。',
      ans: 'MRPシステムの構築',
      choices: ["CRMシステムの構築", "MRPシステムの構築", "POSシステムの構築", "SFAシステムの構築"],
      comment:
          "MRP(Material Requirements Planning)は、日本語では資材所要量計画と呼ばれ、部品表と生産計画をもとに必要な資材の所要量を求め、これを基準に在庫、発注、納入の管理を支援するシステム。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'リーン生産方式',
      question: '無駄を徹底的に排除し、価値のない活動を省くことで効率化を図る生産方式は何か？',
      ans: 'リーン生産方式',
      choices: ["MRP", "リーン生産方式", "かんばん方式", "CAD"],
      comment:
          "リーン生産方式は、無駄を徹底的に排除し、必要最小限のリソースで価値ある製品を生産することを目指す生産管理のアプローチ。トヨタ生産方式とも呼ばれる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'かんばん方式',
      question: '製造ラインにおいて、作業工程や生産量を視覚的に管理するために使用される方法は何か？',
      ans: 'かんばん方式',
      choices: ["リーン生産方式", "かんばん方式", "CIM", "プロセスイノベーション"],
      comment:
          "かんばん方式は、製造ラインにおいて必要な部品や材料、情報を「かんばん（看板）」と呼ばれる情報伝達ツールを用いて視覚的に管理し、ジャストインタイム生産を支援する方法。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 1501);
  });
}
