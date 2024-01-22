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
}
