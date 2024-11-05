import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_application/controller/api_data_controller.dart';
import 'package:shopping_application/controller/auth_controller.dart';
import 'package:shopping_application/firebase_options.dart';
import 'package:shopping_application/views/bottm_nav/bottom_nav_bar.dart';
import 'package:shopping_application/views/register_screen/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthController());
  Get.put(ApiDataController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Obx(
          () {
            return authController.user != null
                ? const BottonNavBar()
                : RegisterScreen();
          },
        ));
  }
}
