import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favourite_button.dart';
import 'package:food_delivery/widgets/food_details/food_item_counter.dart';
import 'package:food_delivery/widgets/food_details/property_item.dart';
import 'package:food_delivery/widgets/food_details/top_banner.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FavouriteButton(index: index),
                      ),
                    ],
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () =>
                            Navigator.of(context).pop<String>(food[index].name),
                        icon: Icon(
                          Icons.chevron_left,
                          size: size.height * 0.04,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    expandedHeight: size.height * 0.37,
                    flexibleSpace: FlexibleSpaceBar(
                      background: DecoratedBox(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 210, 210, 210),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Image.network(
                            food[index].imageUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Column(
                          children: [
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    const SizedBox(height: 2.0),
                                    Text(
                                      "Buffalo Burger",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: Colors.grey[700]),
                                    ),
                                  ],
                                ),
                                const FoodItemCounter(),
                              ],
                            ),
                            const SizedBox(height: 32.0),
                            const IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  PropertyItem(
                                    propertyName: "Size",
                                    propertyValue: "Medium",
                                  ),
                                  VerticalDivider(indent: 5, endIndent: 5),
                                  PropertyItem(
                                    propertyName: "Calories",
                                    propertyValue: "200 Kcal",
                                  ),
                                  VerticalDivider(indent: 5, endIndent: 5),
                                  PropertyItem(
                                    propertyName: "Cooking",
                                    propertyValue: "10-20 min",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              "Here is a longer example of filler text that reads smoothly. It is not meant to convey any specific information but provides enough sentences to test how a page or section will look once the real writing is added. Designers, developers, and writers often use this type of dummy content to focus on structure rather than meaning.specific information but provides enough sentences to test how a page or section will look once the real writing is added. Designers, developers, and writers often use this type of dummy content to focus on structure rather than meaning. The goal is simply to visualize how the layout behaves with text of various lengths, helping ensure everything appears clean, readable, and well balanced.",
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(color: Colors.grey[700]),
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: Row(
                children: [
                  Text(
                    "\$ ${food[index].price}",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 32),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Check Out"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
