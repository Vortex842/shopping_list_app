enum EditableTextType<T> {
  name("Nombre"),
  amount("Cantidad"),
  price("Precio");

  final String txt;
  T? returnType(T rName, T rAmount, T rPrice) {
    switch (this) {
      case EditableTextType.name:
        return rName;
      case EditableTextType.amount:
        return rAmount;
      case EditableTextType.price:
        return rPrice;
    }
  }

  const EditableTextType(this.txt);
}
