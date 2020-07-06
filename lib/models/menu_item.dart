class MenuItem {
  final String category;
  final String imageUrl;
  final String name;
  final int price;
  int quantity;

  MenuItem(
      {this.category, this.imageUrl, this.name, this.price, this.quantity = 1});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}
