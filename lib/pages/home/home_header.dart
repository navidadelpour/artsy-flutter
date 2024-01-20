import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  static const double height = 200;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    Container background = Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/home-header.jpeg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(.4),
            BlendMode.multiply,
          ),
        ),
      ),
    );

    Text header = Text(
      "Artsy",
      textAlign: TextAlign.center,
      style: textTheme.headline5?.merge(
        const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

    Text subheader = Text(
      "Discover, buy, and sell art by the world’s leading artists",
      textAlign: TextAlign.center,
      style: textTheme.subtitle1?.merge(
        const TextStyle(
          color: Colors.white,
        ),
      ),
    );

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          background,
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[header, subheader],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
