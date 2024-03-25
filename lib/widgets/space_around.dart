import 'package:flutter/material.dart';

class SpaceAround extends StatelessWidget {
  final Widget leftChild;
  final Widget rightChild;
  final double left;
  final double right;
  final double top;
  final double width;
  final double height;
  final Color color;

  const SpaceAround({
    Key? key,
    required this.leftChild,
    required this.rightChild,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.width = double.infinity,
    required this.height,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Stack(
        children: [
          Positioned(left: left, child: leftChild,),
          Positioned(right: right, child: rightChild,),
        ],
      ),
    );
  }
}
