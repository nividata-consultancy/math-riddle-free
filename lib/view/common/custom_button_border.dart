import 'package:flutter/material.dart';

class CustomButtonBorder extends BoxBorder {
  const CustomButtonBorder({
    this.top = BorderSide.none,
    this.right = BorderSide.none,
    this.bottom = BorderSide.none,
    this.left = BorderSide.none,
    this.smallGap = 2,
    this.largeGap = 17,
    this.smallSpace = 2,
    this.largeSpace = 8,
  });

  const CustomButtonBorder.fromBorderSide(
    BorderSide side,
    this.smallGap,
    this.largeGap,
    this.smallSpace,
    this.largeSpace,
  )   : top = side,
        right = side,
        bottom = side,
        left = side;

  factory CustomButtonBorder.all({
    Color color = const Color(0xFF000000),
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
    double strokeAlign = BorderSide.strokeAlignInside,
    double smallGap = 2,
    double largeGap = 17,
    double smallSpace = 2,
    double largeSpace = 8,
  }) {
    final BorderSide side = BorderSide(
        color: color, width: width, style: style, strokeAlign: strokeAlign);
    return CustomButtonBorder.fromBorderSide(
      side,
      smallGap,
      largeGap,
      smallSpace,
      largeSpace,
    );
  }

  @override
  final BorderSide bottom;

  @override
  final BorderSide top;

  final BorderSide right;

  final BorderSide left;

  final double smallGap;
  final double largeGap;
  final double smallSpace;
  final double largeSpace;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(top.strokeInset);

  @override
  bool get isUniform => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final Paint paint = Paint()..strokeWidth = top.width;

    final Path path = Path();

    paint.color = top.color;
    path.reset();
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.left + largeSpace, rect.top);
    path.moveTo(rect.left + largeSpace + smallGap, rect.top);
    path.lineTo(rect.right - largeGap - largeSpace, rect.top);
    path.moveTo(rect.right - largeSpace, rect.top);
    path.lineTo(rect.right, rect.top);
    path.lineTo(rect.right, rect.bottom - smallGap - smallSpace);
    path.moveTo(rect.right, rect.bottom - smallSpace);
    path.lineTo(rect.right, rect.bottom);
    path.lineTo(rect.right - largeSpace, rect.bottom);
    path.moveTo(rect.right - largeSpace - smallGap, rect.bottom);
    path.lineTo(rect.left + largeSpace + largeGap, rect.bottom);
    path.moveTo(rect.left + largeSpace, rect.bottom);
    path.lineTo(rect.left, rect.bottom);
    path.lineTo(rect.left, rect.top + smallGap + smallSpace);
    path.moveTo(rect.left, rect.top + smallGap);
    path.lineTo(rect.left, rect.top);

    paint.style = PaintingStyle.stroke;
    paint.strokeCap=StrokeCap.round;

    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) {
    return Border(
      top: top.scale(t),
      right: right.scale(t),
      bottom: bottom.scale(t),
      left: left.scale(t),
    );
  }
}
