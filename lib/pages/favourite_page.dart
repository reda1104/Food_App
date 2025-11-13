import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favourite_item.dart';

class FavouritePage extends StatefulWidget {
  FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final favouriteFood = food
      .where((foodItem) => foodItem.isFavourite == true)
      .toList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (favouriteFood.isEmpty) {
      return Center(
        child: Column(
          children: [
            SizedBox(height: 80),
            Image.asset(
              "assets/images/emptybox.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              "No Favourite items Found!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: favouriteFood.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Image.network(
                    favouriteFood[index].imageUrl,
                    height: size.height * 0.1,
                    width: size.width * 0.2,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          favouriteFood[index].name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$ ${favouriteFood[index].price}",
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
                      final targetedItem = favouriteFood[index];
                      final targetedIndex = food.indexOf(targetedItem);
                      setState(() {
                        food[targetedIndex] = food[targetedIndex].copyWith(
                          isFavourite: false,
                        );
                        favouriteFood.remove(targetedItem);
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: size.height * 0.035,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
