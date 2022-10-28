import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/extensions/mq_extension.dart';

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
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                classicText("INTEX-MARKET.UZ",
                    color: ColorConst.accentColor,
                    size: FontConst.largeFont + 2),
                SizedBox(width: context.w * 0.3),
                topIconButton(
                  context,
                  'assets/icons/call.png',
                  () {
                    context.read<HomeCubit>().callButtonOnTap();
                  },
                ),
              ],
            ),
            const Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                topIconButton(
                  context,
                  'assets/icons/menudrawer.png',
                  () {
                    function();
                  },
                ),
                SizedBox(
                  width: context.h * 0.31,
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
                Container(
                  margin: EdgeInsets.only(right: context.w * 0.017),
                  height: context.h * 0.07,
                  width: context.w * 0.135,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorConst.white,
                  ),
                  child: Image.asset('assets/icons/bag.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(homeContext.h * 0.17);
}
