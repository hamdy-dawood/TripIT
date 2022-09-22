import '../../../../../constants/assets_manager.dart';

class LocationItem {
  final String image, country, city;

  LocationItem({
    required this.image,
    required this.country,
    required this.city,
  });
}

List<LocationItem> locationItem = [
  LocationItem(
    image: ImageAssets.usaImage,
    country: "USA",
    city: "New York",
  ),
  LocationItem(
    image: ImageAssets.franceImage,
    country: "France",
    city: "Paris",
  ),
  LocationItem(
    image: ImageAssets.indiaImage,
    country: "India",
    city: "Agra",
  ),
  LocationItem(
    image: ImageAssets.englandImage,
    country: "England",
    city: "London",
  ),
  LocationItem(
    image: ImageAssets.australiaImage,
    country: "Australia",
    city: "Sydney",
  ),
];
