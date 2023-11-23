part of '../quiz_learn_screen.dart';

class _LearnResultBody extends ConsumerWidget {
  const _LearnResultBody(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Gap(20),
                  Card(
                    elevation: 1,
                    color: Colors.grey.shade200,
                    child: Container(
                      height: context.height * 0.1,
                      alignment: Alignment.center,
                      child: Text('Clear！'),
                    ),
                  ),

                  Gap(20),
                  Card(
                    elevation: 1,
                    color: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1.0, // ここで線の太さを設定
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: context.width * 0.02,
                          vertical: context.width * 0.02),
                      child: Text(
                        '結果詳細',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.width * 0.05,
                        ),
                      ),
                    ),
                  ),
                  const _QuizResultView(),
                  Gap(20),
                  AdNative(),
                  Gap(context.height * 0.15),
                ],
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _NextActionCard(quiz),

            ///広告
            AdBanner(),
          ],
        ),
      ],
    );
  }
}
