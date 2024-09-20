import 'package:flutter/material.dart';

import '../utils/images.dart';

class BlackLogo extends StatelessWidget {
  const BlackLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Image.asset(
        height: 126,
        width: 89,
        yallaGaiBlackLogo,
        fit: BoxFit.contain,
      ),
    );
  }
}
