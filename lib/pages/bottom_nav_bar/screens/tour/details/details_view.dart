import 'package:flutter/material.dart';

import '../../../../../constants/assets_manager.dart';
import '../../../../../constants/color_manager.dart';
import '../../../../../constants/styles_manager.dart';
import '../../../../../constants/values_manager.dart';

class PlacesDetailsView extends StatelessWidget {
  const PlacesDetailsView({Key? key, required this.details}) : super(key: key);
  final details;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 15,
                color: ColorManager.grey,
              ),
              Text(
                "Back",
                textAlign: TextAlign.center,
                style: getRegularStyle(
                    color: ColorManager.grey, fontSize: AppSize.s18),
              ),
            ],
          ),
        ),
        title: Text(
          details.name,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(AppSize.s20),
            child: Image.asset(
              IconsAssets.searchIcon,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  width: size.width,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        top: 0,
                        child: Container(
                          height: AppSize.s250,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(AppSize.s12)),
                            image: DecorationImage(
                              image: AssetImage(details.detailsBg),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 155,
                        width: 155,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppSize.s14)),
                          image: DecorationImage(
                              image: AssetImage(details.detailsImage),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      details.name,
                      style:
                          getBoldStyle(color: ColorManager.black, fontSize: 30),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Departure",
                        style: getBoldStyle(
                            color: ColorManager.black, fontSize: 20),
                      ),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      Text(
                        "23rd Oct 2021",
                        style: getRegularStyle(
                            color: ColorManager.grey, fontSize: 18),
                      ),
                      const SizedBox(
                        height: AppSize.s12,
                      ),
                      Text(
                        "Duration",
                        style: getBoldStyle(
                            color: ColorManager.black, fontSize: 20),
                      ),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      Text(
                        "5 Days / 4  Nights",
                        style: getRegularStyle(
                            color: ColorManager.grey, fontSize: 18),
                      ),
                      const SizedBox(
                        height: AppSize.s12,
                      ),
                      Text(
                        "Discover 7 World Heritage Sites in this tour.",
                        style: getBoldStyle(
                            color: ColorManager.black, fontSize: 20),
                      ),
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      Text(
                        "Fans of Mickey can visit Disneyland Paris"
                        " which is located 32 km from central Paris,"
                        " with connection to the suburban RER A.",
                        style: getRegularStyle(
                            color: ColorManager.grey, fontSize: 18),
                      ),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
