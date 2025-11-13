import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavouriteItem extends StatefulWidget {
  final int foodIndex;
  const FavouriteItem({super.key, required this.foodIndex});

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  final favouriteFood = food
      .where((foodItem) => foodItem.isFavourite == true)
      .toList();
  bool isFav = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.network(
              favouriteFood[widget.foodIndex].imageUrl,
              height: 70,
              width: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favouriteFood[widget.foodIndex].name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$ ${favouriteFood[widget.foodIndex].price}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                final targetedItem = favouriteFood[widget.foodIndex];
                final targetedIndex = food.indexOf(targetedItem);
                setState(() {
                  food[targetedIndex] = food[targetedIndex].copyWith(
                    isFavourite: false,
                  );
                  isFav = !isFav;
                });
              },
              icon: isFav
                  ? Icon(
                      Icons.favorite,
                      size: 28,
                      color: Theme.of(context).primaryColor,
                    )
                  : Icon(
                      Icons.favorite_border,
                      size: 28,
                      color: Theme.of(context).primaryColor,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
