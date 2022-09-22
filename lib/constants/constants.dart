import 'package:flutter/material.dart';
import 'package:trip_it_project/constants/styles_manager.dart';
import 'package:trip_it_project/constants/values_manager.dart';

import '../../../constants/color_manager.dart';
import 'assets_manager.dart';

// default button in app
Widget defaultButton({
  required String text,
  double? fontSize = 16.0,
  FontWeight? fontWeight = FontWeight.normal,
  VoidCallback? press,
}) =>
    Stack(
      children: [
        ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
            primary: ColorManager.mainColor,
            elevation: 0.0,
            fixedSize: const Size(307, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28.0),
            ),
          ),
          child: Text(
            text,
            style: getRegularStyle(
                color: ColorManager.white, fontSize: AppSize.s22),
          ),
        ),
        Positioned(
          right: 0,
          child: ElevatedButton(
            onPressed: press,
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(55, 55),
              shape: const CircleBorder(),
              elevation: 0.0,
              // padding: const EdgeInsets.all(20),
              primary: ColorManager.lightMain,
              onPrimary: ColorManager.lightMain,
            ),
            child: const Image(
              image: AssetImage(IconsAssets.arrowIcon),
              width: AppSize.s25,
            ),
          ),
        ),
      ],
    );

Widget defaultFormField({
  required String hintText,
  required TextInputType textInputType,
  bool obscureTextForm = false,
  TextEditingController? controller,
  FormFieldValidator? validate,
}) =>
    TextFormField(
      controller: controller,
      validator: validate,
      onFieldSubmitted: (value) {
        print(value);
      },
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.mainColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.grey),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error),
        ),
        disabledBorder: InputBorder.none,
        hintText: hintText,
      ),
      style: getRegularStyle(color: ColorManager.black, fontSize: AppSize.s16),
      keyboardType: textInputType,
      obscureText: obscureTextForm,
    );

Widget defaultDrawer() => Drawer(
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: AppSize.s40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSize.s12),
                  child: Image.asset(
                    IconsAssets.cancelIcon,
                    height: AppSize.s16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Image.asset(
              ImageAssets.userDrawerImage,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: AppSize.s14,
            ),
            Text(
              "Hamdy Dawood",
              textAlign: TextAlign.center,
              style: getBoldStyle(
                  color: ColorManager.black, fontSize: AppSize.s25),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              "hamdykhalid12345@gmail.com",
              textAlign: TextAlign.center,
              style: getRegularStyle(
                  color: ColorManager.grey, fontSize: AppSize.s20),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            ListTile(
              leading: CircleAvatar(
                radius: AppSize.s22,
                backgroundColor: const Color(0xffF33738),
                child: Image.asset(
                  IconsAssets.bellIcon,
                  height: AppSize.s20,
                ),
              ),
              title: Text(
                "Notifications",
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: AppSize.s22),
              ),
              trailing: Image.asset(
                IconsAssets.iosArrowIcon,
                height: AppSize.s16,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: AppSize.s22,
                backgroundColor: const Color(0xff58C7FB),
                child: Image.asset(
                  IconsAssets.toursIcon,
                  height: AppSize.s20,
                ),
              ),
              title: Text(
                "Tours",
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: AppSize.s22),
              ),
              trailing: Image.asset(
                IconsAssets.iosArrowIcon,
                height: AppSize.s16,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: AppSize.s22,
                backgroundColor: const Color(0xffDC58FB),
                child: Image.asset(
                  IconsAssets.locationIcon,
                  height: AppSize.s20,
                ),
              ),
              title: Text(
                "Location",
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: AppSize.s22),
              ),
              trailing: Image.asset(
                IconsAssets.iosArrowIcon,
                height: AppSize.s16,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: AppSize.s22,
                backgroundColor: const Color(0xff5252D8),
                child: Image.asset(
                  IconsAssets.languageIcon,
                  height: AppSize.s20,
                ),
              ),
              title: Text(
                "Language",
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: AppSize.s22),
              ),
              trailing: Image.asset(
                IconsAssets.iosArrowIcon,
                height: AppSize.s16,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: AppSize.s22,
                backgroundColor: const Color(0xff3075F9),
                child: Image.asset(
                  IconsAssets.inviteIcon,
                  height: AppSize.s20,
                ),
              ),
              title: Text(
                "Invite Friends",
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: AppSize.s22),
              ),
              trailing: Image.asset(
                IconsAssets.iosArrowIcon,
                height: AppSize.s16,
              ),
            ),
            Divider(
              color: ColorManager.grey,
              thickness: 1,
            ),
            ListTile(
              leading: CircleAvatar(
                radius: AppSize.s22,
                backgroundColor: const Color(0xffF9CA1C),
                child: Image.asset(
                  IconsAssets.helpIcon,
                  height: AppSize.s20,
                ),
              ),
              title: Text(
                "Help Center",
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: AppSize.s22),
              ),
              trailing: Image.asset(
                IconsAssets.iosArrowIcon,
                height: AppSize.s16,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: AppSize.s22,
                backgroundColor: const Color(0xff4AD76D),
                child: Image.asset(
                  IconsAssets.settingIcon,
                  height: AppSize.s20,
                ),
              ),
              title: Text(
                "Setting",
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: AppSize.s22),
              ),
              trailing: Image.asset(
                IconsAssets.iosArrowIcon,
                height: AppSize.s16,
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: AppSize.s22,
                backgroundColor: const Color(0xff9A9A9A),
                child: Image.asset(
                  IconsAssets.logoutIcon,
                  height: AppSize.s20,
                ),
              ),
              title: Text(
                "Log Out",
                style: getBoldStyle(
                    color: ColorManager.black, fontSize: AppSize.s22),
              ),
              trailing: Image.asset(
                IconsAssets.iosArrowIcon,
                height: AppSize.s16,
              ),
            ),
            const SizedBox(
              height: AppSize.s30,
            )
          ],
        ),
      ),
    );
