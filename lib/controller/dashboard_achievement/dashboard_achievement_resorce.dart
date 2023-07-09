part of 'dashboard_achievement_controller.dart';

extension DashboardAchievementlControllerEx on DashboardAchievementController {
  ///累計ストックバッジ一覧
  List<Rank> get rankDataList => [
        // 学習者の冒険者 (20×10)
        const Rank(
          rankId: 0,
          rankName: "学習の冒険者",
          rankLevel: 0,
          score: 0,
          levelUpScore: 20,
        ),
        // 知識の騎士 (30×10)
        const Rank(
          rankId: 1,
          rankName: "知識の騎士",
          rankLevel: 10,
          score: 200,
          levelUpScore: 30,
        ),
        // 書籍の戦士 (40×10)
        const Rank(
          rankId: 2,
          rankName: "書籍の戦士",
          rankLevel: 20,
          score: 500,
          levelUpScore: 40,
        ),
        // 学問の術士 (50×10)
        const Rank(
          rankId: 3,
          rankName: "学問の術士",
          rankLevel: 30,
          score: 900,
          levelUpScore: 50,
        ),
        // 知恵の魔法使い (60×10)
        const Rank(
          rankId: 4,
          rankName: "知恵の魔法使い",
          rankLevel: 40,
          score: 1400,
          levelUpScore: 60,
        ),
        // 知識の聖者 (70×10)
        const Rank(
          rankId: 5,
          rankName: "知識の聖者",
          rankLevel: 50,
          score: 2000,
          levelUpScore: 70,
        ),
        // 書物の大賢者 (80×10)
        const Rank(
            rankId: 6,
            rankName: "書物の大賢者",
            rankLevel: 60,
            score: 2700,
            levelUpScore: 80),
        // 学習の英雄 (90×10)
        const Rank(
          rankId: 7,
          rankName: "学習の英雄",
          rankLevel: 70,
          score: 3500,
          levelUpScore: 90,
        ),
        // 知識の王 (100×10)
        const Rank(
          rankId: 8,
          rankName: "知識の王",
          rankLevel: 80,
          score: 4300,
          levelUpScore: 100,
        ),
        // 学問のレジェンド (110×10)
        const Rank(
          rankId: 9,
          rankName: "学習の神",
          rankLevel: 90,
          score: 5300,
          levelUpScore: 110,
        ),
        const Rank(
          rankId: 10,
          rankName: "学問の伝説",
          rankLevel: 100,
          score: 5300,
          levelUpScore: 110,
        ),
      ];
}
