import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/core/widgets/classic_text.dart';
import 'package:intex/cubit/home/home_cubit.dart';
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
            drawerCategory(
              context,
              "frame_pools".tr(),
              "/framePools", // ! PAGE"NI HAL QIL, YANGI PAGE YOKI UNIVERSIAL
            ),
            SizedBox(height: context.h * 0.03),
            drawerCategory(
              context,
              "inflatable_pools".tr(),
              "/inflatablePools", // ! PAGE"NI HAL QIL, YANGI PAGE YOKI UNIVERSIAL
            ),
            SizedBox(height: context.h * 0.27),

            // ? PHONE CALL
            socialNetworkContainer(
              context,
              'assets/icons/phoneDrawer.png',
              "call".tr(),
              () {
                context.read<HomeCubit>().callButtonOnTap();
              },
            ),
            SizedBox(height: context.h * 0.03),

            // ? TELEGRAM LINK
            socialNetworkContainer(
              context,
              'assets/icons/telegramDrawer.png',
              "telegram".tr(),
              color: ColorConst.white,
              colorText: ColorConst.primaryColor,
              () {
                context.read<HomeCubit>().telegramOnTap();
              },
            ),
            SizedBox(height: context.h * 0.03),

            // ? INSTAGRAM LINK
            socialNetworkContainer(
              context,
              'assets/icons/instagramDrawer.png',
              "instagram".tr(), // ! URL LOUNCHER ISHLATIB BOSHQA APPGA O'TADIGAN QILISH KERAK
              color: ColorConst.white,
              colorText: ColorConst.primaryColor,
              () {
                context.read<HomeCubit>().instagramOnTap();
              },
            ),
          ],
        ),
      ),
    );
  }

  InkWell socialNetworkContainer(
    BuildContext context,
    String iconPath,
    String titleName,
    Function function, {
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
        function();
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
        // Navigator.pushNamed(context, pathPage);
      },
    );
  }
}
