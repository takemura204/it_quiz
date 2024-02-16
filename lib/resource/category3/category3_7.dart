import '../../model/quiz_item/quiz_item.dart';

List<QuizItem> get category3_7 {
  final quizItems = [
    QuizItem(
      question: 'コンピュータの中心的な処理装置であり、プログラムの命令を解釈し実行する部品は何か？',
      ans: 'CPU',
      choices: ["CPU", "GPU", "SSD", "HDD"],
      comment:
          "CPU（Central Processing Unit）は、コンピュータの中心的な処理装置で、プログラムの命令を解釈し実行する。",
    ),
    QuizItem(
      question: '複数のCPUを搭載し、並列処理能力を高めるシステム構成は何か？',
      ans: 'マルチプロセッサ',
      choices: ["マルチプロセッサ", "マルチコア", "シングルプロセッサ", "デュアルコア"],
      comment: "マルチプロセッサシステムは、複数のCPUを搭載することで並列処理能力を高め、処理速度の向上を図るシステム構成。",
    ),
    QuizItem(
      question: '特に画像処理やビデオレンダリングにおいて高い処理能力を発揮する、専用のプロセッサは何か？',
      ans: 'GPU',
      choices: ["GPU", "CPU", "DSP", "FPGA"],
      comment:
          "GPU（Graphics Processing Unit）は、グラフィックス処理や並列計算に特化したプロセッサで、特に画像処理やビデオレンダリングに高い処理能力を発揮する。",
    ),
    QuizItem(
      question: 'CPUが一秒間に実行するクロックサイクルの数を表し、プロセッサの速度を示す指標は何か？',
      ans: 'クロック周波数',
      choices: ["クロック周波数", "バス速度", "メモリ速度", "伝送速度"],
      comment: "クロック周波数は、CPUが一秒間に実行するクロックサイクルの数を表し、プロセッサの速度の指標となる。",
    ),
    QuizItem(
      question: '電源が切れてもデータを保持しないが、アクセス速度が非常に速い半導体メモリは何か？',
      ans: 'SRAM',
      choices: ["SRAM", "DRAM", "ROM", "フラッシュメモリ"],
      comment:
          "SRAM（Static Random Access Memory）は、電源が切れるとデータを保持しないが、アクセス速度が非常に速い半導体メモリ。",
    ),
    QuizItem(
      question: '電源が切れるとデータを失うが、SRAMよりも低コストで大容量を実現できる半導体メモリは何か？',
      ans: 'DRAM',
      choices: ["DRAM", "SRAM", "ROM", "フラッシュメモリ"],
      comment:
          "DRAM（Dynamic Random Access Memory）は、電源が切れるとデータを失うが、SRAMよりも低コストで大容量のメモリを実現できる。",
    ),
    QuizItem(
      question: 'データを永続的に保存できるが、書き換えができない、または限られた回数しか書き換えできないメモリは何か？',
      ans: 'ROM',
      choices: ["ROM", "RAM", "SSD", "フラッシュメモリ"],
      comment:
          "ROM（Read Only Memory）は、データを永続的に保存できるが、書き換えができない、または限られた回数しか書き換えできないメモリ。",
    ),
    QuizItem(
      question: '電源が切れてもデータを保持し、USBメモリやSSDなどに利用される非揮発性の記憶媒体は何か？',
      ans: 'フラッシュメモリ',
      choices: ["フラッシュメモリ", "SRAM", "DRAM", "ROM"],
      comment: "フラッシュメモリは、電源が切れてもデータを保持する非揮発性の記憶媒体で、USBメモリやSSDなどに利用される。",
    ),
    QuizItem(
      question: 'DRAMの発展形で、高速なデータアクセスを実現するメモリ技術は何か？',
      ans: 'DDR SDRAM',
      choices: ["DDR SDRAM", "SRAM", "SIMM", "DIMM"],
      comment:
          "DDR SDRAM（Double Data Rate Synchronous Dynamic Random Access Memory）は、DRAMの発展形で、データの読み書き速度を向上させたメモリ技術。",
    ),
    QuizItem(
      question: 'メモリモジュールの形状の一つで、デスクトップPCやサーバーなどで広く使用されるものは何か？',
      ans: 'DIMM',
      choices: ["DIMM", "SIMM", "DDR SDRAM", "SSD"],
      comment:
          "DIMM（Dual In-line Memory Module）は、メモリモジュールの形状の一つで、両面にチップが実装されており、デスクトップPCやサーバーなどで広く使用される。",
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + 61 + 3000);
  });
}
