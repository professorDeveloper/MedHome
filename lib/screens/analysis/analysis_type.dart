import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import 'widgets/analysis_item.dart';

class AnalysisType extends StatefulWidget {
  const AnalysisType({super.key});

  @override
  State<AnalysisType> createState() => _AnalysisTypeState();
}

List<String> _analysis = [
  'Анализ SwissLab',
  'экспресс-тест антиген на COVID-19',
  'Вирус нейтрализующие антитела к Covid-19',
  'Антинуклярные антителла (ANA)',
  'Эозинофильный кационный белок',
  'Лактат (молочная кислота)',
  'Антителла к гепатиту Д',
  'АФС (Антифосфолипидный синдром) IgG',
  'АФС (Антифосфолипидный синдром) IgM',
  'Инсулино-подобний фактор роста 1 (сомато-медин) (ИФР-1)',
  'Рилизинг-Гармон роста (гипоталамус)',
  'Дыхательный тест с меченым углеродом',
  'Экспресс-тест на выявление антител SARS-COV-2-IgG/IgM',
  'Адреналин',
  'Норалреналин',
  'Антитела класса IgG к ClARS-COV-2',
  'Антитела класса IgM к C”SARS-COV-2',
];

class _AnalysisTypeState extends State<AnalysisType> {
  List<String> selectedItems = [];
  void selectType(String item) {
    if (!(selectedItems.contains(item))) {
      setState(() {
        selectedItems.add(item);
      });
    } else {
      selectedItems.remove(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray1,
      appBar: _appBar(contxt: context),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Qon tahlillari',
                      style: GoogleFonts.rubik(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'лаборотория',
                    style: GoogleFonts.rubik(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 1,
                          )
                        ],
                      ),
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return AnalysisItem(
                            isVisible: _analysis.length - 1 != index,
                            title: _analysis[index],
                            selectType: selectType,
                            selectedItems: selectedItems,
                          );
                        },
                        itemCount: _analysis.length,
                        shrinkWrap: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 22, left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text.rich(
                      TextSpan(
                          text: 'Narxi: ',
                          style: GoogleFonts.rubik(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: '200 000 so\'m',
                              style: GoogleFonts.rubik(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ]),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: Colors.white,
                      elevation: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Tasdiqlash',
                      style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: AppColor.red1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

AppBar _appBar({required BuildContext contxt}) => AppBar(
      elevation: 0,
      scrolledUnderElevation: 1,
      toolbarHeight: 60,
      backgroundColor: Colors.grey.shade200,
      titleSpacing: 0,
      surfaceTintColor: Colors.transparent,
      title: Container(
        width: double.infinity,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(contxt).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 36,
                    color: AppColor.textColor,
                  )),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 49,
                      height: 49,
                      child: Image.asset(
                        AppImages.app,
                      )),
                  Text(
                    "Med Home".toString(),
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 3),
                child: IconButton(
                    onPressed: (() => {}),
                    icon: Icon(
                      CupertinoIcons.bell_fill,
                      size: 25,
                      color: AppColor.red4,
                    )),
              ),
              SizedBox(
                width: 15,
              ),
            ]),
      ),
      automaticallyImplyLeading: false,
    );
