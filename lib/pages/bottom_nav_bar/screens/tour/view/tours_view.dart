import 'package:flutter/material.dart';

import '../../../../../constants/assets_manager.dart';
import '../../../../../constants/color_manager.dart';
import '../../../../../constants/constants.dart';
import '../../../../../constants/styles_manager.dart';
import '../../../../../constants/values_manager.dart';
import '../components/build_city_item.dart';
import '../components/build_places_item.dart';
import '../details/details_view.dart';
import '../model/places_response.dart';
import '../model/tour_model.dart';

class ToursView extends StatelessWidget {
  ToursView({Key? key, this.token}) : super(key: key);
  final String? token;
  Places? placesResponseModel;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // PlacesProvider placesProvider =
    //     Provider.of<PlacesProvider>(context, listen: false);
    // placesProvider.updateToken(token!);
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
            "TOURS",
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(AppSize.s18),
              child: Image.asset(
                IconsAssets.searchIcon,
              ),
            ),
          ],
        ),
        drawer: defaultDrawer(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSize.s14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Destination",
                      style: getBoldStyle(
                          color: ColorManager.mainColor, fontSize: 30),
                    ),
                    const SizedBox(
                      height: AppSize.s4,
                    ),
                    Text(
                      "10 Tours Available",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: AppSize.s14,
                    ),
                    SizedBox(
                      height: AppSize.s110,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => BuildCityItem(
                                cityItem: cityItem[index],
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: AppSize.s10,
                              ),
                          itemCount: cityItem.length),
                    ),
                    const SizedBox(
                      height: AppSize.s4,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Stack(alignment: Alignment.bottomCenter, children: [
                Container(
                  height: 270,
                  width: size.width,
                  color: ColorManager.white,
                ),
                Positioned(
                  top: 0,
                  child: SizedBox(
                    height: 180,
                    width: size.width,
                    child: Image.asset(
                      ImageAssets.offersImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  height: 160,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.s10),
                          child: Column(
                            children: [
                              Container(
                                height: AppSize.s140,
                                width: size.width * 0.8,
                                decoration: BoxDecoration(
                                  color: ColorManager.white,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorManager.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: const Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Holidays",
                                        style: getRegularStyle(
                                            color: ColorManager.grey,
                                            fontSize: 20),
                                      ),
                                      const SizedBox(
                                        height: AppSize.s4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Say yes to iconic snow Catamount,Hillsdale, New York!",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: getBoldStyle(
                                              color: ColorManager.black,
                                              fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: AppSize.s4,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              " Book your holiday package today",
                                              style: getRegularStyle(
                                                  color: ColorManager.grey,
                                                  fontSize: 15),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                fixedSize: const Size(50, 50),
                                                shape: const CircleBorder(),
                                                padding:
                                                    const EdgeInsets.all(20),
                                                primary: ColorManager.mainColor,
                                                onPrimary:
                                                    ColorManager.mainColor,
                                              ),
                                              child: const Image(
                                                image: AssetImage(
                                                    IconsAssets.arrowIcon),
                                                width: AppSize.s25,
                                              ),
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(AppSize.s14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discover New Places",
                      style: getBoldStyle(
                          color: ColorManager.mainColor, fontSize: 30),
                    ),
                    const SizedBox(
                      height: AppSize.s12,
                    ),
                    // Consumer<PlacesProvider>(
                    //   builder: (_, placesProvider, __) =>
                    //       placesProvider.isLoading
                    //           ? const Center(
                    //               child: CircularProgressIndicator(),
                    //             )
                    //           : ListView.builder(
                    //               physics: const BouncingScrollPhysics(),
                    //               scrollDirection: Axis.horizontal,
                    //               itemBuilder: (context, index) {
                    //                 InnerData? item = placesResponseModel!.data!.data![index];
                    //                 return Padding(
                    //                   padding: const EdgeInsets.all(8.0),
                    //                   child: Container(
                    //                     height: AppSize.s200,
                    //                     width: AppSize.s120,
                    //                     color: Colors.green,
                    //                     child: Image.network(item.image!),
                    //                   ),
                    //                 );
                    //               },
                    //               itemCount: placesResponseModel!.data!.data!.length,
                    //             ),
                    // ),
                    SizedBox(
                      height: 260,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => BuildPlacesItem(
                                placesItem: placesItem[index],
                                press: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlacesDetailsView(
                                              details: placesItem[index],
                                            )),
                                  );
                                },
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: AppSize.s12,
                              ),
                          itemCount: placesItem.length),
                    ),
                    const SizedBox(
                      height: AppSize.s50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
