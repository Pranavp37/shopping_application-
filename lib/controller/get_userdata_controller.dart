import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopping_application/model/user_model.dart';

class GetUserdataController extends GetxController {
  var uerData = Rxn<UserModel>();
  var isloading = false.obs;
  var error = ''.obs;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  Future<void> getUserData() async {
    isloading(true);
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      var user = auth.currentUser;

      var uid = user!.uid;
      log(uid.toString());
      var data =
          await FirebaseFirestore.instance.collection('user').doc(uid).get();
      uerData.value = UserModel.fromJson(data.data()!);
    } catch (e) {
      error(e.toString());
    } finally {
      isloading(false);
    }
  }
}
