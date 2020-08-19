class Facemash {
  Facemash({
    this.categories,
  });

  List<Category> categories;

  factory Facemash.fromJson(Map<String, dynamic> json) => Facemash(
        categories: json["Categories"] == null
            ? null
            : List<Category>.from(
                json["Categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.category,
  });

  String category;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        category: json["category"] == null ? null : json["category"],
      );

  Map<String, dynamic> toJson() => {
        "category": category == null ? null : category,
      };
}
