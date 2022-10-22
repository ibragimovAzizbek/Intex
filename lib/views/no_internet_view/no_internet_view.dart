import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:lottie/lottie.dart';

class NoInternetView extends StatelessWidget {
  const NoInternetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: LottieBuilder.asset('assets/anim/noInternet.json'),
              ),
              Center(
                child: Text(
                  "no_internet".tr(),
                  style: TextStyle(
                    fontSize: FontConst.extraLargeFont,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
