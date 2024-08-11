import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_15 {
  final quizItems = [
    QuizItem(
      word: 'HTML5',
      question: 'ウェブページの構造を定義するためのマークアップ言語の最新規格は何か？',
      ans: 'HTML5',
      choices: ["HTML5", "JPEG", "PDF", "ZIP"],
      comment: "HTML5は、ウェブページの構造を定義するためのマークアップ言語の最新規格で、多くの新しい機能とAPIをサポートしている。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'MP3(Mpeg Audio Layer-3)',
      question: 'マルチメディアのファイル形式であるMP3はどれか。',
      ans: '音声データのためのファイル圧縮形式',
      choices: [
        "G4ファクシミリ通信データのためのファイル圧縮形式",
        "音声データのためのファイル圧縮形式",
        "カラー画像データのためのファイル圧縮形式",
        "デジタル動画データのためのファイル圧縮形式"
      ],
      comment:
          "MP3(Mpeg Audio Layer-3)は、MPEG-1という動画圧縮形式で使われる不可逆音声圧縮方式の一つです。音声の圧縮方式では現在もっとも普及していている。",
      source: '平成21年春期 問78',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'MIDI(Musical Instrument Digital Interface)',
      question: 'シンセサイザなどの電子楽器とPCを接続して演奏情報をやり取りするための規格はどれか。',
      ans: 'MIDI',
      choices: ["AVI", "BMP", "MIDI", "MP3"],
      comment:
          "MIDI(Musical Instrument Digital Interface)は、コンピュータやシンセサイザなどの電子楽器の間で、演奏情報や制御情報をデジタル形式でやり取りするための世界共通規格。",
      source: '平成24年春期 問64',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'JPEG',
      question: 'デジタル画像を保存するための一般的なファイルフォーマットは何か？',
      ans: 'JPEG',
      choices: ["JPEG", "GIF", "PNG", "BMP"],
      comment: "JPEGは、デジタル画像を保存するための一般的なファイルフォーマットで、特に写真の保存やウェブでの使用に適している。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'GIF（Graphics Interchange Format）',
      question: 'アニメーションや透明度をサポートする画像フォーマットは何か？',
      ans: 'GIF',
      choices: ["GIF", "JPEG", "PNG", "BMP"],
      comment: "GIF（Graphics Interchange Format）は、アニメーションや透明度をサポートする画像フォーマットで、ウェブで広く使用されている。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'PNG（Portable Network Graphics）',
      question: '画像の品質を落とさずに効率的に圧縮できるファイルフォーマットは何か？',
      ans: 'PNG',
      choices: ["PNG", "JPEG", "GIF", "BMP"],
      comment:
          "PNG（Portable Network Graphics）は、画像の品質を落とさずに効率的に圧縮できるファイルフォーマットで、透明度のサポートやロスレス圧縮が特徴。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'BMP（Bitmap Image File）',
      question: 'Windows環境で広く使用されるビットマップ画像フォーマットは何か？',
      ans: 'BMP',
      choices: ["BMP", "JPEG", "PNG", "GIF"],
      comment: "BMP（Bitmap Image File）は、Windows環境で広く使用されるビットマップ画像フォーマットで、非圧縮のためファイルサイズが大きくなる傾向がある。",
      importance: ImportanceType.none,
    ),
    QuizItem(
      word: 'MPEG（Moving Picture Experts Group）',
      question: '動画や音声の圧縮に用いられる標準的なフォーマットは何か？',
      ans: 'MPEG',
      choices: ["BMP", "GIF", "JPEG", "MPEG"],
      comment:
          "MPEG（Moving Picture Experts Group）は、カラー動画像の圧縮フォーマットで、映像データや音声データの圧縮方式のMPEG1、MPEG2、MPEG4、MPEG7などの規格がある。",
      source: '平成25年春期 問79',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'PDF（Portable Document Format）',
      question: '電子文書を保存するために用いられるファイルフォーマットで、元のレイアウトを保持できるものは何か？',
      ans: 'PDF',
      choices: ["PDF", "DOC", "XLS", "PPT"],
      comment:
          "PDF（Portable Document Format）は、電子文書を保存するために用いられるファイルフォーマットで、元のレイアウトを保持しながら様々なプラットフォームで表示できる。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ZIP',
      question: '複数のファイルやフォルダを一つのファイルに圧縮してまとめるファイルフォーマットは何か？',
      ans: 'ZIP',
      choices: ["ZIP", "RAR", "7z", "TAR"],
      comment: "ZIPは、複数のファイルやフォルダを一つのファイルに圧縮してまとめるファイルフォーマットで、データの圧縮とアーカイブに広く使用されている。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ストリーミング',
      question: 'ストリーミングを利用した動画配信の特徴に関する記述のうち，適切なものはどれか。',
      ans: '動画のデータが全てダウンロードされるのを待たず，一部を読み込んだ段階で再生が始まる。',
      choices: [
        "サーバに配信データをあらかじめ保持していることが必須であり，イベントやスポーツなどを撮影しながらその映像を配信することはできない。",
        "受信データの部分的な欠落による画質の悪化を完全に排除することが可能である。",
        "動画再生の開始に準備時間を必要としないので，瞬時に動画の視聴を開始できる。",
        "動画のデータが全てダウンロードされるのを待たず，一部を読み込んだ段階で再生が始まる。"
      ],
      comment: "ストリーミングは、音声や映像データをリアルタイムでインターネット上に配信し、ユーザーがダウンロード完了を待たずに内容を視聴できるようにする技術。",
      source: '平成27年春期 問76',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'エンコード',
      question: 'データを特定の形式や規格に変換するプロセスは何と呼ばれるか？',
      ans: 'エンコード',
      choices: ["エンコード", "デコード", "ストリーミング", "DRM"],
      comment: "エンコードは、オーディオやビデオなどのデータを特定の形式や規格に変換するプロセスを指す。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'デコード',
      question: 'エンコードされたデータを元の形式に戻すプロセスは何と呼ばれるか？',
      ans: 'デコード',
      choices: ["デコード", "エンコード", "ストリーミング", "CPRM"],
      comment: "デコードは、エンコードされたデータを元の形式や規格に戻すプロセスを指す。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'DRM（Digital Rights Management）',
      question: 'デジタルコンテンツの著作権保護を目的とした技術や制度は何と呼ばれるか？',
      ans: 'DRM',
      choices: ["DRM", "CPRM", "エンコード", "デコード"],
      comment: "DRM（Digital Rights Management）は、デジタルコンテンツの著作権保護を目的とした技術や制度を指す。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'CPRM（Content Protection for Recordable Media）',
      question: '特にデジタル放送の録画コンテンツに適用される著作権保護技術は何か？',
      ans: 'CPRM',
      choices: ["CPRM", "DRM", "エンコード", "デコード"],
      comment: "CPRM（Content Protection for Recordable Media）は、特にデジタル放送の録画コンテンツに適用される著作権保護技術。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '可逆圧縮',
      question: 'データを圧縮した後にも元のデータを完全に復元できる圧縮方式は何か？',
      ans: '可逆圧縮',
      choices: ["可逆圧縮", "非可逆圧縮", "レス圧縮", "ロス圧縮"],
      comment: "可逆圧縮は、データを圧縮した後にも元のデータを完全に復元できる圧縮方式。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '非可逆圧縮',
      question: '圧縮時にある程度のデータを失うが、ファイルサイズを大幅に削減できる圧縮方式は何か？',
      ans: '非可逆圧縮',
      choices: ["非可逆圧縮", "可逆圧縮", "レス圧縮", "ロスレス圧縮"],
      comment: "非可逆圧縮（ロス圧縮）は、圧縮時にある程度のデータを失うが、ファイルサイズを大幅に削減できる圧縮方式。",
      importance: ImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category3Index + 1501);
  });
}
