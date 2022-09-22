import 'package:flutter/material.dart';

import '../../../constants/assets_manager.dart';
import '../../../constants/color_manager.dart';
import '../../../constants/routes_manager.dart';
import '../../../constants/styles_manager.dart';
import '../../../constants/values_manager.dart';
import '../model/model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingView> {
  final controller = OnBoardingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: AppSize.s30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p30),
            child: Image.asset(
              ImageAssets.mainLogo,
              height: 65,
              width: 160,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: size.height * 0.65,
            child: PageView(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                controller.currentPage = value;
                setState(() {});
              },
              children: List.generate(
                  controller.model.length,
                  (index) => SingleChildScrollView(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: AppSize.s12,
                              ),
                              Image.asset(
                                controller.model[controller.currentPage].image,
                                height: size.height * 0.45,
                                width: size.width,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(
                                height: AppSize.s30,
                              ),
                              Text(
                                controller.model[controller.currentPage].title,
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              const SizedBox(
                                height: AppSize.s20,
                              ),
                              Text(
                                controller
                                    .model[controller.currentPage].subtitle,
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          controller.currentPage == controller.model.length - 1
              ? TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    "let's go!",
                    textAlign: TextAlign.center,
                    style: getBoldStyle(
                        color: ColorManager.mainColor, fontSize: 20),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.loginRoute);
                          },
                          child: Text(
                            "Skip",
                            style: Theme.of(context).textTheme.headlineMedium,
                          )),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                            controller.model.length,
                            (index) => Padding(
                                  padding:
                                      const EdgeInsetsDirectional.only(end: 5),
                                  child: CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Color(
                                        index == controller.currentPage
                                            ? 0xffF04E59
                                            : 0xffF5C3C7),
                                  ),
                                )),
                      ),
                      TextButton(
                          onPressed: () {
                            if (controller.currentPage <
                                (controller.model.length - 1)) {
                              controller.currentPage++;
                              setState(() {});
                            }
                          },
                          child: Text(
                            "Next",
                            style: getRegularStyle(
                                color: ColorManager.mainColor, fontSize: 20),
                          )),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
