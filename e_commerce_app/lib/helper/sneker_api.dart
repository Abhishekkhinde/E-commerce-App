import 'package:flutter/services.dart' as the_bundle;
import 'package:e_commerce_app/model/sneker_model.dart';

class SnekerApi {
  Future<List<SnekerModel>> getmaleSneker() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = snekerfromJson(data);
    return maleList;
  }

  Future<List<SnekerModel>> getFemaleSneker() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/female_shoes.json");

    final femaleList = snekerfromJson(data);
    return femaleList;
  }

  Future<List<SnekerModel>> getkidsSneker() async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

    final kidsList = snekerfromJson(data);
    return kidsList;
  }

  // single male
  Future<SnekerModel> getmaleSnekerD(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/men_shoes.json");

    final maleList = snekerfromJson(data);
    final sneker = maleList.firstWhere((sneker) => sneker.id == id);
    return sneker;
  }

// single female
  Future<SnekerModel> getFemaleSnekerD(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/female_shoes.json");

    final femaleList = snekerfromJson(data);
    final sneker = femaleList.firstWhere((sneker) => sneker.id == id);
    return sneker;
  }

  // singlekids
  Future<SnekerModel> getKidsSnekerD(String id) async {
    final data =
        await the_bundle.rootBundle.loadString("assets/json/kids_shoes.json");

    final childList = snekerfromJson(data);
    final sneker = childList.firstWhere((sneker) => sneker.id == id);
    return sneker;
  }
}
