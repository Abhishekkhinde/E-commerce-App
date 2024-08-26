import 'package:e_commerce_app/helper/sneker_api.dart';
import 'package:e_commerce_app/model/sneker_model.dart';
import 'package:e_commerce_app/view/widget/home_widget.dart';
import 'package:e_commerce_app/view/widget/textstyle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<SnekerModel>> _male;
  late Future<List<SnekerModel>> _female;
  late Future<List<SnekerModel>> _kids;

  void getMale() {
    _male = SnekerApi().getmaleSneker();
  }

  void getfemale() {
    _female = SnekerApi().getFemaleSneker();
  }

  void getkids() {
    _kids = SnekerApi().getkidsSneker();
  }

  @override
  void initState() {
    getMale();
    getfemale();
    getkids();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: SizedBox(
          height: heights,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
                height: heights * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/eclips.png"), fit: BoxFit.fill),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 8, bottom: 15),
                  width: widths,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Casual Sneakers",
                        style: textstyleheight(
                          35,
                          Colors.white,
                          FontWeight.bold,
                          1.5,
                        ),
                      ),
                      Text(
                        "Collection",
                        style: textstyleheight(
                          36,
                          Colors.white,
                          FontWeight.bold,
                          1.5,
                        ),
                      ),
                      TabBar(
                          padding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle:
                              textstyle(24, Colors.white, FontWeight.bold),
                          unselectedLabelColor: Colors.grey.withOpacity(0.3),
                          tabs: const [
                            Tab(
                              text: "Men Shoes",
                            ),
                            Tab(
                              text: "Women Shoes",
                            ),
                            Tab(
                              text: "Kids Shoes",
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: heights * 0.265),
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: TabBarView(controller: _tabController, children: [
                    HomeWidget(male: _male),
                    HomeWidget(male: _female),
                    HomeWidget(male: _kids),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
