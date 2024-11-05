import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_application/controller/api_data_controller.dart';
import 'package:shopping_application/views/product_details_screen/product_details_screen.dart';
import 'package:shopping_application/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ApiDataController apiDataController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discover',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.logout,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        if (apiDataController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (apiDataController.error.isNotEmpty) {
          return Center(
            child: Text(apiDataController.error.value),
          );
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Search Anything',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: apiDataController.productData.length,
                  itemBuilder: (context, index) {
                    var data = apiDataController.productData[index];
                    return InkWell(
                      onTap: () {
                        Get.to(
                          ProductDetailScreen(
                            title: data.title,
                            description: data.description,
                            image: data.image,
                            price: data.price,
                            rating: data.rating,
                          ),
                        );
                      },
                      child: ProductCard(
                        name: data.title.toString(),
                        price: data.price!,
                        image: data.image.toString(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
