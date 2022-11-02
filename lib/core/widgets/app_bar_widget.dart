import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/constants/font_const.dart';

import '../../cubit/home/home_cubit.dart';
import '../components/top_icon.dart';
import '../constants/color_const.dart';
import 'classic_text.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  BuildContext homeContext;
  Function function;
  HomeAppBar({super.key, required this.homeContext, required this.function});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: ColorConst.baseColor,
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.015,
                  right: MediaQuery.of(context).size.width * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  classicText("INTEX-MARKET.UZ",
                      color: ColorConst.accentColor,
                      size: FontConst.largeFont + 2),
                  topIconButton(
                    context,
                    'assets/icons/call.png',
                    () {
                      context.read<HomeCubit>().callButtonOnTap();
                    },
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.068,
                  width: MediaQuery.of(context).size.width * 0.13,
                  child: topIconButton(
                    context,
                    'assets/icons/menudrawer.png',
                    () {
                      function();
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: TextField(
                    cursorColor: ColorConst.accentColor,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorConst.white,
                      prefixIcon: Image.asset('assets/icons/meduimSearch.png'),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.17,
                  child: topIconButton(
                    context,
                    'assets/icons/cart.png',
                    () {},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(MediaQuery.of(homeContext).size.height * 0.17);
}
