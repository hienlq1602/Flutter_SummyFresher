import 'dart:ui';

import 'package:flutter/material.dart';

class PaintScreen extends StatelessWidget {
  const PaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyCustomPainter(MediaQuery.of(context).size.width),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  double width;
  MyCustomPainter(this.width);
  @override
  void paint(Canvas canvas, Size size) {
    var myPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 50
      ..strokeCap = StrokeCap.round;
    // canvas.drawLine(Offset.zero, Offset(100, 200), myPaint);
    // canvas.drawPoints(
    //     PointMode.polygon, [Offset(350, 30), Offset(100, 350)], myPaint);
    // canvas.drawCircle(Offset(200, 100), 300, myPaint);
    var myPath = Path();
    myPath.fillType = PathFillType.evenOdd;
    myPath..moveTo(200, 150)..lineTo(200, 300)..lineTo(width, 300)..lineTo(width, 150)..close();
    canvas.drawPath(myPath,myPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
