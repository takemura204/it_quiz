import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_16 {
  final quizItems = [
    QuizItem(
      question: '身につけることができる小型の電子機器で、健康管理や通信など様々な機能を持つものは何か？',
      ans: 'ウェアラブル端末',
      choices: ["ウェアラブル端末", "スマートデバイス", "ペンタブレット", "イメージスキャナ"],
      comment: "ウェアラブル端末は、腕時計やメガネなど、身につけることができる小型の電子機器で、健康管理や通信など様々な機能を持つ。",
    ),
    QuizItem(
      question: '高度なコンピューティング機能とネットワーク接続機能を持ち、日常生活で広く使用される電子機器は何か？',
      ans: 'スマートデバイス',
      choices: ["スマートデバイス", "ウェアラブル端末", "イメージスキャナ", "3Dプリンタ"],
      comment:
          "スマートデバイスは、スマートフォンやタブレットなど、高度なコンピューティング機能とネットワーク接続機能を持つ日常生活で広く使用される電子機器。",
    ),
    QuizItem(
      question: 'ペンのような入力装置を用いてコンピュータに直接グラフィックを入力するためのデバイスは何か？',
      ans: 'ペンタブレット',
      choices: ["ペンタブレット", "タッチパネル", "イメージスキャナ", "ウェアラブル端末"],
      comment: "ペンタブレットは、ペンのような入力装置を用いてコンピュータに直接グラフィックを入力するためのデバイス。",
    ),
    QuizItem(
      question: '文書や写真などのアナログ情報をデジタルデータとしてコンピュータに取り込むための機器は何か？',
      ans: 'イメージスキャナ',
      choices: ["イメージスキャナ", "ウェブカメラ", "3Dプリンタ", "OCR"],
      comment: "イメージスキャナは、文書や写真などのアナログ情報をデジタルデータとしてコンピュータに取り込むための機器。",
    ),
    QuizItem(
      question: '指や専用のペンなどで直接画面を触れることで操作を行う入力デバイスは何か？',
      ans: 'タッチパネル',
      choices: ["タッチパネル", "ペンタブレット", "スマートデバイス", "ウェアラブル端末"],
      comment: "タッチパネルは、指や専用のペンなどで直接画面を触れることで操作を行う入力デバイス。",
    ),
    QuizItem(
      question: '画像や映像を壁やスクリーン上に投影するために使用される機器は何か？',
      ans: 'プロジェクタ',
      choices: ["プロジェクタ", "モニター", "ディスプレイ", "テレビ"],
      comment: "プロジェクタは、画像や映像を壁やスクリーン上に投影するために使用される機器。",
    ),
    QuizItem(
      question: '印刷された文字や記号を光学的に読み取り、テキストデータとしてコンピュータに入力する技術は何か？',
      ans: 'OCR',
      choices: ["OCR", "OMR", "スキャナ", "バーコードリーダー"],
      comment:
          "OCR（Optical Character Recognition）は、印刷された文字や記号を光学的に読み取り、テキストデータとしてコンピュータに入力する技術。",
    ),
    QuizItem(
      question: 'マークシートのような形式で回答されたデータを光学的に読み取る技術は何か？',
      ans: 'OMR',
      choices: ["OMR", "OCR", "スキャナ", "バーコードリーダー"],
      comment:
          "OMR（Optical Mark Recognition）は、マークシートのような形式で回答されたデータを光学的に読み取る技術。",
    ),
    QuizItem(
      question: 'インターネット上でのビデオ通話や会議などに使用される、映像をデジタルデータとしてコンピュータに取り込むためのカメラは何か？',
      ans: 'Webカメラ',
      choices: ["Webカメラ", "デジタルカメラ", "アクションカメラ", "イメージスキャナ"],
      comment:
          "Webカメラは、インターネット上でのビデオ通話や会議などに使用される、映像をデジタルデータとしてコンピュータに取り込むためのカメラ。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 151 + 3000);
  });
}