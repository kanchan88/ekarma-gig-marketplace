import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Gap extends StatelessWidget {
  final double? h;
  final double? w;
  const Gap({super.key, this.h, this.w});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: h ?? 2.h,width: w ?? 0);
  }
}