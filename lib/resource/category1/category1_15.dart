import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';

///エンジニアリングシステム
List<QuizItem> get category1_15 {
  final quizItems = [
    QuizItem(
      question: '製品の設計や図面作成にコンピュータを用いる技術を何というか？',
      ans: 'CAD',
      choices: ["CAD", "CAM", "CIM", "CTR"],
      comment:
          "CAD（Computer-Aided Design）は、製品の設計や図面作成にコンピュータを用いる技術。効率化や精度の向上に寄与する。",
    ),
    QuizItem(
      question: '製造工程にコンピュータを用いて自動化を図る技術を何というか？',
      ans: 'CAM',
      choices: ["CAD", "CAM", "CIM", "CTR"],
      comment:
          "CAM（Computer-Aided Manufacturing）は、製造工程にコンピュータを用いて自動化を図る技術。生産効率の向上や品質の安定化に貢献する。",
    ),
    QuizItem(
      question: '製造業において、さまざまな製造工程をコンピュータで統合し自動化するシステムは何というか？',
      ans: 'CIM',
      choices: ["CIM", "CAD", "MRP", "FMS"],
      comment:
          "CIM（Computer Integrated Manufacturing）は、設計から製造、在庫管理、品質管理までの製造工程をコンピュータで統合し、効率化と自動化を図るシステム。このシステムにより、製造業の生産性と柔軟性が大幅に向上する。",
    ),
    QuizItem(
      question: '製品開発において、設計から製造までの各工程を並行して行うことで、開発期間の短縮を図る手法を何というか？',
      ans: 'コンカレントエンジニアリング',
      choices: ["プロンプトエンジニアリング", "コンカレントエンジニアリング", "シミュレーション", "グローバルエンジニアリング"],
      comment:
          "コンカレントエンジニアリングは、製品開発の各工程を並行して進めることで、開発期間の短縮や効率化を図る手法。チーム間のコミュニケーションを活性化し、問題解決を迅速化する。",
    ),
    QuizItem(
      question: '現実の挙動をコンピュータ上で再現し、事前に性能や挙動を予測する技術は何か？',
      ans: 'シミュレーション',
      choices: ["コンカレントエンジニアリング", "シミュレーション", "センシング技術", "FMS"],
      comment:
          "シミュレーションは、現実世界の物理的な挙動をコンピュータ上でモデル化し再現する技術。事前に性能や問題点を予測し、開発や改善に役立てる。",
    ),
    QuizItem(
      question: '物理的な変化を検出し、データとして取得する技術は何か？',
      ans: 'センシング技術',
      choices: ["シミュレーション", "センシング技術", "JIT", "MRP"],
      comment:
          "センシング技術は、温度、圧力、光などの物理的な変化を検出し、それを電気信号などのデータとして取得する技術。多様な分野での応用が可能。",
    ),
    QuizItem(
      question: '必要な材料や部品を、必要な時に必要な分だけ供給する生産管理方式を何というか？',
      ans: 'JIT',
      choices: ["センシング技術", "JIT", "FMS", "MRP"],
      comment:
          "JIT（Just In Time）は、生産プロセスにおいて必要な材料や部品を、必要な時に必要な分だけ供給することで、在庫を最小限に抑え、効率的な生産を実現する生産管理方式。",
    ),
    QuizItem(
      question: '柔軟性の高い製造システムで、様々な製品を少量多品種生産するためのシステムを何というか？',
      ans: 'FMS',
      choices: ["JIT", "FMS", "MRP", "リーン生産方式"],
      comment:
          "FMS（Flexible Manufacturing System）は、コンピュータ制御により、柔軟性の高い製造システムを実現し、様々な製品を少量多品種生産することが可能なシステム。",
    ),
    QuizItem(
      question: '生産計画や在庫管理を効率化するために、材料需給の計画を立てるシステムは何か？',
      ans: 'MRP',
      choices: ["FMS", "MRP", "リーン生産方式", "かんばん方式"],
      comment:
          "MRP（Material Requirements Planning）は、製品の生産計画に基づき、必要な材料や部品の種類、数量、タイミングを計画することで、生産計画や在庫管理を効率化するシステム。",
    ),
    QuizItem(
      question: '無駄を徹底的に排除し、価値のない活動を省くことで効率化を図る生産方式は何か？',
      ans: 'リーン生産方式',
      choices: ["MRP", "リーン生産方式", "かんばん方式", "CAD"],
      comment:
          "リーン生産方式は、無駄を徹底的に排除し、必要最小限のリソースで価値ある製品を生産することを目指す生産管理のアプローチ。トヨタ生産方式とも呼ばれる。",
    ),
    QuizItem(
      question: '製造ラインにおいて、作業工程や生産量を視覚的に管理するために使用される方法は何か？',
      ans: 'かんばん方式',
      choices: ["リーン生産方式", "かんばん方式", "CIM", "プロセスイノベーション"],
      comment:
          "かんばん方式は、製造ラインにおいて必要な部品や材料、情報を「かんばん（看板）」と呼ばれる情報伝達ツールを用いて視覚的に管理し、ジャストインタイム生産を支援する方法。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category1Index + 1501);
  });
}
