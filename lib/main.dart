import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shaheendrive/features/uber_auth_feature/presentation/pages/uber_splash_screen.dart';
import 'package:shaheendrive/view/homepage.dart';
import 'package:shaheendrive/view/services/servicesMainpage.dart';
import 'package:shaheendrive/injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
await di.init();
  runApp(GetMaterialApp(
    initialBinding: BindingsBuilder(() => {
      Get.lazyPut<BoxController>(() => BoxController()),
    }),
    home: MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  UberSplashScreen(),
    );
  }
}
