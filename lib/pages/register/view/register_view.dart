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
import '../model/register_response.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  bool isLoading = false;
  bool isChecked = false;

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
                                "Sign Up",
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                            defaultFormField(
                              controller: nameController,
                              textInputType: TextInputType.text,
                              hintText: "Name",
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Valid Name";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: AppSize.s8,
                            ),
                            defaultFormField(
                              controller: emailController,
                              textInputType: TextInputType.emailAddress,
                              hintText: "Email",
                              validate: (value) {
                                if (value == null || value.isEmpty) {
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
                            const SizedBox(
                              height: AppSize.s8,
                            ),
                            defaultFormField(
                              textInputType: TextInputType.phone,
                              hintText: "Phone Number",
                              validate: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Valid Phone";
                                }
                                return null;
                              },
                            ),
                            CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              activeColor: ColorManager.mainColor,
                              title: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'I agree the ',
                                        style: getRegularStyle(
                                            color: ColorManager.black,
                                            fontSize: AppSize.s14)),
                                    TextSpan(
                                      text: 'Terms & Conditions',
                                      style: getRegularStyle(
                                          color: ColorManager.mainColor,
                                          fontSize: AppSize.s14),
                                    ),
                                  ],
                                ),
                              ),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: ColorManager.mainColor),
                                  )
                                : defaultButton(
                                    press: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        print(nameController.text.toString());
                                        print(emailController.text.toString());
                                        print(
                                            passwordController.text.toString());
                                        signUp();
                                      }
                                    },
                                    text: "Sign Up",
                                  ),
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
                height: AppSize.s20,
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
                    "Already have an account?",
                    style: getRegularStyle(
                        color: ColorManager.white, fontSize: AppSize.s18),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.loginRoute);
                    },
                    child: Text(
                      "Login",
                      style: getBoldStyle(
                          color: ColorManager.white, fontSize: AppSize.s22),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    setState(() {
      isLoading = true;
    });

    Response registerResponse =
        await post(Uri.parse("http://alcaptin.com/api/register"), body: {
      "email": emailController.text,
      "password": passwordController.text,
      "first_name": nameController.text,
      "last_name": "khalid",
      "age": "21",
      "gender": "male",
    });

    dynamic convertedJson = jsonDecode(registerResponse.body);

    if (registerResponse.statusCode == 200) {
      RegisterResponse user = RegisterResponse.fromJson(convertedJson);
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
