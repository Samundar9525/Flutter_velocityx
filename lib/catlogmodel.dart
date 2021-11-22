class catlog_model {
  static List<Item> items = [];
}

class Item {
  final num id;
  final String title;
  final num price;
  final String description;
  final String image;

  Item(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.description});

  factory Item.fromMap(Map<String, dynamic> map) => Item(
        id: map["id"],
        title: map["title"],
        price: map["price"],
        description: map["description"],
        image: map["image"],
      );

  toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
      };
}
