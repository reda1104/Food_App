import 'package:flutter/material.dart';

class FoodItemCounter extends StatefulWidget {
  const FoodItemCounter({super.key});

  @override
  State<FoodItemCounter> createState() => _FoodItemCounterState();
}

class _FoodItemCounterState extends State<FoodItemCounter> {
  int counter = 1;
  void counterIncrement() {
    setState(() {
      counter++;
    });
  }

  void counterDecrement() {
    if (counter > 1) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: counterDecrement,
            icon: Icon(
              Icons.minimize,
              color: counter == 1 ? Colors.grey : Colors.black,
            ),
          ),
          Text(
            counter.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          IconButton(
            onPressed: counterIncrement,
            icon: Icon(Icons.add, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
