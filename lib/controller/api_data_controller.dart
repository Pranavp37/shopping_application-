import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_application/model/product_model.dart';

class ApiDataController extends GetxController {
  var isLoading = false.obs;
  var productData = <ProductModel>[].obs;
  var error = ''.obs;
  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  void getAllProducts() async {
    try {
      isLoading(true);
      var res = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (res.statusCode == 200) {
        productData.value = productModelFromJson(res.body);
      } else {
        error('Failed to load data: ${res.statusCode}');
      }
    } catch (e) {
      error(e.toString());
    }
    isLoading(false);
  }
}
