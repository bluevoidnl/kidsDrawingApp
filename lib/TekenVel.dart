import 'package:flutter/material.dart';

class TekenVel extends CustomPainter {
  TekenVel();

  final colorsRainbow = <Color>[
    Colors.yellow,
    Colors.orange,
    Colors.red,
    Colors.purple,
    Colors.blue,
  ];

  final rodeLijn = Paint()
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4;

  final geelVul = Paint()
    ..color = Colors.amber
    ..style = PaintingStyle.fill;

  final blauwVul = Paint()
    ..color = Colors.lightBlue
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas vel, Size velMaat) {
    // Typen vanaf hier =================================================================

    // kleur achtergrond
    var rechthoekAlles = Offset.zero & velMaat;
    vel.drawRect(rechthoekAlles, geelVul);

    // teken een rode lijn
    vel.drawLine(Offset(100, 10), Offset(20, 300), rodeLijn);

    // herhaling
    // for (var teller = 0.0; teller < 300; teller += 10)
    //  {
    //    vel.drawLine(Offset(100 , 10 ), Offset(20, 300), rodeLijn);
    //  }

    // cirkel
    // vel.drawCircle(Offset(100,100), 50, blauwVul);

    // rechthoek
    var rechthoek = Rect.fromPoints(Offset(100, 300), Offset(100, 350));
    vel.drawRect(rechthoek, blauwVul);

    // tekst
    // drawText("Hoi", Colors.purple, velMaat, vel, Offset(200,100));

    // Hieronder niet typen ======================================================================
  }

  @override
  bool shouldRepaint(TekenVel old) {
    return false;
  }

  void drawText(String text, Color color, Size size, Canvas canvas, Offset offset) {
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
      maxWidth: size.width,
    );

    textPainter.paint(canvas, offset);
  }
}
