import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_analog_clock/src/painter/clock_dial_painter.dart';
import 'package:flutter_analog_clock/src/painter/clock_hands.dart';

class ClockFace extends StatelessWidget {
  final DateTime dateTime;

  ClockFace({this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            //dial and numbers
            Container(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 9 / 5,
                child: Container(
                  child: CustomPaint(
                    painter: ClockDialPainter(),
                  ),
                ),
              ),
            ),

            //centerpoint
            Center(
              child: Container(
                width: 15.0,
                height: 15.0,
                margin: EdgeInsets.only(top: 8.0),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
              ),
            ),

            ClockHands(dateTime: dateTime),
          ],
        ),
      ),
    );
  }
}
