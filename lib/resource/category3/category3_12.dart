import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_12 {
  final quizItems = [
    QuizItem(
      word: 'ウェアラブル端末',
      question: '身につけることができる小型の電子機器で、健康管理や通信など様々な機能を持つものは何か？',
      ans: 'ウェアラブル端末',
      choices: ["ウェアラブル端末", "スマートデバイス", "ペンタブレット", "イメージスキャナ"],
      comment: "ウェアラブル端末は、腕時計やメガネなど、身につけることができる小型の電子機器で、健康管理や通信など様々な機能を持つ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'スマートデバイス',
      question: '高度なコンピューティング機能とネットワーク接続機能を持ち、日常生活で広く使用される電子機器は何か？',
      ans: 'スマートデバイス',
      choices: ["スマートデバイス", "ウェアラブル端末", "イメージスキャナ", "3Dプリンタ"],
      comment:
          "スマートデバイスは、スマートフォンやタブレットなど、高度なコンピューティング機能とネットワーク接続機能を持つ日常生活で広く使用される電子機器。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ペンタブレット',
      question: 'ペンのような入力装置を用いてコンピュータに直接グラフィックを入力するためのデバイスは何か？',
      ans: 'ペンタブレット',
      choices: ["ペンタブレット", "タッチパネル", "イメージスキャナ", "ウェアラブル端末"],
      comment: "ペンタブレットは、ペンのような入力装置を用いてコンピュータに直接グラフィックを入力するためのデバイス。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'イメージスキャナ',
      question: '紙に書かれた過去の文書や設計図を電子ファイル化して，全社で共有したい。このときに使用する機器として，適切なものはどれか。',
      ans: 'スキャナー',
      choices: ["GPS受信機", "スキャナー", "ディジタイザ", "プロッタ"],
      comment: "イメージスキャナは、文書や写真などのアナログ情報をデジタルデータとしてコンピュータに取り込むための機器。",
      source: '平成28年春期 問14',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'タッチパネル',
      question: 'タッチパネルに関する記述として，適切なものはどれか。',
      ans: '電子式や静電式などの方式があり，指などで画面に直接触れることで，コンピュータの操作を行う。',
      choices: [
        "画面上の位置を指示するためのペン型又はマウス型の装置と，位置を検出するための平板状の装置を使用して操作を行う。",
        "電子式や静電式などの方式があり，指などで画面に直接触れることで，コンピュータの操作を行う。",
        "表面のタッチセンサーを用いて指の動きを認識し，ホイールと呼ばれる円盤に似た部品を回すようにして操作を行う。",
        "平板状の入力装置を指でなぞることで，画面上のマウスポインタなどの操作を行う。"
      ],
      comment:
          "タッチパネルは、ディスプレイに表示される画像に直接触れることでデータを入力する装置で、銀行のATMやスマートフォンの入力装置として採用されている。",
      source: '平成25年春期 問56',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'プロジェクタ',
      question: '画像や映像を壁やスクリーン上に投影するために使用される機器は何か？',
      ans: 'プロジェクタ',
      choices: ["プロジェクタ", "モニター", "ディスプレイ", "テレビ"],
      comment: "プロジェクタは、画像や映像を壁やスクリーン上に投影するために使用される機器。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '3Dプリンタ',
      question: '立体的な物体を層ごとに造形していくことで物理的なモデルを作成するプリンタは何か？',
      ans: '3Dプリンタ',
      choices: ["3Dプリンタ", "インクジェットプリンタ", "レーザプリンタ", "感熱式プリンタ"],
      comment: "3Dプリンタは、立体的な物体を層ごとに造形していくことで物理的なモデルを作成するプリンタ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'OCR（Optical Character Recognition）',
      question: '手書き文字を読み取り，文字コードに変換したいときに用いる装置はどれか。',
      ans: 'OCR',
      choices: ["BD-R", "CD-R", "OCR", "OMR"],
      comment:
          "OCR（Optical Character Recognition）は、紙や画像内の文字をパターンマッチング技術やAI技術を用いて解析して読み取り、デジタルのテキストデータに変換する装置やソフトウェア。",
      source: '平成27年秋期 問47',
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'OMR',
      question: 'マークシートのような形式で回答されたデータを光学的に読み取る技術は何か？',
      ans: 'OMR',
      choices: ["OMR", "OCR", "スキャナ", "バーコードリーダー"],
      comment:
          "OMR（Optical Mark Recognition）は、マークシートのような形式で回答されたデータを光学的に読み取る技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'Webカメラ',
      question: 'インターネット上でのビデオ通話や会議などに使用される、映像をデジタルデータとしてコンピュータに取り込むためのカメラは何か？',
      ans: 'Webカメラ',
      choices: ["Webカメラ", "デジタルカメラ", "アクションカメラ", "イメージスキャナ"],
      comment:
          "Webカメラは、インターネット上でのビデオ通話や会議などに使用される、映像をデジタルデータとしてコンピュータに取り込むためのカメラ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'インクジェットプリンタ',
      question: 'インクを微細な滴として紙に吹き付けることで文字や画像を印刷するプリンタは何か？',
      ans: 'インクジェットプリンタ',
      choices: ["インクジェットプリンタ", "レーザプリンタ", "インパクトプリンタ", "感熱式プリンタ"],
      comment: "インクジェットプリンタは、インクを微細な滴として紙に吹き付けることで文字や画像を印刷するプリンタ。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: 'インパクトプリンター',
      question: '印刷時にカーボン紙やノンカーボン紙を使って同時に複写が取れるプリンターはどれか。',
      ans: 'インパクトプリンタ',
      choices: ["インクジェッ卜プリンター", "インパクトプリンター", "感熱式プリンター", "レーザプリンター"],
      comment:
          "インパクトプリンターは、細かいピンや活字でインクリボンを紙に打ち付けることで印刷するプリンターで、カーボン紙や感圧紙(ノーカーボン紙)などの複写式の紙に印刷をすることができる。",
      source: '平成24年秋期 問81',
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '感熱式プリンタ',
      question: '熱に反応する特殊な紙を使用し、熱を加えることで文字や画像を印刷するプリンタは何か？',
      ans: '感熱式プリンタ',
      choices: ["感熱式プリンタ", "インクジェットプリンタ", "レーザプリンタ", "インパクトプリンタ"],
      comment: "感熱式プリンタは、熱に反応する特殊な紙を使用し、熱を加えることで文字や画像を印刷するプリンタ。",
      importance: QuizImportanceType.none,
    ),
    QuizItem(
      word: 'レーザプリンター',
      question: '感光ドラム上に印刷イメージを作り，粉末インク(トナ一)を付着させて紙に転写，定着させる方式のプリンターはどれか。',
      ans: 'レーザプリンター',
      choices: ["インクジェットプリンター", "インパクトプリンター", "熱転写プリンター", "レーザプリンター"],
      comment:
          "レーザプリンターは、レーザ光線を使って図や文字を描き、それをトナーに付着させて用紙に焼き付けるプリンターで、高価であるため主に業務用として利用されており、印刷がページ単位であることが特徴。",
      source: '平成28年春期 問88',
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 1201);
  });
}
