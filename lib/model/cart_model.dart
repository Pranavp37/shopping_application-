import 'package:hive/hive.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 1)
class CartModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? image;
  @HiveField(2)
  int? qty;
  @HiveField(3)
  double? price;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? desc;

  CartModel({
    this.id,
    this.name,
    this.image,
    this.desc,
    this.price,
    this.qty,
  });
  CartModel copyWith({
    int? id,
    String? image,
    String? name,
    double? price,
    String? desc,
    int? qty,
  }) {
    return CartModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      price: price ?? this.price,
      desc: desc ?? this.desc,
      qty: qty ?? this.qty,
    );
  }
}
