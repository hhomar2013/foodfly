class CartModel {
  late int id;
  late String name;
  late double price;
  late int quantity;
  late String image;

  CartModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    this.image = '',
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    // بنعمل الـ Casting بعد ما نتأكد إن القيمة مش Null باستخدام الـ ??
    id = (json['id'] ?? 0).toInt();
    name = (json['name'] ?? '').toString();

    // أهم سطر: بنحول لـ double بأمان
    price = (json['price'] ?? 0.0);

    quantity = (json['quantity'] ?? 0).toInt();
    image = (json['image'] ?? '').toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'image': image,
    };
  }
}