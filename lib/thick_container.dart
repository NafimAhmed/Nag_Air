import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThickContainer extends StatelessWidget {
  final Color color;
  const ThickContainer({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2.5,color: color)
      ),
    );
  }
}
