import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_23 {
  final quizItems = [
    QuizItem(
      question: 'ディスプレイなどで色を表現する際に使用される、赤、緑、青の3色の光を組み合わせる色空間モデルは何か？',
      ans: 'RGB',
      choices: ["RGB", "CMY", "CMYK", "dpi"],
      comment:
          "RGBは、ディスプレイなどで色を表現する際に使用される色空間モデルで、Red（赤）、Green（緑）、Blue（青）の3色の光を加法混合して色を作り出す。",
    ),
    QuizItem(
      question: '印刷で使用される、シアン、マゼンタ、イエローの3色のインクを減法混合して色を作り出す色空間モデルは何か？',
      ans: 'CMY',
      choices: ["CMY", "RGB", "CMYK", "dpi"],
      comment:
          "CMYは、印刷で使用される色空間モデルで、Cyan（シアン）、Magenta（マゼンタ）、Yellow（イエロー）の3色のインクを減法混合して色を作り出す。",
    ),
    QuizItem(
      question: 'CMYに黒（Key）を加えた4色のインクを使用する印刷のための色空間モデルは何か？',
      ans: 'CMYK',
      choices: ["CMYK", "CMY", "RGB", "dpi"],
      comment:
          "CMYKは、Cyan（シアン）、Magenta（マゼンタ）、Yellow（イエロー）、Key（黒）の4色のインクを使用する印刷のための色空間モデル。",
    ),
    QuizItem(
      question: '画像の解像度を表す際に使用される、1インチあたりのドット数を示す単位は何か？',
      ans: 'dpi',
      choices: ["dpi", "RGB", "CMYK", "CMY"],
      comment:
          "dpi（dots per inch）は、画像の解像度を表す際に使用される単位で、1インチあたりに含まれるドット（ピクセル）の数を示す。",
    ),
    QuizItem(
      question: 'ビットマップ画像を編集するために用いられるソフトウェアの総称は何か？',
      ans: 'ペイント系ソフトウェア',
      choices: ["ペイント系ソフトウェア", "ドロー系ソフトウェア", "コンピュータグラフィックス", "バーチャルリアリティ"],
      comment: "ペイント系ソフトウェアは、ビットマップ画像を編集するために用いられるソフトウェアの総称で、ピクセル単位での編集が可能。",
    ),
    QuizItem(
      question: 'ベクター画像を作成・編集するために用いられるソフトウェアの総称は何か？',
      ans: 'ドロー系ソフトウェア',
      choices: ["ドロー系ソフトウェア", "ペイント系ソフトウェア", "コンピュータグラフィックス", "バーチャルリアリティ"],
      comment: "ドロー系ソフトウェアは、ベクター画像を作成・編集するために用いられるソフトウェアの総称で、拡大・縮小しても画質が劣化しない。",
    ),
    QuizItem(
      question: 'コンピュータを用いて作成される画像や映像などのビジュアルコンテンツ全般を指す言葉は何か？',
      ans: 'コンピュータグラフィックス',
      choices: ["コンピュータグラフィックス", "ペイント系ソフトウェア", "ドロー系ソフトウェア", "バーチャルリアリティ"],
      comment: "コンピュータグラフィックスは、コンピュータを用いて作成される画像や映像などのビジュアルコンテンツ全般を指す。",
    ),
    QuizItem(
      question: 'コンピュータ生成の環境に没入することで現実世界を再現したり、架空の世界を体験する技術は何か？',
      ans: 'バーチャルリアリティ',
      choices: ["バーチャルリアリティ", "AR", "SR", "コンピュータグラフィックス"],
      comment: "バーチャルリアリティ（VR）は、コンピュータ生成の環境に没入することで、現実世界を再現したり、架空の世界を体験する技術。",
    ),
    QuizItem(
      question: '実際の環境にデジタル情報を重ね合わせることで、リアルタイムの対話が可能になる技術は何か？',
      ans: 'AR',
      choices: ["AR", "バーチャルリアリティ", "SR", "コンピュータグラフィックス"],
      comment:
          "AR（Augmented Reality）は、実際の環境にデジタル情報を重ね合わせることで、リアルタイムの対話が可能になる技術。",
    ),
    QuizItem(
      question: '実世界の空間や物体をリアルタイムでデジタル空間に複製する技術は何か？',
      ans: 'SR',
      choices: ["SR", "AR", "バーチャルリアリティ", "コンピュータグラフィックス"],
      comment:
          "SR（Spatial Reality）は、実世界の空間や物体をリアルタイムでデジタル空間に複製し、仮想と現実の境界をなくす技術。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 221 + 3000);
  });
}
