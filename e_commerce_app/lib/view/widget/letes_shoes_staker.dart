import 'package:e_commerce_app/model/sneker_model.dart';
import 'package:e_commerce_app/view/widget/stager_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LetestStaker extends StatelessWidget {
  const LetestStaker({
    super.key,
    required Future<List<SnekerModel>> male,
  }) : _male = male;

  final Future<List<SnekerModel>> _male;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _male,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        } else {
          final male = snapshot.data;
          return MasonryGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            scrollDirection: Axis.vertical,
            itemCount: male!.length,
            itemBuilder: (context, index) {
              final shoes = snapshot.data![index];
              return StagerTiles(
                imageurl: shoes.imageurl![0],
                name: "${shoes.name}",
                price: "\$${shoes.price}",
              );
            },
          );
        }
      },
    );
  }
}
