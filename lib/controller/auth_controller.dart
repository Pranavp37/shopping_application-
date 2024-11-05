import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:shopping_application/model/user_model.dart';
import 'package:shopping_application/views/bottm_nav/bottom_nav_bar.dart';
import 'package:shopping_application/views/login_screen/login_screen.dart';

class AuthController extends GetxController {
  final Rxn<User?> _user = Rxn<User>();
  User? get user => _user.value;
  @override
  void onInit() {
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    super.onInit();
  }

  Future<void> authregister(UserModel userModel) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);
      Get.snackbar("Regiater", 'Register Successfully');
      Get.off(LoginScreen());
      await FirebaseFirestore.instance.collection('user').doc().set({
        "username": userModel.name,
        "email": userModel.email,
      });
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  Future<void> authLogin(UserModel userModel) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);
      Get.snackbar('Login', 'Login Successfully');
      Get.off(const BottonNavBar());
    } catch (e) {
      Get.snackbar('error', e.toString());
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
