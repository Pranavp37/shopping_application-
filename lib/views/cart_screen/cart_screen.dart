import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_application/controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, this.id});
  final int? id;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      bottomNavigationBar: Obx(
        () {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 100,
              color: Colors.white,
              child: Row(
                children: [
                  Text(
                    'Total Price : ${cartController.totalAmt.toStringAsFixed(2)}',
                    // 'Total Price 678',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  InkWell(
                    child: Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      child: const Center(
                          child: Text(
                        'checkbox',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  )
                ],
              ));
        },
      ),
      body: Obx(
        () {
          return ListView.separated(
            itemBuilder: (context, index) {
              var data = cartController.cartProduct[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(data.image.toString())),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 2,
                                  data.name.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  maxLines: 2,
                                  data.price.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  data.desc.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  cartController.increment(index);
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_up_sharp,
                                  size: 38,
                                ),
                              ),
                              Text(
                                data.qty.toString(),
                                style: const TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),

                              IconButton(
                                onPressed: () {
                                  cartController.decrement(index);
                                },
                                icon: const Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 38,
                                ),
                              ),
                              const SizedBox(height: 10),

                              //Remove Button
                              MaterialButton(
                                color: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {
                                  cartController.removeCartProduct(index);
                                },
                                child: const Text(
                                  'Remove',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: cartController.cartProduct.length,
          );
        },
      ),
    );
  }
}
