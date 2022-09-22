import 'package:flutter/material.dart';

import '../../../../../constants/color_manager.dart';
import '../../../../../constants/styles_manager.dart';
import '../../../../../constants/values_manager.dart';
import '../model/tour_model.dart';

class BuildCityItem extends StatelessWidget {
  const BuildCityItem({
    Key? key,
    required this.cityItem,
  }) : super(key: key);

  final CityItem cityItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: AppSize.s130,
        width: AppSize.s90,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s12),
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              cityItem.image,
              height: AppSize.s60,
              width: AppSize.s90,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: AppSize.s8, left: AppSize.s8),
                child: Text(
                  cityItem.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: AppSize.s20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
