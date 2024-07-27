import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_10 {
  final quizItems = [
    QuizItem(
      word: 'OS（オペレーティングシステム）',
      question: 'PCのOSに関する記述のうち，適切なものはどれか。',
      ans: 'PCのOSには，ハードディスク以外のCD-ROMやUSBメモリなどの外部記憶装置を利用して起動できるものもある。',
      choices: [
        "1台のPCにインストールして起動することのできるOSは1種類だけである。",
        "64ビットCPUに対応するPC用OSは開発されていない。",
        "OSのバージョンアップに伴い，旧バージョンのOS環境で動作していた全てのアプリケーションソフトは動作しなくなる。",
        "PCのOSには，ハードディスク以外のCD-ROMやUSBメモリなどの外部記憶装置を利用して起動できるものもある。"
      ],
      comment:
          "OS（オペレーティングシステム）とは、コンピュータを効率よく使うために、共通して使われるプログラムをまとめて提供する基本ソフトウェアのことで、PCにおけるWindows・MacOS・UNIX、モバイル端末におけるiOSやAndroidがOSに該当する。",
      source: '平成26年春期 問78',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: 'Windows',
      question: 'マイクロソフト社によって開発され、世界中で広く使用されているオペレーティングシステムは何か？',
      ans: 'Windows',
      choices: ["Windows", "Mac OS", "Linux", "Chrome OS"],
      comment:
          "Windowsは、マイクロソフト社によって開発されたオペレーティングシステムで、個人用コンピュータから企業向けサーバまで幅広く使用されている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'Mac OS',
      question: 'アップル社によって開発され、Macintoshコンピュータで使用されるオペレーティングシステムは何か？',
      ans: 'Mac OS',
      choices: ["Mac OS", "Windows", "UNIX", "iOS"],
      comment: "Mac OSは、アップル社によって開発されたオペレーティングシステムで、Macintoshコンピュータで使用されている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'UNIX',
      question: '複数のユーザーや複数のタスクを同時に処理することを目的として設計された、高度なオペレーティングシステムの一種は何か？',
      ans: 'UNIX',
      choices: ["UNIX", "Windows", "Mac OS", "Linux"],
      comment: "UNIXは、複数のユーザーや複数のタスクを同時に処理することを目的として設計された、高度なオペレーティングシステムの一種。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'Chrome OS',
      question: 'Googleによって開発され、クラウドコンピューティングに特化したオペレーティングシステムは何か？',
      ans: 'Chrome OS',
      choices: ["Chrome OS", "Android", "Windows", "Mac OS"],
      comment:
          "Chrome OSは、Googleによって開発されたオペレーティングシステムで、クラウドコンピューティングに特化し、主にChromebookで使用されている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'Linux',
      question:
          'オープンソースで開発されているUNIX系のオペレーティングシステムで、サーバやデスクトップなど幅広い用途で使用されているものは何か？',
      ans: 'Linux',
      choices: ["Linux", "UNIX", "Windows", "Chrome OS"],
      comment:
          "Linuxは、オープンソースで開発されているUNIX系のオペレーティングシステムで、その柔軟性と自由度の高さから、サーバやデスクトップなど幅広い用途で使用されている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'iOS',
      question: 'アップル社によって開発され、iPhoneやiPadなどのモバイルデバイスで使用されるオペレーティングシステムは何か？',
      ans: 'iOS',
      choices: ["iOS", "Android", "Windows Mobile", "Chrome OS"],
      comment:
          "iOSは、アップル社によって開発されたオペレーティングシステムで、iPhoneやiPadなどのモバイルデバイスで使用されている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'Android',
      question:
          'Googleによって開発され、スマートフォンやタブレットなどのモバイルデバイスで広く使用されているオペレーティングシステムは何か？',
      ans: 'Android',
      choices: ["Android", "iOS", "Windows Phone", "BlackBerry OS"],
      comment:
          "Androidは、Googleによって開発されたオペレーティングシステムで、スマートフォンやタブレットなどのモバイルデバイスで広く使用されている。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '仮想記憶',
      question: 'OSの機能の一つである仮想記憶方式の目的はどれか。',
      ans: '主記憶の容量よりも大きなメモリを必要とするプログラムも実行できるようにする。',
      choices: [
        "OSが使用している主記憶の領域などに，アプリケーションプログラムがアクセスすることを防止する。",
        "主記憶の情報をハードディスクに書き出してから電力供給を停止することで，作業休止中の電力消費を少なくする。",
        "主記憶の容量よりも大きなメモリを必要とするプログラムも実行できるようにする。",
        "主記憶よりもアクセスが高速なメモリを介在させることによって，CPUの処理を高速化する。"
      ],
      comment:
          "仮想記憶方式は、プログラムが必要とするメモリサイズが主記憶のサイズを上回った場合、補助記憶装置(HDDなど)を仮想アドレス空間として使い主記憶のサイズよりも大きなプログラムを実行可能にする方式。",
      source: '平成21年秋期 問59',
      importance: QuizImportanceType.normal,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 1001);
  });
}
