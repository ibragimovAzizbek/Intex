import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/core/widgets/classic_text.dart';
import 'package:intex/cubit/home/home_cubit.dart';
import 'package:intex/extensions/mq_extension.dart';

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
          padding: EdgeInsets.only(left: context.w * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.h * 0.01),
              Padding(
                padding: EdgeInsets.only(left: context.w * 0.035),
                child: classicText(
                  "INTEX-MARKET.UZ",
                  color: ColorConst.accentColor,
                  size: FontConst.extraLargeFont,
                ),
              ),
              SizedBox(height: context.h * 0.02),
              ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.only(left: context.w * 0.03),
                iconColor: ColorConst.accentColor,
                leading: SizedBox(
                  width: context.w * 0.09,
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
                childrenPadding: EdgeInsets.only(left: context.w * 0.075),
                expandedAlignment: Alignment.centerLeft,
                iconColor: ColorConst.accentColor,
                title: classicText("Категории",
                    size: FontConst.meduimFont, color: ColorConst.textColor),
                children: [
                  categoryText("Надувные бассейны"),
                  SizedBox(height: context.h * 0.02),
                  categoryText("Каркасные бассейны"),
                  SizedBox(height: context.h * 0.02),
                  categoryText("Все чистки бассейна"),
                  SizedBox(height: context.h * 0.02),
                  categoryText("Аксессуары для бассейна"),
                  SizedBox(height: context.h * 0.01),
                ],
              ),
              TextButtonForUrls(text: "Популярное", function: () {}),
              SizedBox(height: context.h * 0.02),
              TextButtonForUrls(text: "Новинки", function: () {}),
              SizedBox(height: context.h * 0.02),
              TextButtonForUrls(text: "На скидке", function: () {}),
              SizedBox(height: context.h * 0.02),
              TextButtonForUrls(text: "О Продукт", function: () {}),
              SizedBox(height: context.h * 0.02),
              TextButtonForUrls(text: "Почему мы?", function: () {}),
              SizedBox(height: context.h * 0.02),
              TextButtonForUrls(text: "Контакты", function: () {}),
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
        padding: EdgeInsets.only(right: context.w * 0.45),
        shadowColor: ColorConst.white,
      ),
      icon: SizedBox(
        width: context.w * 0.09,
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

  TextButtonForUrls({Key? key, required this.text, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.w * 0.035),
      child: InkWell(
        child: classicText(text,
            color: ColorConst.textColor, size: FontConst.meduimFont),
        onTap: () {
          function();
        },
      ),
    );
  }
}
