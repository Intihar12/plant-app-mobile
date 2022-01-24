

class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);

  static List<Product> getProducts() {
    List<Product> items = <Product>[];
    items.add(
        Product(
            "Pixel",
            "Pixel is the most featureful phone ever",
            800,
            "web1.jpg"
        )
    );
    items.add(
        Product(
            "Laptop",
            "Laptop is most productive development tool",
            2000,
            "web.jpg"
        )
    );
    items.add(
        Product(
            "Tablet",
            "Tablet is the most useful device ever for meeting",
            1500,
            "web.jpg"
        )
    );
    items.add(
        Product(
            "Pendrive",
            "iPhone is the stylist phone ever",
            100,
            "web3.jpg"
        )
    );
    items.add(
        Product(
            "Floppy Drive",
            "iPhone is the stylist phone ever",
            20,
            "web1.jpg"
        )
    );
    items.add(
        Product(
            "iPhone",
            "iPhone is the stylist phone ever",
            1000,
            "web3.jpg"
        )
    );
    return items;
  }
}

