import 'package:flutter/material.dart';

class SnekerModel {
  final String id;
  final String name;
  final String category;
  final List<String> imageurl;
  final String oldprice;
  final List<Size> sizes;
  final String price;
  final String description;
  final String title;

  const SnekerModel(
      {required this.id,
      required this.name,
      required this.category,
      required this.imageurl,
      required this.oldprice,
      required this.sizes,
      required this.price,
      required this.description,
      required this.title});


}

