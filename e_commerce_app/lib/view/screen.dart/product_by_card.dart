import 'package:e_commerce_app/helper/sneker_api.dart';
import 'package:e_commerce_app/model/sneker_model.dart';
import 'package:e_commerce_app/view/widget/categori_btn.dart';
import 'package:e_commerce_app/view/widget/custom_spacer_widget.dart';
import 'package:e_commerce_app/view/widget/letes_shoes_staker.dart';
import 'package:e_commerce_app/view/widget/textstyle.dart';
import 'package:flutter/material.dart';

class ProductByCard extends StatefulWidget {
  const ProductByCard({super.key});

  @override
  State<ProductByCard> createState() => _ProductByCardState();
}

class _ProductByCardState extends State<ProductByCard>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<SnekerModel>> _male;
  late Future<List<SnekerModel>> _female;
  late Future<List<SnekerModel>> _kids;

  void getMale() {
    _male = SnekerApi().getmaleSneker();
  }

  void getFemale() {
    _female = SnekerApi().getFemaleSneker();
  }

  void getKids() {
    _kids = SnekerApi().getkidsSneker();
  }

  List<String> brand = [];

  @override
  void initState() {
    getMale();
    getFemale();
    getKids();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    // final widths = MediaQuery.of(context).size.width;
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(7, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(Icons.tune, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: textstyle(24, Colors.white, FontWeight.bold),
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
                    ],
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding:
                    EdgeInsets.only(top: heights * 0.175, left: 16, right: 12),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    LetestStaker(male: _male),
                    LetestStaker(male: _female),
                    LetestStaker(male: _kids),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    final heights = MediaQuery.of(context).size.height;
    double _value = 100;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) {
        return Container(
          height: heights * 0.82,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38,
                ),
              ),
              SizedBox(
                height: heights * 0.7,
                child: Column(
                  children: [
                    const CustomSpacer(),
                    Text(
                      "Filter",
                      style: textstyle(40, Colors.black, FontWeight.bold),
                    ),
                    const CustomSpacer(),
                    Text(
                      "Gender",
                      style: textstyle(20, Colors.black, FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        CategoriBtn(
                          lable: "Men",
                          buttonClr: Colors.black,
                        ),
                        CategoriBtn(
                          lable: "Women",
                          buttonClr: Colors.grey,
                        ),
                        CategoriBtn(
                          lable: "Kids ",
                          buttonClr: Colors.grey,
                        ),
                      ],
                    ),
                    const CustomSpacer(),
                    Text(
                      "Category",
                      style: textstyle(20, Colors.black, FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        CategoriBtn(
                          lable: "Shoes",
                          buttonClr: Colors.grey,
                        ),
                        CategoriBtn(
                          lable: "Apparrels",
                          buttonClr: Colors.grey,
                        ),
                        CategoriBtn(
                          lable: "Accessories",
                          buttonClr: Colors.grey,
                        ),
                      ],
                    ),
                    const CustomSpacer(),
                    Text(
                      "Price",
                      style: textstyle(20, Colors.black, FontWeight.w600),
                    ),
                    const CustomSpacer(),
                    Slider(
                      value: _value,
                      activeColor: Colors.black,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.black,
                      max: 500,
                      divisions: 50,
                      label: _value.toString(),
                      secondaryTrackValue: 200,
                      onChanged: (double value) {},
                    ),
                    const CustomSpacer(),
                    Text(
                      "Brand",
                      style: textstyle(20, Colors.black, FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 80,
                      child: ListView.builder(
                        itemCount: brand.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Image.asset(
                                brand[index],
                                height: 60,
                                width: 80,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
