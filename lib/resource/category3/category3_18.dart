import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../untils/enums.dart';

List<QuizItem> get category3_18 {
  final quizItems = [
    QuizItem(
      question: 'テーブルから特定の列だけを取り出す操作は何と呼ばれるか？',
      ans: '射影',
      choices: ["射影", "選択", "排他制御", "トランザクション"],
      comment: "射影は、テーブルから特定の列だけを取り出す操作で、クエリにおいて特定の属性のみを抽出する際に用いられる。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'テーブルから特定の条件を満たす行だけを取り出す操作は何と呼ばれるか？',
      ans: '選択',
      choices: ["選択", "射影", "排他制御", "トランザクション"],
      comment: "選択は、テーブルから特定の条件を満たす行だけを取り出す操作で、特定の条件に一致するデータのみを抽出する際に用いられる。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '同時に複数のトランザクションが実行される際に、データの整合性を保つために行われる制御は何か？',
      ans: '排他制御',
      choices: ["排他制御", "射影", "選択", "トランザクション"],
      comment: "排他制御は、同時に複数のトランザクションが実行される際に、データの整合性を保つために行われる制御。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: 'データベース内で一連の操作を一つの単位として扱うことを何と呼ぶか？',
      ans: 'トランザクション',
      choices: ["トランザクション", "排他制御", "射影", "選択"],
      comment: "トランザクションは、データベース内で一連の操作を一つの単位として扱い、データの整合性を保つための仕組み。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'トランザクションが持つべき4つの基本特性（原子性、一貫性、独立性、持続性）を示す用語は何か？',
      ans: 'ACID特性',
      choices: ["ACID特性", "排他制御", "デッドロック", "2相コミットメント"],
      comment:
          "ACID特性は、トランザクションが持つべき4つの基本特性（Atomicity、Consistency、Isolation、Durability）を示す用語。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: '複数のトランザクションが相互にリソースの解放を待ち続ける状態は何と呼ばれるか？',
      ans: 'デッドロック',
      choices: ["デッドロック", "ACID特性", "排他制御", "トランザクション"],
      comment: "デッドロックは、複数のトランザクションが相互にリソースの解放を待ち続け、どのトランザクションも進行できなくなる状態。",
      importance: QuizImportanceType.normal,
    ),
    QuizItem(
      question: '分散システム内でトランザクションを一貫性をもって完了させるためのプロトコルは何か？',
      ans: '2相コミットメント',
      choices: ["2相コミットメント", "デッドロック", "ACID特性", "排他制御"],
      comment: "2相コミットメントは、分散システム内でトランザクションを一貫性をもって完了させるために使用されるプロトコル。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'トランザクションが安全な状態にコミットされるポイントを何と呼ぶか？',
      ans: 'チェックポイント',
      choices: ["チェックポイント", "ロールバック", "ロールフォワード", "2相コミットメント"],
      comment: "チェックポイントは、トランザクションが安全な状態にコミットされるポイントで、システム障害からの回復に利用される。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'トランザクションが失敗した場合に、それまでの変更を取り消し元の状態に戻す操作は何か？',
      ans: 'ロールバック',
      choices: ["ロールバック", "チェックポイント", "ロールフォワード", "2相コミットメント"],
      comment: "ロールバックは、トランザクションが失敗した場合に、それまでの変更を取り消し元の状態に戻す操作。",
      importance: QuizImportanceType.low,
    ),
    QuizItem(
      question: 'トランザクションが失敗した後に、チェックポイント以降の正しい変更を再適用して状態を復元する操作は何か？',
      ans: 'ロールフォワード',
      choices: ["ロールフォワード", "ロールバック", "チェックポイント", "2相コミットメント"],
      comment: "ロールフォワードは、トランザクションが失敗した後に、チェックポイント以降の正しい変更を再適用して状態を復元する操作。",
      importance: QuizImportanceType.low,
    ),
  ];

  return List.generate(quizItems.length, (index) {
    return quizItems[index]
        .copyWith(quizId: index + I18n().category3Index + 1801);
  });
}
