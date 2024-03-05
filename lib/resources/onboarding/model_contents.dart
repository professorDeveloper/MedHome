import 'package:medhome/utils/app_text.dart';

import '../../utils/app_images.dart';

class IntroductionContent {
  String image;
  String title;
  String description;

  IntroductionContent(
      {required this.image, required this.title, required this.description});
}

List<IntroductionContent> contents = [
  IntroductionContent(
      title: "O’zbekistonda birinchi bor",
      description: AppText.onboardText1,
      image: AppImages.onBoard1),
  IntroductionContent(
      title: 'Onlayn Ariza topshirish',
      description: AppText.onboardText2,
      image: AppImages.onBoard2),
  IntroductionContent(
      title: "Retsept tashkilotchisi",
      description: AppText.onboardText3,
      image: AppImages.onBoard3),
  IntroductionContent(
      title: "24/7 Xizmat ko’rsatish",
      description: AppText.onboardText4,
      image: AppImages.onBoard4),
];
