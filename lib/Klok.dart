import 'package:flutter/material.dart';

class Klok extends CustomPainter {
  Klok();

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
    var rechthoekAlles =  Offset.zero & velMaat;
    vel.drawRect(rechthoekAlles, geelVul);

    // teken een rode lijn
    vel.drawLine(Offset(100, 10), Offset(20, 300), rodeLijn);

    // herhaling
    // for (var teller = 0.0; teller < 300; teller += 10)
    //  {
    //    vel.drawLine(Offset(100 , 10 ), Offset(20, 300), rodeLijn);
    //  }

    // cirkel
    vel.drawCircle(Offset(100, 100), 50, blauwVul);

    // tekst
    drawText("Hoi", Colors.purple, vel, Offset(200, 100));

    // rechthoek
    var rechthoek = Rect.fromPoints(Offset(100, 300), Offset(200, 350));
    var kleur = regenboogVul(Offset(100, 300), Offset(200, 350));
     vel.drawRect(rechthoek, kleur);

    // Hieronder niet typen ======================================================================
  }

 // new DateTime.now()

  @override
  bool shouldRepaint(Klok old) {
    return true;
  }

  void drawText(String text, Color color, Canvas canvas, Offset offset) {
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

    textPainter.paint(canvas, offset);
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
