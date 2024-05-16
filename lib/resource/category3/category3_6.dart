import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_6 {
  final quizItems = [
    QuizItem(
      question: 'コンピュータの中心的な処理装置であり、プログラムの命令を解釈し実行する部品は何か？',
      ans: 'CPU',
      choices: ["CPU", "GPU", "SSD", "HDD"],
      comment:
          "CPU（Central Processing Unit）は、コンピュータの中心的な処理装置で、プログラムの命令を解釈し実行する。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '複数のCPUを搭載し、並列処理能力を高めるシステム構成は何か？',
      ans: 'マルチプロセッサ',
      choices: ["マルチプロセッサ", "マルチコア", "シングルプロセッサ", "デュアルコア"],
      comment: "マルチプロセッサシステムは、複数のCPUを搭載することで並列処理能力を高め、処理速度の向上を図るシステム構成。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '特に画像処理やビデオレンダリングにおいて高い処理能力を発揮する、専用のプロセッサは何か？',
      ans: 'GPU',
      choices: ["GPU", "CPU", "DSP", "FPGA"],
      comment:
          "GPU（Graphics Processing Unit）は、グラフィックス処理や並列計算に特化したプロセッサで、特に画像処理やビデオレンダリングに高い処理能力を発揮する。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'CPUが一秒間に実行するクロックサイクルの数を表し、プロセッサの速度を示す指標は何か？',
      ans: 'クロック周波数',
      choices: ["クロック周波数", "バス速度", "メモリ速度", "伝送速度"],
      comment: "クロック周波数は、CPUが一秒間に実行するクロックサイクルの数を表し、プロセッサの速度の指標となる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '電源が切れてもデータを保持しないが、アクセス速度が非常に速い半導体メモリは何か？',
      ans: 'SRAM',
      choices: ["SRAM", "DRAM", "ROM", "フラッシュメモリ"],
      comment:
          "SRAM（Static Random Access Memory）は、電源が切れるとデータを保持しないが、アクセス速度が非常に速い半導体メモリ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '電源が切れるとデータを失うが、SRAMよりも低コストで大容量を実現できる半導体メモリは何か？',
      ans: 'DRAM',
      choices: ["DRAM", "SRAM", "ROM", "フラッシュメモリ"],
      comment:
          "DRAM（Dynamic Random Access Memory）は、電源が切れるとデータを失うが、SRAMよりも低コストで大容量のメモリを実現できる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'データを永続的に保存できるが、書き換えができない、または限られた回数しか書き換えできないメモリは何か？',
      ans: 'ROM',
      choices: ["ROM", "RAM", "SSD", "フラッシュメモリ"],
      comment:
          "ROM（Read Only Memory）は、データを永続的に保存できるが、書き換えができない、または限られた回数しか書き換えできないメモリ。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '電源が切れてもデータを保持し、USBメモリやSSDなどに利用される非揮発性の記憶媒体は何か？',
      ans: 'フラッシュメモリ',
      choices: ["フラッシュメモリ", "SRAM", "DRAM", "ROM"],
      comment: "フラッシュメモリは、電源が切れてもデータを保持する非揮発性の記憶媒体で、USBメモリやSSDなどに利用される。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'DRAMの発展形で、高速なデータアクセスを実現するメモリ技術は何か？',
      ans: 'DDR SDRAM',
      choices: ["DDR SDRAM", "SRAM", "SIMM", "DIMM"],
      comment:
          "DDR SDRAM（Double Data Rate Synchronous Dynamic Random Access Memory）は、DRAMの発展形で、データの読み書き速度を向上させたメモリ技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'メモリモジュールの形状の一つで、デスクトップPCやサーバーなどで広く使用されるものは何か？',
      ans: 'DIMM',
      choices: ["DIMM", "SIMM", "DDR SDRAM", "SSD"],
      comment:
          "DIMM（Dual In-line Memory Module）は、メモリモジュールの形状の一つで、両面にチップが実装されており、デスクトップPCやサーバーなどで広く使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '磁気ディスクを使用してデータを保存する、従来型の記憶装置は何か？',
      ans: 'HDD',
      choices: ["HDD", "SSD", "SDカード", "フラッシュメモリ"],
      comment:
          "HDD（Hard Disk Drive）は、磁気ディスクを使用してデータを保存する従来型の記憶装置で、大容量のデータ保存に利用される。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'フラッシュメモリを使用し、HDDに比べて高速なデータアクセスを実現する記憶装置は何か？',
      ans: 'SSD',
      choices: ["SSD", "HDD", "CD", "SDカード"],
      comment:
          "SSD（Solid State Drive）は、フラッシュメモリを使用した記憶装置で、HDDに比べて高速なデータアクセスと耐衝撃性を実現する。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '光学式記憶媒体の一つで、音楽やデータの保存に用いられる円盤状のメディアは何か？',
      ans: 'CD',
      choices: ["CD", "DVD", "Blu-ray Disc", "SDカード"],
      comment: "CD（Compact Disc）は、音楽やデータを保存するために用いられる光学式記憶媒体の一つ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'CDよりも大容量のデータを保存できる光学式記憶媒体は何か？',
      ans: 'DVD',
      choices: ["DVD", "CD", "Blu-ray Disc", "SDカード"],
      comment: "DVDは、CDよりも大容量のデータを保存できる光学式記憶媒体で、ビデオやデータの保存に広く使用される。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '高いデータ密度を持ち、HD映像などの大容量データの保存に適した光学式記憶媒体は何か？',
      ans: 'Blu-ray Disc',
      choices: ["Blu-ray Disc", "CD", "DVD", "SDカード"],
      comment: "Blu-ray Discは、高いデータ密度を持ち、HD映像などの大容量データを保存するのに適した光学式記憶媒体。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '小型で取り扱いやすく、カメラやスマートフォンなどで使用されるフラッシュメモリ型の記憶媒体は何か？',
      ans: 'SDカード',
      choices: ["SDカード", "SSD", "CD", "HDD"],
      comment:
          "SDカード（Secure Digital Card）は、小型で取り扱いやすいフラッシュメモリ型の記憶媒体で、カメラやスマートフォンなどで広く使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'CPUがよくアクセスするデータや命令を一時的に保存し、アクセス速度の向上を図るメモリは何か？',
      ans: 'キャッシュメモリ',
      choices: ["キャッシュメモリ", "SRAM", "DRAM", "ROM"],
      comment: "キャッシュメモリは、CPUが頻繁にアクセスするデータや命令を一時的に保存し、データアクセス速度の向上を図るための高速メモリ。",
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      question: 'CPUが直接アクセスすることができ、プログラムやデータを実行時に保持するメモリは何か？',
      ans: '主記憶',
      choices: ["主記憶", "補助記憶", "キャッシュメモリ", "フラッシュメモリ"],
      comment: "主記憶（主記憶装置、RAM）は、CPUが直接アクセスできるメモリで、プログラム実行時に使用されるデータや命令を保持する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'データを永続的に保存するための記憶装置で、主記憶よりも大容量のデータを保持することができる装置は何か？',
      ans: '補助記憶',
      choices: ["補助記憶", "主記憶", "キャッシュメモリ", "SSD"],
      comment:
          "補助記憶（補助記憶装置）は、データを永続的に保存し、主記憶よりも大容量のデータを保持するための記憶装置。HDDやSSDなどがこれに該当する。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 601);
  });
}
