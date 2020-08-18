import 'package:flutter/material.dart';

class RetangleDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      child: Transform.rotate(
              child: Container(
          width: 143,
          height: 143,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
        ),
        angle: 75,
      ),
      opacity: .2,
    );
  }
}
