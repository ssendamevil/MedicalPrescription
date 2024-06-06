import 'package:flutter/material.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({Key? key, required this.isLoading, required this.child}) : super(key: key);

  final bool isLoading;
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    if(!widget.isLoading){
      return widget.child;
    }

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return shimmerGradient.createShader(bounds);
      },
      child: widget.child,
    );
  }
}
