import 'package:flutter/material.dart';

import '../../../../../constants/assets_manager.dart';
import '../../../../../constants/color_manager.dart';
import '../../../../../constants/constants.dart';
import '../../../../../constants/values_manager.dart';
import '../components/build_location_item.dart';
import '../model/location_model.dart';

class LocationView extends StatelessWidget {
  LocationView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _key,
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(AppSize.s14),
          child: GestureDetector(
            onTap: () {
              _key.currentState!.openDrawer();
            },
            child: Image.asset(
              IconsAssets.menuIcon,
            ),
          ),
        ),
        title: const Text(
          "location",
        ),
      ),
      drawer: defaultDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppSize.s20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
                child: SizedBox(
                  height: AppSize.s870,
                  width: size.height,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => BuildLocationItem(
                            locationItem: locationItem[index],
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: AppSize.s14,
                          ),
                      itemCount: locationItem.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
