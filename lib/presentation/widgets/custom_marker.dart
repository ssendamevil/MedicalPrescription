import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/widgets/custom_marker_clipper.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomMarkerClipper(),
      child: Container(
        width: 100,
        height: 50,
        color: const Color(0xff198A8E),
      ),
    );
  }
}
