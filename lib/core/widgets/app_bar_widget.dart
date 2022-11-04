import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/func/show_diolog_congratulations.dart';

import '../../cubit/home/home_cubit.dart';
import '../components/eleveted_button.dart';
import '../components/top_icon.dart';
import '../constants/color_const.dart';
import '../constants/font_const.dart';
import 'classic_text.dart';

class HomeAppBarOne extends StatelessWidget {
  const HomeAppBarOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorConst.baseBackground,
      pinned: false,
      snap: false,
      floating: false,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: classicText("INTEX-MARKET.UZ",
          color: ColorConst.accentColor, size: FontConst.largeFont + 2),
      actions: [
        topIconButton(
          context,
          'assets/icons/call.png',
          () {
            context.read<HomeCubit>().callButtonOnTap();
          },
        ),
      ],
    );
  }
}

class HomeAppBarTwo extends StatelessWidget {
  BuildContext homeContext;
  Function function;
  HomeAppBarTwo({super.key, required this.homeContext, required this.function});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorConst.baseBackground,
      pinned: true,
      snap: false,
      floating: false,
      elevation: 0,
      automaticallyImplyLeading: false,
      expandedHeight: MediaQuery.of(context).size.height * 0.1,
      flexibleSpace: Row(
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
              () {
                congratulationsDiolog(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
