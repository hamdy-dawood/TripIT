import 'package:flutter/material.dart';

import '../../../../../constants/color_manager.dart';
import '../../../../../constants/styles_manager.dart';
import '../../../../../constants/values_manager.dart';
import '../model/location_model.dart';

class BuildLocationItem extends StatelessWidget {
  const BuildLocationItem({Key? key, required this.locationItem})
      : super(key: key);
  final LocationItem locationItem;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSize.s150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(
              locationItem.image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                locationItem.country,
                style: getBoldStyle(color: ColorManager.white, fontSize: 30),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                locationItem.city,
                style: getRegularStyle(color: ColorManager.white, fontSize: 30),
              ),
            ],
          ),
        ));
  }
}
