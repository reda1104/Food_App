class FoodItem {
  final String name;
  final String imageUrl;
  final double price;
  final bool isFavourite;

  FoodItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.isFavourite = false,
  });

  FoodItem copyWith({
    String? name,
    String? imageUrl,
    double? price,
    bool? isFavourite,
  }) {
    return FoodItem(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}

List<FoodItem> food = [
  FoodItem(
    name: "Beef Burger",
    imageUrl:
        "https://static.vecteezy.com/system/resources/previews/021/665/617/non_2x/beef-burger-isolated-png.png",
    price: 12.5,
  ),
  FoodItem(
    name: "Chicken Burger",
    imageUrl:
        "https://tse4.mm.bing.net/th/id/OIP.W9zbCMUzpTzeO-W6B0u1-wHaF5?rs=1&pid=ImgDetMain&o=7&rm=3",
    price: 13.5,
  ),
  FoodItem(
    name: "Smashed Burger",
    imageUrl:
        "https://images.squarespace-cdn.com/content/v1/63c5b359b5e668601719bc37/f99a4bbd-3ee0-4443-9c37-68c8dfbd4bb9/Downlow+Smashed+Burgers+New+Zealand+double+smashed+cheeseburger+nz+grassfed+beef.png",
    price: 10.5,
  ),
  FoodItem(
    name: "Chicken Pizza",
    imageUrl:
        "https://static.vecteezy.com/system/resources/previews/046/791/335/non_2x/bbq-chicken-pizza-free-png.png",
    price: 9,
  ),
  FoodItem(
    name: "Margherita Pizza",
    imageUrl: "https://pngimg.com/uploads/pasta/pasta_PNG58.png",
    price: 8,
  ),
  FoodItem(
    name: "Pasta",
    imageUrl:
        "https://static.vecteezy.com/system/resources/previews/021/344/437/original/pasta-isolated-on-a-transparent-background-png.png",
    price: 7,
  ),
];
