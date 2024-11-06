import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shopping_application/controller/api_data_controller.dart';
import 'package:shopping_application/controller/auth_controller.dart';
import 'package:shopping_application/controller/cart_controller.dart';
import 'package:shopping_application/controller/get_userdata_controller.dart';
import 'package:shopping_application/firebase_options.dart';
import 'package:shopping_application/model/cart_model.dart';
import 'package:shopping_application/views/bottm_nav/bottom_nav_bar.dart';
import 'package:shopping_application/views/register_screen/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Hive.registerAdapter(CartModelAdapter());
  var box = await Hive.openBox<CartModel>('Card_box');
  Get.put(AuthController());
  Get.put(ApiDataController());
  Get.put(CartController());
  Get.put(GetUserdataController());
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
