import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_item.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/utilities/app_assets.dart';
import 'package:food_delivery/widgets/food_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool enableCatgeoryFilter = false;
  String? categoryChosenId;
  late List<FoodItem> filteredFood;

  @override
  void initState() {
    super.initState();
    filteredFood = food;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                AppAssets.burgerBanner,
                height: isLandScape ? size.height * 0.5 : size.height * 0.25,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SizedBox(
              height: size.height * 0.15,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (categoryChosenId == categories[index].id ||
                            enableCatgeoryFilter == false) {
                          enableCatgeoryFilter = !enableCatgeoryFilter;
                        }
                        if (enableCatgeoryFilter) {
                          categoryChosenId = categories[index].id;
                          filteredFood = food
                              .where(
                                (item) => item.category == categoryChosenId,
                              )
                              .toList();
                        } else {
                          categoryChosenId = null;
                          filteredFood = food;
                        }
                      });
                    },
                    child: Container(
                      width: size.width * 0.25,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        color: categoryChosenId == categories[index].id
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Image.asset(categories[index].imgPath),
                            SizedBox(height: 8.0),
                            Text(
                              categories[index].title,
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    color:
                                        categoryChosenId == categories[index].id
                                        ? Colors.white
                                        : null,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredFood.length,
              itemBuilder: (context, index) => InkWell(
                child: GridFoodItem(
                  foodIndex: index,
                  filteredFood: filteredFood,
                ),
                onTap: () {
                  final targetedFoodItem = food.firstWhere(
                    (item) => item.id == filteredFood[index].id,
                  );
                  final targetedIndex = food.indexOf(targetedFoodItem);
                  Navigator.of(context)
                      .pushNamed(
                        FoodDetailsPage.routeName,
                        arguments: FoodDetailsArgs(foodIndex: targetedIndex),
                      )
                      .then((value) {
                        setState(() {});
                        filteredFood = food;
                        categoryChosenId = null;
                        debugPrint(
                          "Tha data returned on the home page is $value",
                        );
                      });
                },
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandScape ? 4 : 2,
                mainAxisSpacing: size.height * 0.02,
                crossAxisSpacing: size.height * 0.02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
