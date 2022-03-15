import 'package:beauty_of_space/app/bindings/initial_binding.dart';
import 'package:beauty_of_space/app/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: routes,
      initialRoute: "/",
      initialBinding: InitialBinding(),
    );
  }
}
