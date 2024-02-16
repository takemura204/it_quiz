import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_20 {
  final quizItems = [
    QuizItem(
      question: 'ウェブページの構造を定義するためのマークアップ言語の最新規格は何か？',
      ans: 'HTML5',
      choices: ["HTML5", "JPEG", "PDF", "ZIP"],
      comment: "HTML5は、ウェブページの構造を定義するためのマークアップ言語の最新規格で、多くの新しい機能とAPIをサポートしている。",
    ),
    QuizItem(
      question: '音声ファイルを圧縮するために広く使用されるフォーマットは何か？',
      ans: 'MP3',
      choices: ["MP3", "MIDI", "WAV", "AAC"],
      comment: "MP3は、音声ファイルを圧縮するために広く使用されるフォーマットで、音楽ファイルの配信や共有によく用いられる。",
    ),
    QuizItem(
      question: '音楽の演奏情報をコンピュータで扱うための規格は何か？',
      ans: 'MIDI',
      choices: ["MIDI", "MP3", "WAV", "AAC"],
      comment:
          "MIDI（Musical Instrument Digital Interface）は、音楽の演奏情報をコンピュータで扱うための規格で、電子楽器間の通信や制御に用いられる。",
    ),
    QuizItem(
      question: 'デジタル画像を保存するための一般的なファイルフォーマットは何か？',
      ans: 'JPEG',
      choices: ["JPEG", "GIF", "PNG", "BMP"],
      comment: "JPEGは、デジタル画像を保存するための一般的なファイルフォーマットで、特に写真の保存やウェブでの使用に適している。",
    ),
    QuizItem(
      question: 'アニメーションや透明度をサポートする画像フォーマットは何か？',
      ans: 'GIF',
      choices: ["GIF", "JPEG", "PNG", "BMP"],
      comment:
          "GIF（Graphics Interchange Format）は、アニメーションや透明度をサポートする画像フォーマットで、ウェブで広く使用されている。",
    ),
    QuizItem(
      question: '画像の品質を落とさずに効率的に圧縮できるファイルフォーマットは何か？',
      ans: 'PNG',
      choices: ["PNG", "JPEG", "GIF", "BMP"],
      comment:
          "PNG（Portable Network Graphics）は、画像の品質を落とさずに効率的に圧縮できるファイルフォーマットで、透明度のサポートやロスレス圧縮が特徴。",
    ),
    QuizItem(
      question: 'Windows環境で広く使用されるビットマップ画像フォーマットは何か？',
      ans: 'BMP',
      choices: ["BMP", "JPEG", "PNG", "GIF"],
      comment:
          "BMP（Bitmap Image File）は、Windows環境で広く使用されるビットマップ画像フォーマットで、非圧縮のためファイルサイズが大きくなる傾向がある。",
    ),
    QuizItem(
      question: '動画や音声の圧縮に用いられる標準的なフォーマットは何か？',
      ans: 'MPEG',
      choices: ["MPEG", "MP3", "AVI", "MOV"],
      comment:
          "MPEG（Moving Picture Experts Group）は、動画や音声の圧縮に用いられる標準的なフォーマットで、複数の規格がある。",
    ),
    QuizItem(
      question: '電子文書を保存するために用いられるファイルフォーマットで、元のレイアウトを保持できるものは何か？',
      ans: 'PDF',
      choices: ["PDF", "DOC", "XLS", "PPT"],
      comment:
          "PDF（Portable Document Format）は、電子文書を保存するために用いられるファイルフォーマットで、元のレイアウトを保持しながら様々なプラットフォームで表示できる。",
    ),
    QuizItem(
      question: '複数のファイルやフォルダを一つのファイルに圧縮してまとめるファイルフォーマットは何か？',
      ans: 'ZIP',
      choices: ["ZIP", "RAR", "7z", "TAR"],
      comment:
          "ZIPは、複数のファイルやフォルダを一つのファイルに圧縮してまとめるファイルフォーマットで、データの圧縮とアーカイブに広く使用されている。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 191 + 3000);
  });
}
