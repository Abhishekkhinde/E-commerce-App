import 'package:e_commerce_app/controller/mainscreen_provider.dart';
import 'package:e_commerce_app/view/screen.dart/cart_page.dart';
import 'package:e_commerce_app/view/screen.dart/home_page.dart';
import 'package:e_commerce_app/view/screen.dart/profile_page.dart';
import 'package:e_commerce_app/view/screen.dart/search_page.dart';
import 'package:e_commerce_app/view/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  MainScreen({super.key});
  List<Widget> pageList = const [
    HomeScreen(),
    SearchScreen(),
    HomeScreen(),
    CartScreen(),
    ProfileScreen()
  ];
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // MainscreenProvider mainscreenProvider = MainscreenProvider();
    // return Scaffold(
    //   backgroundColor: const Color(0xFFE2E2E2),
    //   body: widget.pageList[mainscreenProvider.pageIndex],
    //   bottomNavigationBar: const BottomNaviBar(),
    // );

    return Consumer<MainscreenProvider>(
      builder: (context, mainscreenprovider, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: widget.pageList[mainscreenprovider.pageIndex],
          bottomNavigationBar: const BottomNaviBar(),
        );
      },
    );
  }
}
