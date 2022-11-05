import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/core/widgets/classic_text.dart';
import 'package:intex/cubit/home/home_cubit.dart';

import '../constants/font_const.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key});

  List<String> countryCodes = ["Ru", "Uz", "Us"];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConst.white,
      child: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.035),
                child: classicText(
                  "INTEX-MARKET.UZ",
                  color: ColorConst.accentColor,
                  size: FontConst.extraLargeFont,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03),
                iconColor: ColorConst.accentColor,
                leading: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.09,
                  child: Image.asset(
                    'assets/icons/flag${context.locale.toString() == "uz_UZ" ? "Uz" : context.locale.toString() == "ru_RU" ? "Ru" : "Us"}.png',
                  ),
                ),
                title: classicText(
                  context.locale.toString() == "uz_UZ"
                      ? "Uz"
                      : context.locale.toString() == "ru_RU"
                          ? "Ru"
                          : "Us",
                  color: ColorConst.textColor,
                  size: FontConst.meduimFont - 2,
                ),
                children: [
                  remainingLanguages(
                    context,
                    context.locale.toString() == "uz_UZ"
                        ? "Ru"
                        : context.locale.toString() == "ru_RU"
                            ? "Uz"
                            : "Uz",
                  ),
                  remainingLanguages(
                    context,
                    context.locale.toString() == "uz_UZ"
                        ? "Us"
                        : context.locale.toString() == "ru_RU"
                            ? "Us"
                            : "Ru",
                  ),
                ],
              ),
              ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.075),
                expandedAlignment: Alignment.centerLeft,
                iconColor: ColorConst.accentColor,
                title: classicText("Категории",
                    size: FontConst.meduimFont, color: ColorConst.textColor),
                children: [
                  TextButtonForUrls(
                    text: "Надувные бассейны",
                    function: () {},
                    size: FontConst.meduimFont - 2,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  TextButtonForUrls(
                    text: "Каркасные бассейны",
                    function: () {},
                    size: FontConst.meduimFont - 2,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  // TextButtonForUrls(
                  //     text: "Все чистки бассейна", function: () {}),
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  TextButtonForUrls(
                    text: "Аксессуары для бассейна",
                    function: () {},
                    size: FontConst.meduimFont - 2,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ],
              ),
              TextButtonForUrls(
                text: "Популярное",
                function: () {
                  Navigator.pop(context);
                  context.read<HomeCubit>().scrollWidgets(600.7);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextButtonForUrls(
                text: "Новинки",
                function: () {
                  Navigator.pop(context);
                  context.read<HomeCubit>().scrollWidgets(1603.5);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextButtonForUrls(
                text: "На скидке",
                function: () {
                  Navigator.pop(context);
                  context.read<HomeCubit>().scrollWidgets(3764.8);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextButtonForUrls(
                text: "О Продукт",
                function: () {
                  Navigator.pop(context);
                  context.read<HomeCubit>().scrollWidgets(0.0);
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextButtonForUrls(
                  text: "Почему мы?",
                  function: () {
                    Navigator.pop(context);
                    context.read<HomeCubit>().scrollWidgets(2960);
                  }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextButtonForUrls(
                text: "Контакты",
                function: () {
                  Navigator.pop(context);
                  context.read<HomeCubit>().callButtonOnTap();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text categoryText(String text) {
    return classicText(
      text,
      color: ColorConst.textColor,
      size: FontConst.meduimFont - 2,
      fontWeight: FontWeight.w600,
    );
  }

  ElevatedButton remainingLanguages(BuildContext context, String countryCode) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        alignment: Alignment.centerLeft,
        padding:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.45),
        shadowColor: ColorConst.white,
      ),
      icon: SizedBox(
        width: MediaQuery.of(context).size.width * 0.09,
        child: Image.asset(
          'assets/icons/flag$countryCode.png',
        ),
      ),
      label: classicText(
        countryCode,
        color: ColorConst.textColor,
        size: FontConst.meduimFont - 2,
      ),
      onPressed: () async {
        await context.read<HomeCubit>().changeLanguage(context, countryCode);
      },
    );
  }
}

class TextButtonForUrls extends StatelessWidget {
  String text;
  Function function;
  double? sizeText;
  TextButtonForUrls({
    Key? key,
    double size = 16,
    required this.text,
    required this.function,
  }) : super(key: key) {
    sizeText = size;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.035),
      child: InkWell(
        child: classicText(text, color: ColorConst.textColor, size: sizeText!),
        onTap: () {
          function();
        },
      ),
    );
  }
}
