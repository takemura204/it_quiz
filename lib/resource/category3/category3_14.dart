import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_14 {
  final quizItems = [
    QuizItem(
      question:
          'コンピュータのハードウェアとアプリケーションソフトウェアの間を仲介し、コンピュータの基本的な機能を提供するソフトウェアは何か？',
      ans: 'OS',
      choices: ["OS", "CPU", "SSD", "RAM"],
      comment:
          "OS（オペレーティングシステム）は、コンピュータのハードウェアとアプリケーションソフトウェアの間を仲介し、システムの基本的な機能を提供するソフトウェア。",
    ),
    QuizItem(
      question: 'マイクロソフト社によって開発され、世界中で広く使用されているオペレーティングシステムは何か？',
      ans: 'Windows',
      choices: ["Windows", "Mac OS", "Linux", "Chrome OS"],
      comment:
          "Windowsは、マイクロソフト社によって開発されたオペレーティングシステムで、個人用コンピュータから企業向けサーバまで幅広く使用されている。",
    ),
    QuizItem(
      question: 'アップル社によって開発され、Macintoshコンピュータで使用されるオペレーティングシステムは何か？',
      ans: 'Mac OS',
      choices: ["Mac OS", "Windows", "UNIX", "iOS"],
      comment: "Mac OSは、アップル社によって開発されたオペレーティングシステムで、Macintoshコンピュータで使用されている。",
    ),
    QuizItem(
      question: '複数のユーザーや複数のタスクを同時に処理することを目的として設計された、高度なオペレーティングシステムの一種は何か？',
      ans: 'UNIX',
      choices: ["UNIX", "Windows", "Mac OS", "Linux"],
      comment: "UNIXは、複数のユーザーや複数のタスクを同時に処理することを目的として設計された、高度なオペレーティングシステムの一種。",
    ),
    QuizItem(
      question: 'Googleによって開発され、クラウドコンピューティングに特化したオペレーティングシステムは何か？',
      ans: 'Chrome OS',
      choices: ["Chrome OS", "Android", "Windows", "Mac OS"],
      comment:
          "Chrome OSは、Googleによって開発されたオペレーティングシステムで、クラウドコンピューティングに特化し、主にChromebookで使用されている。",
    ),
    QuizItem(
      question:
          'オープンソースで開発されているUNIX系のオペレーティングシステムで、サーバやデスクトップなど幅広い用途で使用されているものは何か？',
      ans: 'Linux',
      choices: ["Linux", "UNIX", "Windows", "Chrome OS"],
      comment:
          "Linuxは、オープンソースで開発されているUNIX系のオペレーティングシステムで、その柔軟性と自由度の高さから、サーバやデスクトップなど幅広い用途で使用されている。",
    ),
    QuizItem(
      question: 'アップル社によって開発され、iPhoneやiPadなどのモバイルデバイスで使用されるオペレーティングシステムは何か？',
      ans: 'iOS',
      choices: ["iOS", "Android", "Windows Mobile", "Chrome OS"],
      comment:
          "iOSは、アップル社によって開発されたオペレーティングシステムで、iPhoneやiPadなどのモバイルデバイスで使用されている。",
    ),
    QuizItem(
      question:
          'Googleによって開発され、スマートフォンやタブレットなどのモバイルデバイスで広く使用されているオペレーティングシステムは何か？',
      ans: 'Android',
      choices: ["Android", "iOS", "Windows Phone", "BlackBerry OS"],
      comment:
          "Androidは、Googleによって開発されたオペレーティングシステムで、スマートフォンやタブレットなどのモバイルデバイスで広く使用されている。",
    ),
    QuizItem(
      question: '物理メモリよりも大きなメモリ空間を提供するため、ディスクの一部をメモリのように使用する技術は何か？',
      ans: '仮想記憶',
      choices: ["仮想記憶", "キャッシュメモリ", "フラッシュメモリ", "RAMディスク"],
      comment:
          "仮想記憶は、物理メモリよりも大きなメモリ空間を提供するために、ディスクの一部をメモリのように使用する技術。これにより、実際の物理メモリサイズを超えるアプリケーションの実行を可能にする。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 131 + 3000);
  });
}
