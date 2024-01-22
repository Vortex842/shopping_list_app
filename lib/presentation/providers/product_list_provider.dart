import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/domain/entities/product.dart';

final productsProvider = StateProvider<List<Product>>(
  (ref) {
    return [
      Product(name: "Fideos", price: 856, amount: 12),
      Product(name: "Arroz", price: 2366, amount: 2),
      Product(name: "Atun", price: 85136, amount: 8),
      Product(name: "Carne 1kg", price: 7899, amount: 12),
      Product(name: "Manteca", price: 856, amount: 5),
      Product(name: "Arroz", price: 5151, amount: 0),
      Product(name: "Atun", price: 856, amount: 2),
      Product(name: "Carne 1kg", price: 1472, amount: 12),
      Product(name: "Manteca", price: 25893, amount: 0),
      Product(name: "Azucar", price: 856, amount: 1),
      Product(name: "Carne 1kg", price: 2023610, amount: 12),
      Product(name: "Manteca", price: 800236, amount: 6),
      Product(name: "Azucar", price: 856, amount: 1),
    ];
  },
);
