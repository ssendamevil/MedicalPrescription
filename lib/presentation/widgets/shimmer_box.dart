import 'package:flutter/material.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({Key? key, required this.height, required this.width, required this.borderRadius}) : super(key: key);
  final double height;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: width==0? MediaQuery.of(context).size.width: width,
          color: Colors.grey,
          height: height,
        ),
      ),
    );
  }
}
