class Product {
  final String id;
  final String name;
  final num price;
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
