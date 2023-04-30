import '../../controller/quiz_item/quiz_item_state.dart';

///今日のクイズ
const dailyItem = QuizItemState(
  id: 1,
  group: "review",
  title: "今日のクイズ",
  isCompleted: false,
  quizList: [],
  score: 0,
  timeStamp: null,
);

///苦手克服
const weakItem = QuizItemState(
  id: 2,
  group: "review",
  title: "苦手克服",
  isCompleted: false,
  quizList: [],
  score: 0,
  timeStamp: null,
);

///力だめし
const testItem = QuizItemState(
  id: 3,
  group: "review",
  title: "力だめし",
  isCompleted: false,
  quizList: [],
  score: 0,
  timeStamp: null,
);
