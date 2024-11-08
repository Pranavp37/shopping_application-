import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_application/controller/get_userdata_controller.dart';

class UserAccountScreen extends StatelessWidget {
  const UserAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GetUserdataController getUserdataController = Get.find();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Account Details",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Obx(
                  () {
                    if (getUserdataController.isloading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (getUserdataController.error.isNotEmpty) {
                      return Center(
                        child: Text(getUserdataController.error.toString()),
                      );
                    }
                    var data = getUserdataController.uerData.value;

                    if (data == null) {
                      return const Center(child: Text('user not found'));
                    }

                    return Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person, size: 30),
                            const SizedBox(width: 10),
                            Text(
                              data.name ?? 'no user',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            const Icon(Icons.email, size: 30),
                            const SizedBox(width: 10),
                            Text(
                              data.email ?? 'no email found',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
