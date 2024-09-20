import 'package:flutter/material.dart';

class NoDataReload extends StatelessWidget {
  final void Function()? onPressed;
  final double? height;
  final double? width;

  const NoDataReload({super.key, required this.onPressed, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("nodata")
      ],
    );
  }
}
