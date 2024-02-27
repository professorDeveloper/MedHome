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
      description:
          "Biz sizga uydan chiqmagan holda davolanishingizga yordam beramiz",
      image: 'assets/images/img_1.png'),
  IntroductionContent(
      title: 'Onlayn Ariza topshirish',
      description:
          "Shifokoringizni, qulay vaqtni tanlang va ariza qoldiring. Ariza haqida foydali bildirishnomalarni qabul qiling",
      image: 'assets/images/img_2.png'),
  IntroductionContent(
      title: "Retsept tashkilotchisi",
      description:
          "Dori-darmonlarni boshqarishni nazorat qiling. Bizga barcha retseptlarni, jumladan, dori nomlari, dozalari va toʻldirish sanalarini kuzatishda yordam beramiz.",
      image: 'assets/images/img_3.png'),
  IntroductionContent(
      title: "24/7 Xizmat ko’rsatish",
      description:
          "Dori-darmonlarni boshqarishni nazorat qiling. Bizga barcha retseptlarni, jumladan, dori nomlari, dozalari va toʻldirish sanalarini kuzatishda yordam beramiz.",
      image: 'assets/images/img_4.png'),
];
