import 'package:flutter/material.dart';

class CustomImageButtonBorder extends BoxBorder {
  const CustomImageButtonBorder({
    this.top = BorderSide.none,
    this.right = BorderSide.none,
    this.bottom = BorderSide.none,
    this.left = BorderSide.none,
  });

  const CustomImageButtonBorder.fromBorderSide(BorderSide side)
      : top = side,
        right = side,
        bottom = side,
        left = side;

  factory CustomImageButtonBorder.all({
    Color color = const Color(0xFF000000),
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
    double strokeAlign = BorderSide.strokeAlignInside,
  }) {
    final BorderSide side = BorderSide(
        color: color, width: width, style: style, strokeAlign: strokeAlign);
    return CustomImageButtonBorder.fromBorderSide(side);
  }

  @override
  final BorderSide bottom;

  @override
  final BorderSide top;

  final BorderSide right;

  final BorderSide left;

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

    switch (top.style) {
      case BorderStyle.solid:
        paint.color = top.color;
        path.reset();

        path.moveTo(rect.left, rect.top);
        path.lineTo(rect.right, rect.top);

        paint.style = PaintingStyle.stroke;
        paint.strokeCap = StrokeCap.round;
        canvas.drawPath(path, paint);
        break;
      case BorderStyle.none:
        break;
    }

    switch (right.style) {
      case BorderStyle.solid:
        paint.color = right.color;
        path.reset();

        path.moveTo(rect.right, rect.top);
        path.lineTo(rect.right, rect.bottom);

        paint.style = PaintingStyle.stroke;
        paint.strokeCap = StrokeCap.round;
        canvas.drawPath(path, paint);
        break;
      case BorderStyle.none:
        break;
    }

    switch (bottom.style) {
      case BorderStyle.solid:
        paint.color = bottom.color;
        path.reset();

        path.moveTo(rect.left, rect.bottom);
        path.lineTo(rect.right, rect.bottom);

        paint.style = PaintingStyle.stroke;
        paint.strokeCap = StrokeCap.round;
        canvas.drawPath(path, paint);
        break;
      case BorderStyle.none:
        break;
    }

    switch (left.style) {
      case BorderStyle.solid:
        paint.color = left.color;
        path.reset();

        path.moveTo(rect.left, rect.top);
        path.lineTo(rect.left, rect.bottom);

        paint.style = PaintingStyle.stroke;
        paint.strokeCap = StrokeCap.round;
        canvas.drawPath(path, paint);
        break;
      case BorderStyle.none:
        break;
    }
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
