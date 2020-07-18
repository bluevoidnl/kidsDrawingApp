import 'package:flutter/material.dart';

extension CanvasExt on Canvas {

  void drawText(String text, Color color, Offset offset) {
    final textStyle = TextStyle(
      color: color,
      fontSize: 30,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 800,
    );

    textPainter.paint(this, offset);
  }

}