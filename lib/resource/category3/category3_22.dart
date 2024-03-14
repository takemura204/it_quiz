import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_22 {
  final quizItems = [
    QuizItem(
      question: 'リアルタイムで音声や映像データをインターネット上で配信し、ダウンロード完了を待たずに内容を視聴できる技術は何か？',
      ans: 'ストリーミング',
      choices: ["ストリーミング", "エンコード", "デコード", "DRM"],
      comment:
          "ストリーミングは、音声や映像データをリアルタイムでインターネット上に配信し、ユーザーがダウンロード完了を待たずに内容を視聴できるようにする技術。",
    ),
    QuizItem(
      question: 'データを特定の形式や規格に変換するプロセスは何と呼ばれるか？',
      ans: 'エンコード',
      choices: ["エンコード", "デコード", "ストリーミング", "DRM"],
      comment: "エンコードは、オーディオやビデオなどのデータを特定の形式や規格に変換するプロセスを指す。",
    ),
    QuizItem(
      question: 'エンコードされたデータを元の形式に戻すプロセスは何と呼ばれるか？',
      ans: 'デコード',
      choices: ["デコード", "エンコード", "ストリーミング", "CPRM"],
      comment: "デコードは、エンコードされたデータを元の形式や規格に戻すプロセスを指す。",
    ),
    QuizItem(
      question: 'デジタルコンテンツの著作権保護を目的とした技術や制度は何と呼ばれるか？',
      ans: 'DRM',
      choices: ["DRM", "CPRM", "エンコード", "デコード"],
      comment: "DRM（Digital Rights Management）は、デジタルコンテンツの著作権保護を目的とした技術や制度を指す。",
    ),
    QuizItem(
      question: '特にデジタル放送の録画コンテンツに適用される著作権保護技術は何か？',
      ans: 'CPRM',
      choices: ["CPRM", "DRM", "エンコード", "デコード"],
      comment:
          "CPRM（Content Protection for Recordable Media）は、特にデジタル放送の録画コンテンツに適用される著作権保護技術。",
    ),
    QuizItem(
      question: 'データを圧縮した後にも元のデータを完全に復元できる圧縮方式は何か？',
      ans: '可逆圧縮',
      choices: ["可逆圧縮", "非可逆圧縮", "レス圧縮", "ロス圧縮"],
      comment: "可逆圧縮（ロスレス圧縮）は、データを圧縮した後にも元のデータを完全に復元できる圧縮方式。",
    ),
    QuizItem(
      question: '圧縮時にある程度のデータを失うが、ファイルサイズを大幅に削減できる圧縮方式は何か？',
      ans: '非可逆圧縮',
      choices: ["非可逆圧縮", "可逆圧縮", "レス圧縮", "ロスレス圧縮"],
      comment: "非可逆圧縮（ロス圧縮）は、圧縮時にある程度のデータを失うが、ファイルサイズを大幅に削減できる圧縮方式。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 211 + 3000);
  });
}
