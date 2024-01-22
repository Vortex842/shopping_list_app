class Product {
  final String name;
  final double price;
  final int amount;

  final bool isChecked;

  Product({
    required this.name,
    required this.price,
    required this.amount,
    this.isChecked = false,
  });

  Product copyWith({
    required String? name,
    required double? price,
    required int? amount,
    bool? isChecked,
  }) {
    return Product(
      name: name ?? this.name,
      price: price ?? this.price,
      amount: amount ?? this.amount,
    );
  }

  @override
  String toString() {
    return "$amount of $name with a value of \$$price";
  }
}
