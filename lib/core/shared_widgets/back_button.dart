import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SvgBackButton extends StatefulWidget {
  const SvgBackButton({required this.svgImage, this.onTap, super.key});
  final SvgPicture svgImage;
  final Function()? onTap;

  @override
  State<SvgBackButton> createState() => SvgBackButtonState();
}

class SvgBackButtonState extends State<SvgBackButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ??
          () {
            context.pop();
          },
      child: widget.svgImage,
    );
  }
}
