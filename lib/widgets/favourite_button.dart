import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';

class FavouriteButton extends StatefulWidget {
  final int index;
  const FavouriteButton({super.key, required this.index});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return IconButton(
      onPressed: () {
        setState(() {
          food[widget.index] = food[widget.index].copyWith(
            isFavourite: !food[widget.index].isFavourite,
          );
        });
      },
      icon: food[widget.index].isFavourite
          ? Icon(
              size: size.height * 0.03,
              Icons.favorite,
              color: Theme.of(context).primaryColor,
            )
          : Icon(
              size: size.height * 0.03,
              Icons.favorite_border,
              color: Theme.of(context).primaryColor,
            ),
    );
  }
}
