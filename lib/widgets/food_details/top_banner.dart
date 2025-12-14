import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart' show FoodItem, food;
import 'package:food_delivery/widgets/favourite_button.dart';

class TopBanner extends StatelessWidget {
  final int index;

  const TopBanner({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 210, 210, 210),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.chevron_left,
                  size: size.height * 0.03,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              FavouriteButton(index: index),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.network(
              food[index].imageUrl,
              fit: BoxFit.contain,
              height: size.height * 0.32,
              width: size.width,
            ),
          ),
        ],
      ),
    );
  }
}
