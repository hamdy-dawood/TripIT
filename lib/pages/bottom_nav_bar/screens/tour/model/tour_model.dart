import '../../../../../constants/assets_manager.dart';

class CityItem {
  final String image, name;

  CityItem({
    required this.image,
    required this.name,
  });
}

List<CityItem> cityItem = [
  CityItem(
    image: ImageAssets.parisImage,
    name: "Paris",
  ),
  CityItem(
    image: ImageAssets.agraImage,
    name: "India",
  ),
  CityItem(
    image: ImageAssets.newYorkImage,
    name: "New York",
  ),
  CityItem(
    image: ImageAssets.losAngelesImage,
    name: "Los Angeles",
  ),
];

class PlacesItem {
  final String mainImage, detailsImage, detailsBg, name;

  PlacesItem(
      {required this.mainImage,
      required this.name,
      required this.detailsBg,
      required this.detailsImage});
}

List<PlacesItem> placesItem = [
  PlacesItem(
    mainImage: ImageAssets.eiffelTowerImage,
    name: "Eiffel Tower",
    detailsBg: ImageAssets.detailsEiffelBgImage,
    detailsImage: ImageAssets.detailsEiffelImage,
  ),
  PlacesItem(
    mainImage: ImageAssets.parrotCayImage,
    name: "Parrot Cay",
    detailsBg: ImageAssets.detailsParrotBgImage,
    detailsImage: ImageAssets.detailsParrotImage,
  ),
  PlacesItem(
    mainImage: ImageAssets.notreDameImage,
    name: "Notre Dame ",
    detailsBg: ImageAssets.detailsNotreBgImage,
    detailsImage: ImageAssets.detailsNotreImage,
  ),
];
