import 'package:equatable/equatable.dart';

class Product implements Equatable {
  final String id;
  final String name;
  final double price;
  final int amount;

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
    double? price,
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
    return "$amount of $name at a price of \$$price";
  }

  @override
  List<Object?> get props => [name, price, amount, isChecked];

  @override
  bool? get stringify => false;
}
