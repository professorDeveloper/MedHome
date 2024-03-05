import 'package:medhome/utils/app_images.dart';

class HomeContents {
  String image;
  String title;

  HomeContents.HomeContent({
    required this.image,
    required this.title,
  });
}

List<HomeContents> homeContents = [
  HomeContents.HomeContent(title: "Tibbiyot xodimlari", image: AppImages.Grid1),
  HomeContents.HomeContent(title: 'Qarovchi', image: AppImages.Grid2),
  HomeContents.HomeContent(title: "Fizio terapiya", image: AppImages.Grid3),
  HomeContents.HomeContent(title: "Qon Tahlili", image: AppImages.Grid2),
];
