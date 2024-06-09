import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shaheendrive/core/network_checker/uber_network_checker_controller.dart';
import 'package:shaheendrive/features/uber_auth_feature/presentation/getx/auth_controller.dart';
import 'package:shaheendrive/features/uber_auth_feature/presentation/pages/uber_auth_register_page.dart';
import 'package:shaheendrive/features/uber_auth_feature/presentation/pages/uber_auth_welcome_page.dart';
import 'package:shaheendrive/features/uber_home_page_feature/presentation/pages/uber_home_page.dart';
import 'package:shaheendrive/injection_container.dart' as di;
import 'package:shaheendrive/view/homepage.dart';
class UberSplashScreen extends StatefulWidget {
  const UberSplashScreen({Key? key}) : super(key: key);

  @override
  _UberSplashScreenState createState() => _UberSplashScreenState();
}

class _UberSplashScreenState extends State<UberSplashScreen> {
  final UberAuthController _uberAuthController =
  Get.put(di.sl<UberAuthController>());
  final UberNetWorkStatusChecker _netWorkStatusChecker =
  Get.put(di.sl<UberNetWorkStatusChecker>());

  @override
  void initState() {
    _netWorkStatusChecker.updateConnectionStatus();
    _uberAuthController.checkIsSignIn();
    Timer(const Duration(seconds: 3), () async {
      if (_uberAuthController.isSignIn.value) {
        if (await _uberAuthController.checkUserStatus()) {
          Get.off(() => const Homepage());
        } else {
          Get.off(() => const UberAuthRegistrationPage());
        }
      } else {
        Get.off(() => const UberAuthWelcomeScreen());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
          child: Text(
            "Shaheen Drive",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 45),
          )),
    );
  }
}
