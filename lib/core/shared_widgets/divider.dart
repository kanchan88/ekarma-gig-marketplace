import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: 5.w,
      indent: 5.w,
      color: black.withOpacity(0.2),
      thickness: 1,
    );
  }
}
