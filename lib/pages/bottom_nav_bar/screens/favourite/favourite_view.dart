import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Favourite Tours",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
