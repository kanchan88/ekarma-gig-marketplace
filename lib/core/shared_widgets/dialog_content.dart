import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../routes/paths.dart' as path;
import 'custom_button.dart';
import 'gap.dart';
import '../utils/colors.dart';

class DialogContent extends StatefulWidget {
  const DialogContent(
      {super.key,
      required this.image,
      this.onPressed,
      this.showButtonInside = false,
      required this.buttonText,
      this.textWidget,
      required this.successText,
      this.popBackLevel});

  final String successText;
  final String buttonText;
  final VoidCallback? onPressed;
  final String image;
  final Widget? textWidget;
  final bool showButtonInside;
  final int? popBackLevel;

  @override
  State<DialogContent> createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  int popBackLevel = 0;

  @override
  void initState() {
    super.initState();
    popBackLevel = widget.popBackLevel ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 85.w,
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset:
                    const Offset(0, 4), // changes the position of the shadow
              ),
              BoxShadow(
                color: black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 4,
                offset:
                    const Offset(0, 4), // changes the position of the shadow
              ),
            ],
            color: white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            SvgPicture.asset(widget.image),
            const Gap(),
            const Divider(),
            const Gap(),
            widget.textWidget ?? 
            Text(
              widget.successText,
              textAlign: TextAlign.center,
            ),
            const Gap(),
            widget.showButtonInside ? getButton() : const SizedBox()
          ]),
        ),
        const Gap(),
        const Gap(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [widget.showButtonInside ? const SizedBox() : getButton()],
        ),
      ],
    );
  }

  getButton() {
    return CustomButton(
      buttonText: widget.buttonText,
      borderRadius: 10,
      height: 6.h,
      width: 45.w,
      onPressed: widget.onPressed ??
          () {
            setState(() {
              while (popBackLevel > 0) {
                context.pop();
                popBackLevel = widget.popBackLevel! - 1;
              }
            });
            widget.popBackLevel != null ? context.pop() : context.go(path.home);
          },
    );
  }
}
