import 'dart:developer';
import 'CanvasExtension.dart';

import 'package:flutter/material.dart';

class TekenVel extends CustomPainter {
  TekenVel();

  final rodeLijn = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4;

  final geelVul = Paint()
    ..color = Colors.amber
    ..style = PaintingStyle.fill;

  final lilaLijn = Paint()
    ..color = Colors.purpleAccent
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4;

  final blauwVul = Paint()
    ..color = Colors.lightBlue
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas vel, Size velMaat) {
    // Typen vanaf hier =================================================================

    // kleur achtergrond
    var rechthoekAlles = Rect.fromPoints(Offset.zero, velMaat.bottomRight(Offset.zero));
    vel.drawRect(rechthoekAlles, geelVul);

    // teken een rode lijn
   // vel.drawLine(Offset(1, 1), Offset(370, 680), rodeLijn);

    vel.drawCircle(Offset(150, 300),2, blauwVul);

    for (var b = 0.0; b < 500; b = b + 10) {
      vel.drawLine(Offset(b*10, 1), Offset(1, b*10), rodeLijn);
      vel.drawCircle(Offset(15+b, 300),2, blauwVul);
    }
//    for (var x = 0.0; x < 500; x = x + 20) {
//      for (var y = 0.0; y < 500; y = y + 20) {
//        vel.drawCircle(Offset(x, y), 2, blauwVul);
//      }
//    }

    // cirkel
    // vel.drawCircle(Offset(100, 100), 50, blauwVul);

    // tekst
    vel.drawText("Hoi", Colors.purple, Offset(200, 100));

    // rechthoek
    // var rechthoek = Rect.fromPoints(Offset(100, 300), Offset(200, 350));
    // var kleur = regenboogVul(Offset(100, 300), Offset(200, 350));
    //  vel.drawRect(rechthoek, kleur);

    // Hieronder niet typen ======================================================================
  }

  @override
  bool shouldRepaint(TekenVel old) {
    return false;
  }

  Paint regenboogLijn(Offset offset1, Offset offset2, {int dikte = 4}) {
    return regenboog(offset1, offset2, PaintingStyle.stroke, dikte);
  }

  Paint regenboogVul(Offset offset1, Offset offset2) {
    return regenboog(offset1, offset2, PaintingStyle.fill, 1);
  }

  Paint regenboog(Offset offset1, Offset offset2, PaintingStyle paintingStyle, int dikte) {
    final colorsRainbow = <Color>[
      Colors.yellow,
      Colors.orange,
      Colors.red,
      Colors.purple,
      Colors.blue,
    ];
    Gradient gradient = new LinearGradient(
      colors: colorsRainbow,
      stops: [0.2, 0.4, 0.6, 0.8, 1],
    );
    Rect rect = Rect.fromPoints(offset1, offset2);

    return Paint()
      ..shader = gradient.createShader(rect)
      ..style = paintingStyle
      ..strokeWidth = dikte.toDouble();
  }
}
