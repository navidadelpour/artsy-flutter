import 'package:artsy_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToggleThemeButton extends StatefulWidget {
  const ToggleThemeButton({Key? key}) : super(key: key);

  @override
  State<ToggleThemeButton> createState() => _ToggleThemeButton();
}

class _ToggleThemeButton extends State<ToggleThemeButton>
    with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Animation<double> animation = CurvedAnimation(
    curve: Curves.easeInOut,
    parent: controller,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, theme, child) => IconButton(
        icon: RotationTransition(
          turns: animation,
          child: Icon(
            theme.isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          ),
        ),
        onPressed: () {
          theme.toggle();
          controller.reset();
          controller.forward();
        },
      ),
    );
  }
}
