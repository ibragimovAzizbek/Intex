import 'package:flutter/material.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/extensions/mq_extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: context.h * 0.4,
                width: double.infinity,
                color: ColorConst.primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                icon:
                                    Image.asset('assets/icons/languageru.png'),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Image.asset('assets/icons/menu.png'),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.h * 0.3,
                      width: context.w,
                      child: Image.asset(
                        'assets/images/bigImage.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Сезонная распродажа!",
                      style: TextStyle(
                        fontSize: FontConst.extraLargeFont,
                        color: ColorConst.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.h * 0.01),
              Text(
                "Бесплатная доставка бассейна",
                style: TextStyle(
                  fontSize: FontConst.meduimFont,
                  color: ColorConst.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.h * 0.01),
              Text(
                "Мы ценим наших клиентов, можете быть уверены в\nкачестве нашего сервиса!",
                style: TextStyle(
                  fontSize: 14,
                  color: ColorConst.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.h * 0.02),
              Container(
                alignment: Alignment.center,
                height: context.h * 0.045,
                width: context.w,
                color: ColorConst.primaryColor,
                child: Text(
                  "Каркасные бассейны",
                  style: TextStyle(
                    fontSize: FontConst.extraLargeFont,
                    color: ColorConst.white,
                  ),
                ),
              ),
              SizedBox(height: context.h * 0.02),
              Stack(
                children: [
                  Container(
                    height: context.h * 0.35,
                    width: context.w * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: ColorConst.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Металлический каркас",
                          style: TextStyle(
                            fontSize: FontConst.meduimFont,
                            color: ColorConst.primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: context.h * 0.14,
                          width: context.w * 0.5,
                          child: Image.asset(
                            'assets/images/bassen.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "1.600.000 сум",
                                  style: TextStyle(
                                    color: ColorConst.salePriceColor,
                                  ),
                                ),
                                Text(
                                  "1.512.000 сум",
                                  style: TextStyle(
                                    color: ColorConst.black,
                                  ),
                                )
                              ],
                            ),
                            InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                height: context.h * 0.035,
                                width: context.w * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  color: ColorConst.primaryAmber,
                                ),
                                child: Text(
                                  "Заказать",
                                  style: TextStyle(color: ColorConst.black),
                                ),
                              ),
                              onTap: () {
                                // ? ZAKAZ UCHUN
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 1,
                    left: 2,
                    child: Container(
                      alignment: Alignment.center,
                      height: context.h * 0.03,
                      width: context.w * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(17),
                        ),
                        color: ColorConst.recommendColor,
                      ),
                      child: Text(
                        'Рекомендуем',
                        style: TextStyle(color: ColorConst.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.h * 0.02),
              Container(
                height: context.h * 0.25,
                width: context.w,
                color: ColorConst.primaryColor,
                child: Column(
                  children: [
                    SizedBox(height: context.h * 0.01),
                    Text(
                      "Бесплатная доставка",
                      style: TextStyle(
                        fontSize: 25,
                        color: ColorConst.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: context.h * 0.02),
                    Text(
                      "Бесплатная доставка осуществляется в пределах города Ташкент (за пределами города доставка оплачивается отдельно)",
                      style: TextStyle(
                        color: ColorConst.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.h * 0.03),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: ColorConst.primaryAmber,
                      ),
                      child: Text(
                        "Оформить заказ",
                        style: TextStyle(
                          color: ColorConst.black,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {
                        // ? ELEVETED BUTTUN
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: context.h * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
