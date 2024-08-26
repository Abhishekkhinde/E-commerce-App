import 'package:flutter/material.dart';

class NewShoes extends StatelessWidget {
  const NewShoes({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Container(
      height: heights * 0.12,
      width: widths * 0.28,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 1,
              blurRadius: 0.8,
              offset: Offset(0, 1),
            )
          ]),
      // child: Image.network(
      //     "https://img.freepik.com/free-psd/running-shoes-sneakers-transparent-background_84443-1654.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1724284800&semt=ais_hybrid"),
    );
  }
}
