import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../constants/assets_manager.dart';
import '../../../constants/color_manager.dart';
import '../../../constants/constants.dart';
import '../../../constants/routes_manager.dart';
import '../../../constants/styles_manager.dart';
import '../../../constants/values_manager.dart';
import '../../bottom_nav_bar/bottom_bar_view.dart';
import '../model/login_response.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ColorManager.fristColor,
              ColorManager.secondColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppSize.s20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p40),
                child: Image.asset(
                  ImageAssets.whiteLogo,
                  height: 65,
                  width: 160,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSize.s20),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.s20),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSize.s18),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: AppPadding.p14),
                              child: Text(
                                "Sign In",
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                            defaultFormField(
                              controller: emailController,
                              textInputType: TextInputType.emailAddress,
                              hintText: "Email",
                              validate: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    !value.contains("@")) {
                                  return "Enter Valid Email";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: AppSize.s8,
                            ),
                            defaultFormField(
                              controller: passwordController,
                              textInputType: TextInputType.text,
                              hintText: "Password",
                              obscureTextForm: true,
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Valid Password";
                                }
                                return null;
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot password?",
                                    textAlign: TextAlign.end,
                                    style: getRegularStyle(
                                        color: ColorManager.mainColor,
                                        fontSize: AppSize.s16),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: AppSize.s8,
                            ),
                            isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: ColorManager.mainColor),
                                  )
                                : defaultButton(
                                    text: "Sign in",
                                    press: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        print(emailController.text.toString());
                                        print(
                                            passwordController.text.toString());
                                        login();
                                      }
                                    }),
                            const SizedBox(
                              height: AppPadding.p14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    IconsAssets.facebookLogo,
                    height: AppSize.s50,
                    width: AppSize.s50,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    width: AppSize.s18,
                  ),
                  Image.asset(
                    IconsAssets.googleLogo,
                    height: AppSize.s50,
                    width: AppSize.s50,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: getRegularStyle(
                        color: ColorManager.white, fontSize: AppSize.s18),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.registerRoute);
                    },
                    child: Text(
                      "Sign up",
                      style: getBoldStyle(
                          color: ColorManager.white, fontSize: AppSize.s22),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future login() async {
    setState(() {
      isLoading = true;
    });

    Response loginResponse =
        await post(Uri.parse("http://alcaptin.com/api/login"), body: {
      "email": emailController.text,
      "password": passwordController.text,
    });

    dynamic convertedJson = jsonDecode(loginResponse.body);

    if (loginResponse.statusCode == 200) {
      LoginResponse user = LoginResponse.fromJson(convertedJson);
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const BottomBarView(
              // token: user.data!.accessToken,
              ),
        ),
      );
    } else {
      print(convertedJson["message"]);
    }

    setState(() {
      isLoading = false;
    });
  }
}
