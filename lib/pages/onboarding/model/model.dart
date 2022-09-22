import '../../../constants/assets_manager.dart';

class Model {
  String image, title, subtitle;

  Model({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

class OnBoardingController {
  int currentPage = 0;
  List<Model> model = [
    Model(
        title: 'Plan Your Trip',
        image: ImageAssets.onboardingLogo1,
        subtitle:
            'Plan your trip, choose your destination.\nPick the best place for your holiday.'),
    Model(
        title: 'Select The Date',
        image: ImageAssets.onboardingLogo2,
        subtitle:
            'Select the day, book your ticket. We give\nyou the best price. We guarantied!'),
    Model(
        title: 'Enjoy Your Trip',
        image: ImageAssets.onboardingLogo3,
        subtitle:
            'Enjoy your holiday! don\'t forget to take\na photo and share to the world'),
  ];
}
