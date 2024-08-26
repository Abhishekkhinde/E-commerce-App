import 'package:e_commerce_app/view/widget/textstyle.dart';
import 'package:flutter/material.dart';

class StagerTiles extends StatefulWidget {
  const StagerTiles(
      {super.key,
      required this.imageurl,
      required this.name,
      required this.price});
  final String imageurl;
  final String name;
  final String price;

  @override
  State<StagerTiles> createState() => _StagerTilesState();
}

class _StagerTilesState extends State<StagerTiles> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.imageurl,
              fit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.only(top: 12),
              height: 75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style:
                        textstyleheight(20, Colors.black, FontWeight.w700, 1),
                  ),
                  Text(
                    widget.price,
                    style:
                        textstyleheight(20, Colors.black, FontWeight.w500, 1),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
