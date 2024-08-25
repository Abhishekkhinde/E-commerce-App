import 'dart:convert';

List<SnekerModel> snekerfromJson(String str) =>
    List<SnekerModel>.from(json.decode(str).map((x) => SnekerModel(x)));

class SnekerModel {
  String? id;
  String? name;
  String? category;
  List<String>? imageurl;
  String? oldprice;
  List<dynamic>? sizes;
  String? price;
  String? description;
  String? title;

  SnekerModel(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    imageurl = List<String>.from(json['imageurl'].map((x) => x));
    oldprice = json['oldprice'];
    sizes = List<dynamic>.from(json['sizes'].map((x) => x));
    price = json['price'];
    description = json['description'];
    title = json['title'];
  }

  // const SnekerModel(
  //     {required this.id,
  //     required this.name,
  //     required this.category,
  //     required this.imageurl,
  //     required this.oldprice,
  //     required this.sizes,
  //     required this.price,
  //     required this.description,
  //     required this.title});

  // factory SnekerModel.fromJson(Map<String, dynamic> json) => SnekerModel(
  //       id: json['id'],
  //       name: json['name'],
  //       category: json['category'],
  //       imageurl: json['imageurl'] =
  //           List<String>.from(json['imageurl'].map((x) => x)),
  //       oldprice: json['oldprice'],
  //       sizes: json['sizes'] = List<dynamic>.from(json['sizes'].map((x) => x)),
  //       price: json['price'],
  //       description: json['description'],
  //       title: json['title'],
  //     );
}
