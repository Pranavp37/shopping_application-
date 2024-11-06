import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopping_application/controller/cart_controller.dart';
import 'package:shopping_application/model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    this.id,
    this.description,
    this.image,
    this.price,
    this.rating,
    this.title,
  });
  final int? id;
  final String? image;
  final String? title;
  final double? price;
  final String? description;
  final Rating? rating;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  image!,
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                title!,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Rs $price',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 16),
              Text(
                description ?? 'No description available.',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              if (rating != null) ...[
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[700]),
                    const SizedBox(width: 4),
                    Text(
                      '${rating!} (${rating!.count ?? 0} reviews)',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Total: Rs ${price?.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  cartController.addProduct(
                    id: id!,
                    name: title!,
                    price: price!,
                    desc: description!,
                    image: image,
                  );
                },
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                label: const Text(
                  "Add to Cart",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
