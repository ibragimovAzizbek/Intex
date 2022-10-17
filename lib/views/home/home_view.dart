import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/extensions/mq_extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: ColorConst.primaryColor,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       Text(
      //         "INTEX-MARKET.UZ",
      //         style: TextStyle(
      //           color: ColorConst.white,
      //           fontSize: FontConst.largeFont,
      //         ),
      //       ),
      //       Row(
      //         children: [
      //           IconButton(
      //             icon: Image.asset('assets/icons/phone.png'),
      //             onPressed: () {},
      //           ),
      //           IconButton(
      //             icon: Image.asset('assets/icons/telegram.png'),
      //             onPressed: () {},
      //           ),
      //           IconButton(
      //             icon: Image.asset('assets/icons/languageru.png'),
      //             onPressed: () {},
      //           ),
      //           IconButton(
      //             icon: Image.asset('assets/icons/menu.png'),
      //             onPressed: () {},
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: context.h * 0.4,
              width: double.infinity,
              color: ColorConst.primaryColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "INTEX-MARKET.UZ",
                        style: TextStyle(
                          color: ColorConst.white,
                          fontSize: FontConst.largeFont,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Image.asset('assets/icons/phone.png',
                                  fit: BoxFit.cover),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Image.asset('assets/icons/telegram.png'),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Image.asset('assets/icons/languageru.png'),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Image.asset('assets/icons/menu.png'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
