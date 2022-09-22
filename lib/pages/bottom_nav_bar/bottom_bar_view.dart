import 'dart:io';

import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trip_it_project/constants/color_manager.dart';

import '../../constants/styles_manager.dart';
import '../../constants/values_manager.dart';
import 'screens/favourite/favourite_view.dart';
import 'screens/location/view/location_view.dart';
import 'screens/notifications/notifications_view.dart';
import 'screens/profile/profile_view.dart';
import 'screens/tour/view/tours_view.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({
    Key? key,
  }) : super(key: key);

  // final String? token;

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  int currentPage = 2;
  final List<Widget> _pages = [
    ToursView(),
    const FavouriteView(),
    LocationView(),
    const NotificationsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          showDialog(
              builder: (context) {
                return AlertDialog(
                  title: const Text("Are you sure to close app?"),
                  backgroundColor: Colors.white,
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      },
                      child: const Text("Close"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: getRegularStyle(
                            color: ColorManager.black, fontSize: 15),
                      ),
                    )
                  ],
                );
              },
              context: context);
          return true;
        },
        child: Scaffold(
          body: _pages[currentPage],
          bottomNavigationBar: CircleBottomNavigationBar(
            initialSelection: currentPage,
            arcHeight: 100,
            circleOutline: 0.0,
            shadowAllowance: 0.0,
            circleSize: 60.0,
            blurShadowRadius: 50.0,
            barBackgroundColor: ColorManager.white,
            circleColor: ColorManager.mainColor,
            activeIconColor: ColorManager.white,
            inactiveIconColor: ColorManager.grey,
            tabs: getTabsData(),
            onTabChangedListener: (index) =>
                setState(() => currentPage = index),
          ),
        ));
  }
}

List<TabData> getTabsData() {
  return [
    TabData(
      icon: Icons.home_outlined,
      iconSize: AppSize.s30,
    ),
    TabData(
      icon: Icons.favorite_outline,
      iconSize: AppSize.s30,
    ),
    TabData(
      icon: Icons.shop_two_rounded,
      iconSize: AppSize.s30,
    ),
    TabData(
      icon: Icons.calendar_month,
      iconSize: AppSize.s30,
    ),
    TabData(
      icon: Icons.person_outlined,
      iconSize: AppSize.s30,
    ),
  ];
}
