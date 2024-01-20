import 'package:flutter/material.dart';

class EmptyPageMessage extends StatelessWidget {
  const EmptyPageMessage({Key? key, this.icon, this.color, required this.text})
      : super(key: key);

  final IconData? icon;
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    Color _color =
        (color ?? Theme.of(context).colorScheme.onSurface).withOpacity(0.3);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Icon(icon!, color: _color, size: 32),
            ),
          Text(
            text,
            style: TextStyle(color: _color),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
