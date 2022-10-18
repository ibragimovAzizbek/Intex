import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/cubit/home/home_cubit.dart';
import 'package:intex/cubit/home/home_state.dart';
import 'package:intex/extensions/mq_extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/widgets/classic_text.dart';
import '../../core/widgets/drawer.dart';
import '../../core/widgets/listtile_cutomer_about.dart';
import '../../core/widgets/product_and_ordering.dart';
import '../../core/widgets/text_form_filed.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      context.read<HomeCubit>().checkCallSupport(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: ColorConst.backgroundColor,
      drawer: const HomeDrawer(),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Error: ${state.msg}"),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is HomeInitial) {
            return SafeArea(
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Image.asset(
                                      'assets/icons/phone.png',
                                    ),
                                    onPressed: () {
                                      context
                                          .read<HomeCubit>()
                                          .callButtonOnTap();
                                    },
                                  ),
                                  IconButton(
                                    icon: Image.asset(
                                        'assets/icons/telegram.png'),
                                    onPressed: () {
                                      context.read<HomeCubit>().telegramOnTap();
                                    },
                                  ),
                                  IconButton(
                                    icon: Image.asset(
                                        'assets/icons/languageru.png'),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Image.asset('assets/icons/menu.png'),
                                    onPressed: () {
                                      _key.currentState!.openDrawer();
                                    },
                                  ),
                                ],
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
                    const Text(
                      "Мы ценим наших клиентов, можете быть уверены в\nкачестве нашего сервиса!",
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorConst.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: context.h * 0.02),
                    categoryContainer(context, "Каркасные бассейны"),
                    SizedBox(height: context.h * 0.02),
                    productAndOrdering(
                      context,
                      "Металлический каркас",
                      'assets/images/bassen.png',
                      1600000,
                      1512000,
                    ),
                    SizedBox(height: context.h * 0.02),
                    categoryContainer(context, "Надувные бассейны"),
                    SizedBox(height: context.h * 0.02),
                    productAndOrdering(
                      context,
                      "Металлический каркас",
                      'assets/images/bassen.png',
                      1600000,
                      1512000,
                    ),
                    SizedBox(height: context.h * 0.02),
                    Container(
                      height: context.h * 0.25,
                      width: context.w,
                      color: ColorConst.primaryColor,
                      child: Column(
                        children: [
                          SizedBox(height: context.h * 0.01),
                          const Text(
                            "Бесплатная доставка",
                            style: TextStyle(
                              fontSize: 25,
                              color: ColorConst.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: context.h * 0.02),
                          const Text(
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
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: context.h * 0.03),
                    categoryContainer(
                      context,
                      "Ценности наших клиентов",
                      color: ColorConst.customersColor,
                      textColor: ColorConst.primaryColor,
                    ),
                    SizedBox(height: context.h * 0.02),
                    aboutCutomerWorldView(
                      'assets/icons/exprience.png',
                      "Опыт",
                      "Профессионализм наших сотрудников",
                    ),
                    aboutCutomerWorldView(
                      'assets/icons/car.png',
                      "Доставка",
                      "Бесплатная доставка по городу",
                    ),
                    aboutCutomerWorldView(
                      'assets/icons/check.png',
                      "Качество",
                      "Прочные, качественные бассейны",
                    ),
                    SizedBox(height: context.h * 0.03),
                    categoryContainer(
                      context,
                      "Бассейны от intex в Ташкенте",
                      color: ColorConst.customersColor,
                      textColor: ColorConst.primaryColor,
                    ),
                    SizedBox(height: context.h * 0.02),
                    Padding(
                      padding: EdgeInsets.only(left: context.w * 0.07),
                      child: const SizedBox(
                        child: Text(
                          "Бассейны от intex - доступная по цене, качественная, надежная и экологически чистая продукция, которая предназначена для приятного отдыха всей семьи. Бассейн можно установить совершенно на любом участке и активно пользоваться им в летний период. Бассейн подарит вам яркие эмоции и спасет от жары в знойные летние дни.\n\nБассейны от intex отличаются обширным перечнем преимуществ, из которых можно выделить самые важные:",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: context.h * 0.02),
                    poolAdvantage(context, "Прочность"),
                    poolAdvantage(context, "Простота установки"),
                    poolAdvantage(context, "Красивые и ярки цвета"),
                    poolAdvantage(context, "Стильный дизайн"),
                    poolAdvantage(context, "Высокое качество"),
                    SizedBox(height: context.h * 0.03),
                    Container(
                      height: context.h * 0.5,
                      width: context.w,
                      color: ColorConst.primaryColor,
                      child: Column(
                        children: [
                          SizedBox(height: context.h * 0.02),
                          Text(
                            "Получить бесплатную\n       консультацию",
                            style: TextStyle(
                              fontSize: FontConst.largeFont,
                              color: ColorConst.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Form(
                            child: Column(
                              children: [
                                SizedBox(height: context.h * 0.015),
                                SizedBox(
                                  width: context.w * 0.9,
                                  height: context.h * 0.048,
                                  child: textFormFIled(
                                    "Имя",
                                    context.watch<HomeCubit>().nameController,
                                  ),
                                ),
                                SizedBox(height: context.h * 0.022),
                                SizedBox(
                                  width: context.w * 0.9,
                                  height: context.h * 0.048,
                                  child: textFormFIled(
                                    "Телефон",
                                    context
                                        .watch<HomeCubit>()
                                        .phoneNumberController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: context.h * 0.02),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: ColorConst.primaryAmber,
                            ),
                            child: Text(
                              "Хочу проконсультироваться",
                              style: TextStyle(
                                color: ColorConst.black,
                                fontSize: FontConst.meduimFont,
                              ),
                            ),
                            onPressed: () {}, // ? ONPRESSED
                          ),
                          SizedBox(height: context.h * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                          'assets/icons/subwayTime.png'),
                                      SizedBox(width: context.w * 0.02),
                                      classicText(
                                        "Рабочее время",
                                        color: ColorConst.white,
                                        size: FontConst.meduimFont,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: context.h * 0.01),
                                  classicText(
                                    "Будние дни: 10:00 - 22:00\nБез выходных", // ! Database'dan keladi
                                    color: ColorConst.white,
                                    size: FontConst.smallFont,
                                  ),
                                  SizedBox(height: context.h * 0.01),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: Image.asset(
                                          'assets/icons/phone2.png',
                                          fit: BoxFit.cover,
                                        ),
                                        onPressed: () {
                                          context
                                              .read<HomeCubit>()
                                              .callButtonOnTap();
                                        },
                                      ),
                                      IconButton(
                                        icon: Image.asset(
                                          'assets/icons/telegram2.png',
                                          fit: BoxFit.cover,
                                        ),
                                        onPressed: () {
                                          context
                                              .read<HomeCubit>()
                                              .telegramOnTap();
                                        },
                                      ),
                                      IconButton(
                                        icon: Image.asset(
                                          'assets/icons/instagram2.png',
                                          fit: BoxFit.cover,
                                          height: context.h * 0.3,
                                          width: context.w * 0.3,
                                        ),
                                        onPressed: () {
                                          context
                                              .read<HomeCubit>()
                                              .instagramOnTap();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  classicText(
                                    "Intex.uz",
                                    color: ColorConst.white,
                                  ),
                                  SizedBox(height: context.h * 0.01),
                                  classicText(
                                    "+998(99)535-53-33",
                                    color: ColorConst.white,
                                    size: FontConst.smallFont,
                                  ),
                                  SizedBox(height: context.h * 0.01),
                                  classicText(
                                    "Мустакиллик,\n59А 100000 Узбекистан,\nТашкент",
                                    color: ColorConst.white,
                                    size: FontConst.smallFont,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                "SERVERDA XATOLIK BOR, BALKI INTERNET BILAN ALOQA YO'Q.",
                style: TextStyle(
                  fontSize: FontConst.extraLargeFont,
                  color: ColorConst.blockColor,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Padding poolAdvantage(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.only(left: context.w * 0.07),
      child: Row(
        children: [
          Image.asset('assets/icons/checkCircle.png'),
          SizedBox(width: context.w * 0.02),
          classicText(text, size: FontConst.meduimFont),
        ],
      ),
    );
  }

  Container categoryContainer(
    BuildContext context,
    String text, {
    Color color = ColorConst.primaryColor,
    Color textColor = ColorConst.white,
  }) {
    return Container(
      alignment: Alignment.center,
      height: context.h * 0.045,
      width: context.w,
      color: color,
      child: Text(
        text,
        style: TextStyle(
          fontSize: FontConst.extraLargeFont,
          color: textColor,
        ),
      ),
    );
  }
}
