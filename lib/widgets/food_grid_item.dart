import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favourite_button.dart';

class GridFoodItem extends StatefulWidget {
  final int foodIndex;
  final List<FoodItem> filteredFood;

  const GridFoodItem({
    super.key,
    required this.foodIndex,
    required this.filteredFood,
  });

  @override
  State<GridFoodItem> createState() => _GridFoodItemState();
}

class _GridFoodItemState extends State<GridFoodItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final targetedIndex = food.indexOf(widget.filteredFood[widget.foodIndex]);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.network(
                    widget.filteredFood[widget.foodIndex].imageUrl,
                    height: constraints.maxHeight * 0.55,
                    fit: BoxFit.contain,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: FavouriteButton(index: targetedIndex),
                    // child: InkWell(
                    //   child: food[widget.foodIndex].isFavourite
                    //       ? Icon(
                    //           size: constraints.maxHeight * 0.17,
                    //           Icons.favorite,
                    //           color: Theme.of(context).primaryColor,
                    //         )
                    //       : Icon(
                    //           size: constraints.maxHeight * 0.17,
                    //           Icons.favorite_border,
                    //           color: Theme.of(context).primaryColor,
                    //         ),
                    //   onTap: () => setState(() {
                    //     food[widget.foodIndex] = food[widget.foodIndex]
                    //         .copyWith(
                    //           isFavourite: !food[widget.foodIndex].isFavourite,
                    //         );
                    //   }),
                    // ),
                  ),
                ],
              ),

              SizedBox(
                height: constraints.maxHeight * 0.17,
                child: FittedBox(
                  child: Text(
                    widget.filteredFood[widget.foodIndex].name,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.17,
                child: FittedBox(
                  child: Text(
                    "\$ ${widget.filteredFood[widget.foodIndex].price}",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
