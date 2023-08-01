import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:semantics_label_study_case/core/presenters/ui/splash/splash_page.dart';
import 'package:semantics_label_study_case/main/utils/app.dart';

void main() => runApp(const SemanticsLabelApp());

class SemanticsLabelApp extends StatelessWidget {
  const SemanticsLabelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: App.primaryColor,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => SplashPage(),
        ),
      ],
      initialRoute: '/',
    );
  }
}
