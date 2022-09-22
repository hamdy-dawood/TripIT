import 'package:flutter/material.dart';

import '../../../../../constants/color_manager.dart';
import '../../../../../constants/styles_manager.dart';
import '../../../../../constants/values_manager.dart';
import '../model/tour_model.dart';

class BuildPlacesItem extends StatelessWidget {
  const BuildPlacesItem(
      {Key? key, required this.press, required this.placesItem})
      : super(key: key);
  final PlacesItem placesItem;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
          height: AppSize.s250,
          width: AppSize.s150,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s12)),
            image: DecorationImage(image: AssetImage(placesItem.mainImage)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSize.s14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  placesItem.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getBoldStyle(color: ColorManager.white, fontSize: 20),
                ),
              ],
            ),
          )),
    );
  }
}
