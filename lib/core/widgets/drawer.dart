import 'package:flutter/material.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/core/widgets/classic_text.dart';
import 'package:intex/extensions/mq_extension.dart';

import '../constants/font_const.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConst.primaryColor,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: context.h * 0.01),
            classicText(
              "INTEX-MARKET.UZ",
              color: ColorConst.white,
              size: FontConst.extraLargeFont,
            ),
            SizedBox(height: context.h * 0.11),
            drawerCategory(context, "Каркасные бассейны", "/framePools"), // !
            SizedBox(height: context.h * 0.03),
            drawerCategory(
              context,
              "Надувные бассейны",
              "/inflatablePools",
            ),
            SizedBox(height: context.h * 0.27),
            socialNetworkContainer(
              context,
              'assets/icons/phoneDrawer.png',
              "Позвонить", // ! URL LOUNCHER ISHLATIB BOSHQA APPGA O'TADIGAN QILISH KERAK
            ),
            SizedBox(height: context.h * 0.03),
            socialNetworkContainer(
              context,
              'assets/icons/telegramDrawer.png',
              "Телеграм", // ! URL LOUNCHER ISHLATIB BOSHQA APPGA O'TADIGAN QILISH KERAK
              color: ColorConst.white,
              colorText: ColorConst.primaryColor,
            ),
            SizedBox(height: context.h * 0.03),
            socialNetworkContainer(
              context,
              'assets/icons/instagramDrawer.png',
              "Инстаграм", // ! URL LOUNCHER ISHLATIB BOSHQA APPGA O'TADIGAN QILISH KERAK
              color: ColorConst.white,
              colorText: ColorConst.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  InkWell socialNetworkContainer(
    BuildContext context,
    String iconPath,
    String titleName, {
    Color color = ColorConst.recommendColor,
    Color colorText = ColorConst.white,
  }) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        height: context.h * 0.07,
        width: context.w * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(iconPath),
            SizedBox(width: context.w * 0.04),
            classicText(
              titleName,
              color: colorText,
            ),
          ],
        ),
      ),
      onTap: () {
        // ? social network
        // ! URL LOUNCHER ISHLATIB BOSHQA APPGA O'TADIGAN QILISH KERAK
      },
    );
  }

  InkWell drawerCategory(
      BuildContext context, String titleName, String pathPage) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        height: context.h * 0.07,
        width: context.w * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConst.white,
        ),
        child: classicText(
          titleName,
          color: ColorConst.primaryColor,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, pathPage);
      },
    );
  }
}
