import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_16 {
  final quizItems = [
    QuizItem(
      word: 'RGB',
      question: 'ディスプレイ画面の表示では，赤・緑・青の3色を基に，加法混色によって様々な色を作り出している。赤色と緑色と青色を均等に合わせると，何色となるか。',
      ans: '白',
      choices: ["赤紫", "黄", "白", "緑青"],
      comment:
          "RGBとは、コンピュータグラフィックスの世界で用いられる「加法混色」の手法で、黒を基本色としてレッド(Red)、グリーン(Green)、ブルー(Blue)を混ぜ合わせることで幅広い色を表現するカラ―モデルで、すべての色の要素が最大のときには白色となる。",
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'CMY',
      question: '印刷で使用される、シアン、マゼンタ、イエローの3色のインクを減法混合して色を作り出す色空間モデルは何か？',
      ans: 'CMY',
      choices: ["CMY", "RGB", "CMYK", "dpi"],
      comment: "CMYは、印刷で使用される色空間モデルで、Cyan（シアン）、Magenta（マゼンタ）、Yellow（イエロー）の3色のインクを減法混合して色を作り出す。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'CMYK',
      question: 'CMYに黒（Key）を加えた4色のインクを使用する印刷のための色空間モデルは何か？',
      ans: 'CMYK',
      choices: ["CMYK", "CMY", "RGB", "dpi"],
      comment: "CMYKは、Cyan（シアン）、Magenta（マゼンタ）、Yellow（イエロー）、Key（黒）の4色のインクを使用する印刷のための色空間モデル。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'dpi（dots per inch）',
      question: '画像の解像度を表す際に使用される、1インチあたりのドット数を示す単位は何か？',
      ans: 'dpi',
      choices: ["dpi", "RGB", "CMYK", "CMY"],
      comment: "dpi（dots per inch）は、画像の解像度を表す際に使用される単位で、1インチあたりに含まれるドット（ピクセル）の数を示す。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ペイント系ソフトウェア',
      question: 'ペイント系ソフトウェアで用いられ，グラフィックスをピクセルと呼ばれる点の集まりとして扱う方法であるラスターグラフィックスの説明のうち，適切なものはどれか。',
      ans: '色の種類や明るさが，ピクセルごとに調節できる。',
      choices: [
        "CADで広く用いられている。CADで広く用いられている。",
        "色の種類や明るさが，ピクセルごとに調節できる。",
        "解像度の高低にかかわらずファイル容量は一定である。",
        "拡大しても図形の縁などにジャギー(ギザギザ)が生じない。"
      ],
      comment:
          "ペイント系ソフトウェアは、ラスタ形式の画像を作成・編集するためのソフトウェアの総称である。ラスタ形式とは、ピクセルごとの色情報をRGBやパレットカラーで記録し、それの集合として1つの画像を表現する画像データ形式である。",
      source: '平成25年秋期 問61',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'ドロー系ソフトウェア',
      question: 'ベクター画像を作成・編集するために用いられるソフトウェアの総称は何か？',
      ans: 'ドロー系ソフトウェア',
      choices: ["ドロー系ソフトウェア", "ペイント系ソフトウェア", "コンピュータグラフィックス", "バーチャルリアリティ"],
      comment: "ドロー系ソフトウェアは、ベクター画像を作成・編集するために用いられるソフトウェアの総称で、拡大・縮小しても画質が劣化しない。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'コンピュータグラフィックス',
      question: 'コンピュータを用いて作成される画像や映像などのビジュアルコンテンツ全般を指す言葉は何か？',
      ans: 'コンピュータグラフィックス',
      choices: ["コンピュータグラフィックス", "ペイント系ソフトウェア", "ドロー系ソフトウェア", "バーチャルリアリティ"],
      comment: "コンピュータグラフィックスは、コンピュータを用いて作成される画像や映像などのビジュアルコンテンツ全般を指す。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'バーチャルリアリティ',
      question: 'コンピュータ生成の環境に没入することで現実世界を再現したり、架空の世界を体験する技術は何か？',
      ans: 'バーチャルリアリティ',
      choices: ["バーチャルリアリティ", "AR", "SR", "コンピュータグラフィックス"],
      comment: "バーチャルリアリティ（VR）は、コンピュータ生成の環境に没入することで、現実世界を再現したり、架空の世界を体験する技術。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'AR',
      question: '拡張現実(AR)に関する記述として，適切なものはどれか。',
      ans: '実際の環境を捉えているカメラ映像などに，コンピュータが作り出す情報を重ね合わせて表示する技術',
      choices: [
        "実際に搭載されているメモリの容量を超える記憶空間を作り出し，主記憶として使えるようにする技術",
        "実際の環境を捉えているカメラ映像などに，コンピュータが作り出す情報を重ね合わせて表示する技術",
        "人間の音声をコンピュータで解析してデジタル化し，コンピュータへの命令や文字入力などに利用する技術",
        "人間の推論や学習，言語理解の能力など知的な作業を，コンピュータを用いて模倣するための科学や技術"
      ],
      comment: "AR（Augmented Reality）は、実際の環境にデジタル情報を重ね合わせることで、リアルタイムの対話が可能になる技術。",
      source: '平成28年春期 問100',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'SR',
      question: '実世界の空間や物体をリアルタイムでデジタル空間に複製する技術は何か？',
      ans: 'SR',
      choices: ["SR", "AR", "バーチャルリアリティ", "コンピュータグラフィックス"],
      comment:
          "SR（Substitutional Reality）は、過去に録画された映像を視聴することによって、その時代のその場所にいたかのような感覚が得られるようにする技術の総称。",
      importance: ImportanceType.none,
    ),
    QuizItem(
      word: 'MR（Mixed Reality）',
      question: '実際の世界と仮想の世界が融合し、物理的およびデジタルオブジェクトが共存および相互作用する技術は何か？',
      ans: 'MR',
      choices: ["MR", "AR", "VR", "SR"],
      comment:
          "MR（Mixed Reality）は、実際の世界と仮想の世界が融合する技術で、物理的およびデジタルオブジェクトが共存および相互作用します。この技術は、より深い没入感と現実世界との連携を可能にする。",
      importance: ImportanceType.none,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category3Index + 1601);
  });
}
