import 'package:e_commerce_app/model/sneker_model.dart';
import 'package:e_commerce_app/view/widget/new_shoes.dart';
import 'package:e_commerce_app/view/widget/product_card.dart';
import 'package:e_commerce_app/view/widget/textstyle.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<SnekerModel>> male,
  }) : _male = male;

  final Future<List<SnekerModel>> _male;

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: heights * 0.405,
          child: FutureBuilder<List<SnekerModel>>(
            future: _male,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("Error ${snapshot.error}");
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: male!.length,
                  itemBuilder: (context, index) {
                    final shoes = snapshot.data![index];
                    return ProductCard(
                      name: shoes.name,
                      category: shoes.category,
                      id: shoes.id,
                      image: shoes.imageurl![0],
                      price: shoes.price,
                    );
                  },
                );
              }
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Shoes",
                    style: textstyle(24, Colors.black, FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "Show All",
                        style: textstyle(22, Colors.black, FontWeight.w500),
                      ),
                      const Icon(
                        Icons.arrow_right,
                        size: 35,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
                height: heights * 0.15,
                child: FutureBuilder(
                    future: _male,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("Error ${snapshot.error}");
                      } else {
                        final male = snapshot.data;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: male!.length,
                          itemBuilder: (context, index) {
                            final shoes = snapshot.data![index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: NewShoes(
                                image: shoes.imageurl![0],
                              ),
                            );
                          },
                        );
                      }
                    }))
          ],
        )
      ],
    );
  }
}
