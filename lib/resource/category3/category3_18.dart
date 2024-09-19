import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_18 {
  final quizItems = [
    QuizItem(
      word: '射影',
      question: 'テーブルから特定の列だけを取り出す操作は何と呼ばれるか？',
      ans: '射影',
      choices: ["射影", "選択", "排他制御", "トランザクション"],
      comment: "射影は、テーブルから特定の列だけを取り出す操作で、クエリにおいて特定の属性のみを抽出する際に用いられる。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: '選択',
      question: '関係データベースの"商品"表から価格が100円以上の商品の行(レコード)だけを全て抽出する操作を何というか。',
      ans: '選択',
      choices: ["結合", "射影", "選択", "和"],
      comment: "選択は、テーブルから特定の条件を満たす行だけを取り出す操作で、特定の条件に一致するデータのみを抽出する際に用いられる。",
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: '排他制御',
      question: '同時に複数のトランザクションが実行される際に、データの整合性を保つために行われる制御は何か？',
      ans: '排他制御',
      choices: ["正規化", "デッドロック", "排他制御", "リストア"],
      comment:
          "排他制御は、1人のユーザーが更新処理を行っている間、他のユーザーには更新処理の実行を待たせることで同時に更新処理が実行されることを防ぎ、データの不整合が発生しないように制御する方法。",
      source: '平成27年春期 問77',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: 'トランザクション',
      question: 'データベース内で一連の操作を一つの単位として扱うことを何と呼ぶか？',
      ans: 'トランザクション',
      choices: ["トランザクション", "排他制御", "射影", "選択"],
      comment: "トランザクションは、データベース内で一連の操作を一つの単位として扱い、データの整合性を保つための仕組み。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ACID特性',
      question: 'トランザクションが持つべき4つの基本特性（原子性、一貫性、独立性、持続性）を示す用語は何か？',
      ans: 'ACID特性',
      choices: ["ACID特性", "排他制御", "デッドロック", "2相コミットメント"],
      comment: "ACID特性は、トランザクションが持つべき4つの基本特性（Atomicity、Consistency、Isolation、Durability）を示す用語。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'デッドロック',
      question: '複数のトランザクションが相互にリソースの解放を待ち続ける状態は何と呼ばれるか？',
      ans: '複数のプロセスが共通の資源を排他的に利用する場合に，お互いに相手のプ口セスが占有している資源が解放されるのを待っている状態',
      choices: [
        "コンピュータのプロセスが本来アクセスしてはならない情報に，故意あるいは偶発的にアクセスすることを禁止している状態",
        "コンピュータの利用開始時に行う利用者認証において，認証の失敗が一定回数以上になったときに，一定期間又はシステム管理者が解除するまで，当該利用者のアクセスが禁止された状態",
        "複数のプロセスが共通の資源を排他的に利用する場合に，お互いに相手のプ口セスが占有している資源が解放されるのを待っている状態",
        "マルチプログラミング環境で，実行可能な状態にあるプロセスが，OSから割り当てられたCPU時間を使い切った状態"
      ],
      comment:
          "デッドロックは、共有資源を使用する2つ以上のプロセスが、互いに相手プロセスが必要とする資源を排他的に使用していて、互いのプロセスが相手が使用している資源の解放を待っている状態。",
      source: '平成24年秋期 問67',
      importance: ImportanceType.normal,
    ),
    QuizItem(
      word: '2相コミットメント',
      question: '分散システム内でトランザクションを一貫性をもって完了させるためのプロトコルは何か？',
      ans: '2相コミットメント',
      choices: ["2相コミットメント", "デッドロック", "ACID特性", "排他制御"],
      comment: "2相コミットメントは、分散システム内でトランザクションを一貫性をもって完了させるために使用されるプロトコル。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'チェックポイント',
      question: 'トランザクションが安全な状態にコミットされるポイントを何と呼ぶか？',
      ans: 'チェックポイント',
      choices: ["チェックポイント", "ロールバック", "ロールフォワード", "2相コミットメント"],
      comment: "チェックポイントは、トランザクションが安全な状態にコミットされるポイントで、システム障害からの回復に利用される。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ロールバック',
      question: 'トランザクションが失敗した場合に、それまでの変更を取り消し元の状態に戻す操作は何か？',
      ans: 'ロールバック',
      choices: ["ロールバック", "チェックポイント", "ロールフォワード", "2相コミットメント"],
      comment: "ロールバックは、トランザクションが失敗した場合に、それまでの変更を取り消し元の状態に戻す操作。",
      importance: ImportanceType.low,
    ),
    QuizItem(
      word: 'ロールフォワード',
      question: 'トランザクションが失敗した後に、チェックポイント以降の正しい変更を再適用して状態を復元する操作は何か？',
      ans: 'ロールフォワード',
      choices: ["ロールフォワード", "ロールバック", "チェックポイント", "2相コミットメント"],
      comment: "ロールフォワードは、トランザクションが失敗した後に、チェックポイント以降の正しい変更を再適用して状態を復元する操作。",
      importance: ImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index].copyWith(quizId: index + I18n().category3Index + 1801);
  });
}
