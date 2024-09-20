import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/colors.dart';

class ShimmerWidget extends StatelessWidget {
  final double? height;
  final double? width;

  const ShimmerWidget({Key? key, this.height, this.width}) : super(key: key);

  Widget createShimmerContainer(
      BuildContext context, double? width, double? height) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: width,
          height: height,
          color: white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return createShimmerContainer(
        context, width ?? MediaQuery.of(context).size.width, height);
  }
}
