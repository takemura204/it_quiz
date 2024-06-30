import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_6 {
  final quizItems = [
    QuizItem(
      word: 'CPU',
      question: 'CPUに関する記述のうち，適切なものはどれか。',
      ans: '同じ構造をもつCPUであれば，クロック周波数が高いものほど処理速度が速い。',
      choices: [
        "CPU内部に組み込まれているキャッシュメモリは，主記憶装置の容量を仮想的に拡張するために用いられる。",
        "CPUの演算機能は制御機能の一部である。",
        "CPUの演算機能は制御機能の一部である。",
        "同じ構造をもつCPUであれば，クロック周波数が高いものほど処理速度が速い。"
      ],
      comment:
          "CPU（Central Processing Unit）は、コンピュータの中心的な処理装置で、プログラムの命令を解釈し実行され、同じ構造を持つCPUであれば、クロック周波数が高くなるほど単位時間当たりの計算可能回数が多くなる。",
      source: '平成23年特別 問67',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'マルチコアプロセッサ',
      question: 'マルチコアプロセッサに関する記述のうち，適切なものはどれか。',
      ans: '各コアでそれぞれ別の処理を同時に実行することによって，システム全体の処理能力の向上を図る。',
      choices: [
        "各コアでそれぞれ別の処理を同時に実行することによって，システム全体の処理能力の向上を図る。",
        "複数のコアで同じ処理を実行することによって，処理結果の信頼性の向上を図る。",
        "複数のコアはハードウェアだけによって制御され，OSに特別な機能は必要ない。",
        "プロセッサの処理能力はコアの数だけに依存し，クロック周波数には依存しない。"
      ],
      comment: "マルチコアプロセッサは、複数台のプロセッサを並列に動作させることによって処理能力の向上を図ることを目的としたシステム構成。",
      source: '平成26年秋期 問53',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'GPU(Graphics Processing Unit)',
      question: 'GPUの説明として，適切なものはどれか。',
      ans: '三次元グラフィックスの画像処理などをCPUに代わって高速に実行する演算装置',
      choices: [
        "1秒間に何十億回の命令が実行できるかを示すCPUの処理能力を表す指標の一つ",
        "CPUが演算処理の同期をとるための周期的信号",
        "CPUと主記憶装置との間に設けられた，主記憶装置よりも読み書きが高速な記憶装置",
        "三次元グラフィックスの画像処理などをCPUに代わって高速に実行する演算装置"
      ],
      comment:
          "GPU(Graphics Processing Unit)は、PCなどにおいて画像処理を専門に担当するハードウェア部品で、動画再生や3DCGのレンダリングなどの高負荷な演算が要求される処理においてCPUの補助演算装置として機能する。",
      source: '平成28年秋期 問58',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'クロック周波数',
      question: 'CPUが一秒間に実行するクロックサイクルの数を表し、プロセッサの速度を示す指標は何か？',
      ans: 'クロック周波数',
      choices: ["クロック周波数", "バス速度", "メモリ速度", "伝送速度"],
      comment: "クロック周波数は、CPUが一秒間に実行するクロックサイクルの数を表し、プロセッサの速度の指標となる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      ans: 'SRAM',
      choices: ["SRAM", "DRAM", "ROM", "フラッシュメモリ"],
      word: 'SRAM（Static Random Access Memory）',
      comment:
          "SRAM（Static Random Access Memory）は、電源が切れるとデータを保持しないが、アクセス速度が非常に速い半導体メモリ。",
      source: '平成25年春期 問63',
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'DRAM（Dynamic Random Access Memory）',
      question: '電源が切れるとデータを失うが、SRAMよりも低コストで大容量を実現できる半導体メモリは何か？',
      ans: '主記憶装置に利用される。',
      choices: [
        "アクセスは，SRAMと比較して高速である。",
        "主記憶装置に利用される。",
        "電力供給が停止しても記憶内容は保持される。",
        "読出し専用のメモリである。"
      ],
      comment:
          "DRAM（Dynamic Random Access Memory）は、電源が切れるとデータを失うが、SRAMよりも低コストで大容量のメモリを実現できる。",
      source: '平成21年秋期 問83',
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ROM',
      question: 'DRAM，ROM，SRAM，フラッシュメモリのうち，電力供給が途絶えても内容が消えない不揮発性メモリはどれか',
      ans: 'ROMとフラッシュメモリ',
      choices: ["DRAMとSRAM", "DRAMとフラッシュメモリ", "ROMとSRAM", "ROMとフラッシュメモリ"],
      comment:
          "ROM（Read Only Memory）は、データを永続的に保存できるが、書き換えができない、または限られた回数しか書き換えできないメモリ。",
      source: '平成25年春期 問63',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'フラッシュメモリ',
      question: 'フラッシュメモリに関する記述として，適切なものはどれか。',
      ans: '記憶内容の保持に電源供給を必要としない。',
      choices: [
        "一度だけデータを書き込むことができ，以後読み出し専用である。",
        "記憶内容の保持に電源供給を必要としない。",
        "小型化が難しいので，デジタルカメラの記憶媒体には利用されない。",
        "レーザ光を用いてデータの読み書きを行う。"
      ],
      comment:
          "フラッシュメモリは、書き換え可能であり、電源を切ってもデータが消えない半導体メモリで、携帯電話、デジタルカメラなどの記憶媒体として広く普及していて、小型で大容量・安価なことため、手軽なデータの持ち運びに使われる。",
      source: '平成22年春期 問81',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word:
          'DDR SDRAM（Double Data Rate Synchronous Dynamic Random Access Memory）',
      question: 'DRAMの発展形で、高速なデータアクセスを実現するメモリ技術は何か？',
      ans: 'DDR SDRAM',
      choices: ["DDR SDRAM", "SRAM", "SIMM", "DIMM"],
      comment:
          "DDR SDRAM（Double Data Rate Synchronous Dynamic Random Access Memory）は、DRAMの発展形で、データの読み書き速度を向上させたメモリ技術。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'DIMM（Dual In-line Memory Module）',
      question: 'メモリモジュールの形状の一つで、デスクトップPCやサーバーなどで広く使用されるものは何か？',
      ans: 'DIMM',
      choices: ["DIMM", "SIMM", "DDR SDRAM", "SSD"],
      comment:
          "DIMM（Dual In-line Memory Module）は、メモリモジュールの形状の一つで、両面にチップが実装されており、デスクトップPCやサーバーなどで広く使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'ハードディスク装置(HDD)',
      question: 'PCの補助記憶装置であるハードディスク装置の説明として，適切なものはどれか。',
      ans: 'ランダムアクセスが可能である。',
      choices: [
        "CD-ROM装置に比べて読み書きの速度は遅い。",
        "主記憶装置としても利用される。",
        "データの保持に電力供給が必要である。",
        "ランダムアクセスが可能である。"
      ],
      comment:
          "ハードディスク装置(HDD)は、ガラスやアルミ合金，セラミックの薄い円盤状媒体表面に磁性体を塗布したものを複数枚重ね、その磁気円盤の表面にデータを記録する装置のこと",
      source: '平成24年春期 問63',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'SSD(Solid State Drive)',
      question:
          'フラッシュメモリを用いたSSD(Solid State Drive)は，ハードディスクの代わりとして期待されている記憶装置である。このSSDを用いるときに留意すべき点はどれか。',
      ans: '書込み回数に上限がある。',
      choices: [
        "書込み回数に上限がある。",
        "書込みよりも読出しが遅い。",
        "振動や衝撃に弱い。",
        "ファイルの断片化による性能悪化が著しい。"
      ],
      comment:
          "SSD(Solid State Drive)は、HDDにくらべてシークタイム・回転待ち時間等の機械動作時間がなく、データの読み書きが早いのが特徴の書き換え可能回数に上限な大容量記憶装置のこと",
      source: '平成21年秋期 問57',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'CD',
      question: '光学式記憶媒体の一つで、音楽やデータの保存に用いられる円盤状のメディアは何か？',
      ans: 'CD',
      choices: ["CD", "DVD", "Blu-ray Disc", "SDカード"],
      comment: "CDは、音楽やデータを保存するために用いられる光学式記憶媒体の一つ。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'DVD',
      question: 'コンピュータの補助記憶装置であるDVD装置の説明として，適切なものはどれか。',
      ans: '読取り専用のもの，繰返し書き込むことができるものなど，複数のタイプのメディアを利用できる。',
      choices: [
        "記録方式の性質上，CD-ROMを読むことはできない。",
        "小型化することが難しく，ノート型PCには搭載できない。",
        "データの読出しにはレーザ光を，書込みには磁気を用いる。",
        "読取り専用のもの，繰返し書き込むことができるものなど，複数のタイプのメディアを利用できる。"
      ],
      comment: "DVDは、CDと同じ媒体のサイズながらおよそ6倍のデジタルデータを記録できる光ディスク",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'Blu-ray Disc',
      question: '次の記憶媒体のうち，記録容量が最も大きいものはどれか。ここで，記憶媒体の直径は12cmとする。',
      ans: 'BD-R',
      choices: ["BD-R", "CD-R", "DVD-R", "DVD-RAM"],
      comment:
          "Blu-ray Discは、高いデータ密度を持ち、HD映像などの大容量データを保存するのに適した光学式記憶媒体のことで、片面一層のディスクに25GBのデータを記録することができる。",
      source: '平成25年春期 問70',
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      word: 'SDカード',
      question: '小型で取り扱いやすく、カメラやスマートフォンなどで使用されるフラッシュメモリ型の記憶媒体は何か？',
      ans: 'SDカード',
      choices: ["SDカード", "SSD", "CD", "HDD"],
      comment:
          "SDカード（Secure Digital Card）は、小型で取り扱いやすいフラッシュメモリ型の記憶媒体で、カメラやスマートフォンなどで広く使用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: 'キャッシュメモリ',
      question: 'PCのキャッシュメモリを説明したものはどれか。',
      ans: 'CPUコアと主記憶の間にあって，データを高速に読み書きするためのメモリ',
      choices: [
        "CPUコアと主記憶の間にあって，データを高速に読み書きするためのメモリ",
        "同じ内容のデータを2か所に記録して，信頼性を高めるためのメモリ",
        "主記憶容量を超える大きさプログラムでも動作させることができる仕組みをもつメモリ",
        "主記憶を複数のブロックに分割することによって，同時アクセスを可能にするメモリ"
      ],
      comment:
          "キャッシュメモリは、CPUコアと主記憶の間にあって，CPUが頻繁にアクセスするデータや命令を一時的に保存し、データアクセス速度の向上を図るための高速メモリ。",
      source: '平成22年春期 問66',
      importance: QuizImportanceType.high,
    ),
    QuizItem(
      word: '主記憶',
      question: 'CPUが直接アクセスすることができ、プログラムやデータを実行時に保持するメモリは何か？',
      ans: '主記憶',
      choices: ["主記憶", "補助記憶", "キャッシュメモリ", "フラッシュメモリ"],
      comment: "主記憶（主記憶装置、RAM）は、CPUが直接アクセスできるメモリで、プログラム実行時に使用されるデータや命令を保持する。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      word: '補助記憶',
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
