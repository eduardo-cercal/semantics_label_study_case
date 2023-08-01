import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromRGBO(176, 104, 255, 0),
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withOpacity(0),
          ],
        ),
      ),
    );
  }
}
