class product {
  late  String name;
  late String description;
  late int price;
  late String image;

  product(this.name, this.description, this.price, this.image);
  factory product.fromMap(Map<String, dynamic> json) {
    return product(
      json['name'],
      json['description'],
      json['price'],
      json['image'],
    );
  }
}