import 'package:artsy_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ArtsyLogo extends StatelessWidget {
  const ArtsyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Consumer<ThemeModel>(builder: (context, theme, child) {
        return SvgPicture.asset(
          theme.isDark
              ? "assets/logo/artsy-logo-light.svg"
              : "assets/logo/artsy-logo-dark.svg",
        );
      }),
    );
  }
}
