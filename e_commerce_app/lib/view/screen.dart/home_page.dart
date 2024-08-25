import 'package:e_commerce_app/helper/sneker_api.dart';
import 'package:e_commerce_app/model/sneker_model.dart';
import 'package:e_commerce_app/view/widget/product_card.dart';
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
                    Column(
                      children: [
                        SizedBox(
                            height: heights * 0.405,
                            child: FutureBuilder<List<SnekerModel>>(
                              future: _male,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
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
                            )),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(12, 20, 12, 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Latest Shoes",
                                    style: textstyle(
                                        24, Colors.black, FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Show All",
                                        style: textstyle(
                                            22, Colors.black, FontWeight.w500),
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
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/airjorden.png")),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      height: heights * 0.12,
                                      width: widths * 0.28,
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: heights * 0.405,
                          color: Colors.red,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: heights * 0.405,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
