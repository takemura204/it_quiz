import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_8 {
  final quizItems = [
    QuizItem(
      question: '磁気ディスクを使用してデータを保存する、従来型の記憶装置は何か？',
      ans: 'HDD',
      choices: ["HDD", "SSD", "SDカード", "フラッシュメモリ"],
      comment:
          "HDD（Hard Disk Drive）は、磁気ディスクを使用してデータを保存する従来型の記憶装置で、大容量のデータ保存に利用される。",
    ),
    QuizItem(
      question: 'フラッシュメモリを使用し、HDDに比べて高速なデータアクセスを実現する記憶装置は何か？',
      ans: 'SSD',
      choices: ["SSD", "HDD", "CD", "SDカード"],
      comment:
          "SSD（Solid State Drive）は、フラッシュメモリを使用した記憶装置で、HDDに比べて高速なデータアクセスと耐衝撃性を実現する。",
    ),
    QuizItem(
      question: '光学式記憶媒体の一つで、音楽やデータの保存に用いられる円盤状のメディアは何か？',
      ans: 'CD',
      choices: ["CD", "DVD", "Blu-ray Disc", "SDカード"],
      comment: "CD（Compact Disc）は、音楽やデータを保存するために用いられる光学式記憶媒体の一つ。",
    ),
    QuizItem(
      question: 'CDよりも大容量のデータを保存できる光学式記憶媒体は何か？',
      ans: 'DVD',
      choices: ["DVD", "CD", "Blu-ray Disc", "SDカード"],
      comment: "DVDは、CDよりも大容量のデータを保存できる光学式記憶媒体で、ビデオやデータの保存に広く使用される。",
    ),
    QuizItem(
      question: '高いデータ密度を持ち、HD映像などの大容量データの保存に適した光学式記憶媒体は何か？',
      ans: 'Blu-ray Disc',
      choices: ["Blu-ray Disc", "CD", "DVD", "SDカード"],
      comment: "Blu-ray Discは、高いデータ密度を持ち、HD映像などの大容量データを保存するのに適した光学式記憶媒体。",
    ),
    QuizItem(
      question: '小型で取り扱いやすく、カメラやスマートフォンなどで使用されるフラッシュメモリ型の記憶媒体は何か？',
      ans: 'SDカード',
      choices: ["SDカード", "SSD", "CD", "HDD"],
      comment:
          "SDカード（Secure Digital Card）は、小型で取り扱いやすいフラッシュメモリ型の記憶媒体で、カメラやスマートフォンなどで広く使用される。",
    ),
    QuizItem(
      question: 'CPUがよくアクセスするデータや命令を一時的に保存し、アクセス速度の向上を図るメモリは何か？',
      ans: 'キャッシュメモリ',
      choices: ["キャッシュメモリ", "SRAM", "DRAM", "ROM"],
      comment: "キャッシュメモリは、CPUが頻繁にアクセスするデータや命令を一時的に保存し、データアクセス速度の向上を図るための高速メモリ。",
    ),
    QuizItem(
      question: 'CPUが直接アクセスすることができ、プログラムやデータを実行時に保持するメモリは何か？',
      ans: '主記憶',
      choices: ["主記憶", "補助記憶", "キャッシュメモリ", "フラッシュメモリ"],
      comment: "主記憶（主記憶装置、RAM）は、CPUが直接アクセスできるメモリで、プログラム実行時に使用されるデータや命令を保持する。",
    ),
    QuizItem(
      question: 'データを永続的に保存するための記憶装置で、主記憶よりも大容量のデータを保持することができる装置は何か？',
      ans: '補助記憶',
      choices: ["補助記憶", "主記憶", "キャッシュメモリ", "SSD"],
      comment:
          "補助記憶（補助記憶装置）は、データを永続的に保存し、主記憶よりも大容量のデータを保持するための記憶装置。HDDやSSDなどがこれに該当する。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 71 + 3000);
  });
}
