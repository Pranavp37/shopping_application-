import 'dart:developer';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_application/model/cart_model.dart';

class CartController extends GetxController {
  // Observable
  var cartProduct = <CartModel>[].obs;

  var keys = <dynamic>[].obs;

  var totalAmt = 0.0.obs;

  final cartBox = Hive.box<CartModel>('Card_box');

  @override
  void onInit() {
    getProduct();

    super.onInit();
  }

  Future<void> addProduct({
    required int id,
    String? image,
    required String name,
    required double price,
    required String desc,
  }) async {
    bool isAlreadyCart = false;

    for (int i = 0; i < cartProduct.length; i++) {
      if (id == cartProduct[i].id) {
        isAlreadyCart = true;
      }
    }

    if (isAlreadyCart) {
      Get.snackbar('erroe', 'Already in cart');
    } else {
      await cartBox.add(CartModel(
        id: id,
        image: image,
        name: name,
        price: price,
        desc: desc,
        qty: 1,
      ));
      Get.snackbar('success', ' New cart added');
    }

    log("${cartBox.values}");
    getProduct();
  }

  void getProduct() {
    keys.value = cartBox.keys.toList();
    cartProduct.value = cartBox.values.toList();

    calculateTotalAmt();
  }

  void removeCartProduct(int index) {
    cartBox.deleteAt(index);
    getProduct();
  }

  void increment(int index) {
    int quantity = cartProduct[index].qty ?? 1;
    if (quantity < 10) {
      quantity++;

      cartBox.put(
        keys[index],
        CartModel(
          id: cartProduct[index].id,
          desc: cartProduct[index].desc,
          image: cartProduct[index].image,
          name: cartProduct[index].name,
          price: cartProduct[index].price,
          qty: quantity,
        ),
      );

      cartProduct.refresh();
    }
    getProduct();
  }

  void decrement(int index) {
    int quantity = cartProduct[index].qty ?? 1;

    if (quantity > 1) {
      quantity--;

      cartBox.put(
        keys[index],
        CartModel(
          id: cartProduct[index].id,
          desc: cartProduct[index].desc,
          image: cartProduct[index].image,
          name: cartProduct[index].name,
          price: cartProduct[index].price,
          qty: quantity,
        ),
      );
      cartProduct.refresh();
    }
    getProduct();
  }

  void calculateTotalAmt() {
    totalAmt.value = 0;
    for (int i = 0; i < cartProduct.length; i++) {
      totalAmt.value += (cartProduct[i].price! * cartProduct[i].qty!);
    }

    log('$totalAmt');
  }
}
