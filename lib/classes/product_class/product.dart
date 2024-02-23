import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final num price;

  @HiveField(3)
  final int amount;

  @HiveField(4)
  final bool isChecked;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.amount,
    this.isChecked = false,
  });

  Product copyWith({
    String? name,
    num? price,
    int? amount,
    bool? isChecked,
  }) {
    return Product(
      id: id,
      name: name ?? this.name,
      price: price ?? this.price,
      amount: amount ?? this.amount,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  String toString() {
    return "[${isChecked ? "✅" : "❌"}] $amount units of $name at a price of \$$price ";
  }
}
