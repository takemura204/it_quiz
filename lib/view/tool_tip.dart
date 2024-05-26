import 'package:flutter/material.dart';

class CustomToolTip extends StatelessWidget {
  const CustomToolTip(
      {required this.text, this.offsetX = 0, this.isUpward = true})
      : super();

  final InlineSpan text;
  final double offsetX;
  final bool isUpward;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(
              color: Theme.of(context).primaryColor,
              offset: const Offset(0, 0),
              blurRadius: 0,
              spreadRadius: 1,
            )
          ],
          shape: BubbleBorder(offsetX: offsetX, isUpward: isUpward),
        ),
        child: RichText(textAlign: TextAlign.center, text: text),
      ),
    );
  }
}

class BubbleBorder extends ShapeBorder {
  final bool usePadding;
  final double offsetX;
  final bool isUpward;

  const BubbleBorder(
      {this.usePadding = true, this.offsetX = -30, this.isUpward = false});

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    if (isUpward) {
      path
        ..moveTo(
            rect.topCenter.dx + offsetX, rect.topCenter.dy) // 引数の offsetX を使用
        ..relativeLineTo(-10, -10) // 上に向かって三角形を描画
        ..relativeLineTo(-10, 10) // 下に向かって三角形を閉じる
        ..addRRect(RRect.fromRectAndRadius(
            rect, const Radius.circular(8))); // 吹き出しの本体部分を描画
    } else {
      path
        ..moveTo(rect.bottomCenter.dx + offsetX,
            rect.bottomCenter.dy) // 引数の offsetX を使用
        ..relativeLineTo(-10, 10) // 下に向かって三角形を描画
        ..relativeLineTo(-10, -10) // 上に向かって三角形を閉じる
        ..addRRect(RRect.fromRectAndRadius(
            rect, const Radius.circular(8))); // 吹き出しの本体部分を描画
    }
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
