part of 'quiz_model.dart';

extension QuizModelEx1 on QuizModel {
  ///問題一覧
  List<QuizItem> get quiz1 => [
        QuizItem(
          quizId: 1,
          question: '1 + 1 = 2',
          ans: '2',
          choices: ["1", "2", "3", "4"],
          comment: "1 + 1 = 2 ",
          isWeak: false,
          isSaved: false,
          isJudge: false,
        ),
        QuizItem(
          quizId: 2,
          question: '更新世は氷河時代とも呼ばれる',
          ans: '氷河時代',
          choices: ["氷河時代", "地質時代", "縄文時代", "旧石器時代"],
          comment: "氷河時代です",
          isWeak: false,
          isSaved: false,
          isJudge: false,
        ),
        QuizItem(
          quizId: 3,
          question: '猫の目には、 タンペム という反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる.',
          ans: 'タンペム',
          isWeak: false,
          isSaved: false,
          isJudge: false,
          choices: [
            "グアニン",
            'タンペム',
            "キトゥンブルー",
            "キャッツアイ",
          ],
          comment: "タンペムです",
        ),
      ];

  List<QuizItem> get quiz2 => [
        QuizItem(
          quizId: 4,
          question: '1 + 2 = 3',
          ans: '3',
          isWeak: false,
          isSaved: false,
          isJudge: false,
          choices: ["1", "2", "3", "4"],
          comment: "3です",
        ),
        QuizItem(
          quizId: 5,
          question: '(1)更新世は氷河時代とも呼ばれる',
          ans: '氷河時代',
          isWeak: false,
          isSaved: false,
          isJudge: false,
          choices: ["氷河時代", "地質時代", "縄文時代", "旧石器時代"],
          comment: "氷河時代です",
        ),
        QuizItem(
          quizId: 6,
          question: '(1)猫の目には、タンペムという反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる。',
          ans: 'タンペム',
          isWeak: false,
          isSaved: false,
          isJudge: false,
          choices: [
            "グアニン",
            'タンペム',
            "キトゥンブルー",
            "キャッツアイ",
          ],
          comment: "氷河時代です",
        ),
        QuizItem(
          quizId: 7,
          question: '(2)更新世は氷河時代とも呼ばれる',
          ans: '氷河時代',
          isWeak: false,
          isSaved: false,
          isJudge: false,
          choices: ["氷河時代", "地質時代", "縄文時代", "旧石器時代"],
          comment: "氷河時代です",
        ),
        QuizItem(
          quizId: 8,
          question: '(2)猫の目には、タンペムという反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる.',
          ans: 'タンペム',
          choices: [
            "グアニン",
            'タンペム',
            "キトゥンブルー",
            "キャッツアイ",
          ],
          comment: "タンペムです",
          isWeak: false,
          isSaved: false,
          isJudge: false,
        ),
      ];

  List<QuizItem> get quiz3 => [
        QuizItem(
          quizId: 9,
          question: '2 + 3 = 5',
          ans: '5',
          choices: ["4", "5", "6", "8"],
          comment: "2 + 3 = 5 ",
          isWeak: false,
          isSaved: false,
          isJudge: false,
        ),
        QuizItem(
          quizId: 10,
          question: '(3)更新世は氷河時代とも呼ばれる',
          ans: '氷河時代',
          choices: ["氷河時代", "地質時代", "縄文時代", "旧石器時代"],
          comment: "氷河時代です",
          isWeak: false,
          isSaved: false,
          isJudge: false,
        ),
        QuizItem(
          quizId: 11,
          question:
              ' (3)猫の目には、 タンペム という反射板が網膜の裏側にあり、光の乏しい暗闇でもしっかりとものを見ることができる.',
          ans: 'タンペム',
          isWeak: false,
          isSaved: false,
          isJudge: false,
          choices: [
            "グアニン",
            'タンペム',
            "キトゥンブルー",
            "キャッツアイ",
          ],
          comment: "タンペムです",
        ),
      ];
}
