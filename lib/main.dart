import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tictacgame/pages/router.dart';
import 'package:tictacgame/states/app.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: '/menu',
      getPages: appRoutes(),
      builder: (context, child) {
        return GlobalWrapper(
          child: child!,
        );
      },
    );
  }
}

class GlobalWrapper extends StatelessWidget {
  final Widget child;
  const GlobalWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    h.value = size.height / 100;
    w.value = size.width / 100;
    return Scaffold(
        body: Container(
      width: 100 * w.value,
      height: 100 * h.value,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xFF333396), Color(0xFFB85CED)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      )),
      child: child,
    ));
  }
}
// #B85CED