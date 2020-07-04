class MenuItem {
  final String category;
  final String imageUrl;
  final String name;
  final int price;
  int quantity;

  MenuItem(
      {this.category, this.imageUrl, this.name, this.price, this.quantity = 0});
}
