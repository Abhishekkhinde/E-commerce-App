import 'package:e_commerce_app/controller/mainscreen_provider.dart';
import 'package:e_commerce_app/view/widget/bottom_nav_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainscreenProvider>(
      builder: (context, mainscreenProvider, child) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavBar(
                    onTap: () {
                      mainscreenProvider.pageIndex = 0;
                    },
                    icon: Icons.home,
                    color: mainscreenProvider.pageIndex == 0
                        ? Colors.red
                        : Colors.white),
                BottomNavBar(
                    onTap: () {
                      mainscreenProvider.pageIndex = 1;
                    },
                    icon: Icons.search,
                    color: mainscreenProvider.pageIndex == 1
                        ? Colors.red
                        : Colors.white),
                BottomNavBar(
                  onTap: () {
                    mainscreenProvider.pageIndex = 2;
                  },
                  color: mainscreenProvider.pageIndex == 2
                      ? Colors.red
                      : Colors.white,
                  icon: Icons.add,
                ),
                BottomNavBar(
                    onTap: () {
                      mainscreenProvider.pageIndex = 3;
                    },
                    icon: Icons.card_travel,
                    color: mainscreenProvider.pageIndex == 3
                        ? Colors.red
                        : Colors.white),
                BottomNavBar(
                    onTap: () {
                      mainscreenProvider.pageIndex = 4;
                    },
                    icon: Icons.person,
                    color: mainscreenProvider.pageIndex == 4
                        ? Colors.red
                        : Colors.white),
              ],
            ),
          ),
        ));
      },
    );
  }
}
