import 'dart:collection';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/base/base_view.dart';
import 'package:intex/core/components/eleveted_button.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/core/widgets/app_bar.dart';
import 'package:intex/core/widgets/product_and_ordering.dart';
import 'package:intex/core/widgets/text_form_filed.dart';
import 'package:intex/core/widgets/why_chouse_us_base_widget.dart';
import 'package:intex/cubit/home/home_cubit.dart';
import 'package:intex/cubit/home/home_state.dart';
import 'package:intex/data/model/about_company_model.dart';
import 'package:intex/extensions/mq_extension.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/widgets/classic_text.dart';
import '../../core/widgets/drawer.dart';
import '../../core/widgets/text_button_for_useful_links.dart';
import '../../data/services/beckend/category_service.dart';
import '../../data/services/beckend/products_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

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
      backgroundColor: ColorConst.white,
      drawer: const HomeDrawer(),
      appBar: HomeAppBar(
        homeContext: context,
        function: () {
          _key.currentState!.openDrawer();
        },
      ),
      body: BaseView(
        viewModel: HomeView,
        onPageBuilder: (context, value) {
          return BlocConsumer<HomeCubit, HomeState>(
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
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else if (state is HomeInitial) {
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: context.h * 0.024),
                        Center(
                          child: Container(
                            height: context.h * 0.55,
                            width: context.w * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorConst.containerBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: context.w * 0.03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: context.w * 0.8,
                                    child: classicText(
                                        "Бассейны от intex в Ташкенте"),
                                  ),
                                  SizedBox(
                                    width: context.w * 0.8,
                                    child: classicText(
                                      "Бассейны от intex - доступная по цене, качественная, надежная и экологически чистая продукция, которая предназначена для приятного отдыха всей семьи.",
                                      size: FontConst.largeFont - 2,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Image.asset('assets/images/intexbassen.png'),
                                  elevatedButtonBig(
                                    context,
                                    "Заказать звонок",
                                    () {
                                      context
                                          .read<HomeCubit>()
                                          .callButtonOnTap();
                                    },
                                  ),
                                  SizedBox(height: context.h * 0.01),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: context.h * 0.069),
                        categoryForProducts(
                          context,
                          categoryName: "Популярные товары",
                          status: "Хит продаж",
                          imagePath:
                              "https://i7.imageban.ru/out/2022/02/01/7873a774e6a8bec056bb64e6412b56f3.jpg",
                          poolType: "Каркасный прямоугольный бассейн",
                          newPrice: 485445448,
                          oldPrice: 956465157,
                          size: " 220х150х60см, 1662л",
                        ),
                        SizedBox(height: context.h * 0.05),
                        Container(
                          padding: EdgeInsets.only(left: context.w * 0.05),
                          color: ColorConst.containerBackground,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: context.h * 0.04),
                              classicText("Бассейны от INTEX в Ташкенте",
                                  size: FontConst.meduimFont + 2),
                              SizedBox(height: context.h * 0.016),
                              classicText(
                                "Бассейны от intex отличаются обширным перечнем преимуществ, из которых можно выделить самые важные:",
                                size: FontConst.meduimFont - 2,
                                color: ColorConst.textColor,
                              ),
                              SizedBox(height: context.h * 0.05),
                              ourAmenities(context, "Высокое качество"),
                              ourAmenities(context, "Прочность"),
                              ourAmenities(context, "Простота установки"),
                              ourAmenities(context, "Красивые и ярки цвета"),
                              ourAmenities(context, "Стильный дизайн"),
                              SizedBox(height: context.h * 0.02),
                              SizedBox(
                                child:
                                    Image.asset('assets/images/IntexPool.png'),
                              ),
                              SizedBox(height: context.h * 0.05),
                            ],
                          ),
                        ),
                        SizedBox(height: context.h * 0.03),
                        categoryForProducts(
                          context,
                          categoryName: "Новые товары",
                          status: "Новинки",
                          imagePath:
                              "https://i7.imageban.ru/out/2022/02/01/7873a774e6a8bec056bb64e6412b56f3.jpg",
                          newPrice: 994651,
                          oldPrice: 4561648,
                          poolType: "Каркасный прямоугольный бассейн ",
                          size: "220х150х60см, 1662л",
                        ),
                        SizedBox(height: context.h * 0.05),
                        Container(
                          padding: EdgeInsets.only(left: context.w * 0.035),
                          color: ColorConst.containerBackground,
                          height: context.h * 0.8,
                          width: context.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: context.h * 0.04),
                              classicText("Купить оптом",
                                  size: FontConst.meduimFont + 2),
                              SizedBox(height: context.h * 0.02),
                              classicText(
                                "Если вы хотите купить товары по оптовой цене, вы должны заказать не менее 20 товаров.",
                                size: FontConst.meduimFont - 2,
                              ),
                              SizedBox(height: context.h * 0.024),
                              SizedBox(
                                width: context.w * 0.85,
                                child: Image.asset(
                                    'assets/images/karkasniybaseyn.png'),
                              ),
                              SizedBox(height: context.h * 0.01),
                              Container(
                                height: context.h * 0.345,
                                width: context.w * 0.9,
                                decoration: BoxDecoration(
                                  color: ColorConst.white,
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: context.w * 0.032),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: context.h * 0.02),
                                      classicText("Имя",
                                          size: FontConst.meduimFont),
                                      SizedBox(height: context.h * 0.02),
                                      SizedBox(
                                        width: context.w * 0.8,
                                        height: context.h * 0.06,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: 'Введите ваше имя',
                                            hintStyle: TextStyle(
                                                color: ColorConst.skyDarck),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: ColorConst
                                                      .textformBorderColor),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: context.h * 0.02),
                                      classicText("Номер телефона",
                                          size: FontConst.meduimFont),
                                      SizedBox(height: context.h * 0.02),
                                      Container(
                                        width: context.w * 0.8,
                                        alignment: Alignment.center,
                                        padding:
                                            const EdgeInsets.only(left: 12),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xFFCBCBCB),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: ColorConst.white),
                                        child: InternationalPhoneNumberInput(
                                          onInputChanged: (PhoneNumber number) {
                                            print(number.phoneNumber);
                                          },
                                          cursorColor: ColorConst.black,
                                          // selectorConfig: const SelectorConfig(
                                          //   selectorType:
                                          //       PhoneInputSelectorType.DIALOG,
                                          // ),
                                          inputDecoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    bottom: 15, left: 0),
                                            border: InputBorder.none,
                                            hintText: "(90) 123 45 67",
                                            hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: FontConst.meduimFont,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: context.h * 0.02),
                                      elevatedButtonBig(
                                          context, "Отправить", () {}),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: context.h * 0.04),
                        Padding(
                          padding: EdgeInsets.only(left: context.w * 0.035),
                          child: classicText("Почему нужно выбрать нас?",
                              size: FontConst.meduimFont + 2),
                        ),
                        SizedBox(height: context.h * 0.04),
                        WhyChouseUs(
                          path: 'assets/images/worker.png',
                          title: "Опыт",
                          subtitle: "Профессионализм наших сотрудников",
                        ),
                        SizedBox(height: context.h * 0.028),
                        WhyChouseUs(
                          path: "assets/images/deliverCar.png",
                          title: "Доставка",
                          subtitle: "Бесплатная доставка по городу",
                        ),
                        SizedBox(height: context.h * 0.028),
                        WhyChouseUs(
                          path: "assets/images/intexbassen.png",
                          title: "Качество",
                          subtitle: "Прочные, качественные бассейны",
                        ),
                        SizedBox(height: context.h * 0.032),
                        categoryForProducts(
                          context,
                          categoryName: "Товары со скидкой",
                          status: "-17% скидка",
                          imagePath:
                              "https://i7.imageban.ru/out/2022/02/01/7873a774e6a8bec056bb64e6412b56f3.jpg",
                          newPrice: 994651,
                          oldPrice: 4561648,
                          poolType: "Каркасный прямоугольный бассейн ",
                          size: "220х150х60см, 1662л",
                        ),
                        SizedBox(height: context.h * 0.035),
                        Container(
                          width: context.w,
                          padding: EdgeInsets.only(left: context.w * 0.035),
                          color: ColorConst.containerBackground,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: context.h * 0.045),
                              classicText(
                                "INTEX-MARKET",
                                color: ColorConst.accentColor,
                                size: FontConst.largeFont + 2,
                              ),
                              SizedBox(height: context.h * 0.0219),
                              classicText(
                                "Бассейны от intex - доступная по цене, качественная, надежная и экологически чистая продукция, которая предназначена для приятного отдыха всей семьи",
                                color: ColorConst.textColor,
                                size: FontConst.meduimFont,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(height: context.h * 0.02),
                              Wrap(
                                children: [
                                  iconButton(
                                    context,
                                    "assets/icons/facebook.png",
                                    () {},
                                  ),
                                  SizedBox(width: context.w * 0.03),
                                  iconButton(
                                    context,
                                    "assets/icons/in.png",
                                    () {},
                                  ),
                                  SizedBox(width: context.w * 0.03),
                                  iconButton(
                                    context,
                                    "assets/icons/instagram.png",
                                    () {},
                                  ),
                                  SizedBox(width: context.w * 0.03),
                                  iconButton(
                                    context,
                                    "assets/icons/twitter.png",
                                    () {},
                                  ),
                                ],
                              ),
                              SizedBox(height: context.h * 0.024),
                              classicText("Полезные ссылки",
                                  size: FontConst.meduimFont + 2),
                              SizedBox(height: context.h * 0.016),
                              TextButtonForLinks(
                                text: "О Продукт",
                                function: () {},
                              ),
                              SizedBox(height: context.h * 0.012),
                              TextButtonForLinks(
                                text: "Почему мы?",
                                function: () {},
                              ),
                              SizedBox(height: context.h * 0.012),
                              TextButtonForLinks(
                                text: "Контакты",
                                function: () {},
                              ),
                              SizedBox(height: context.h * 0.012),
                              TextButtonForLinks(
                                text: "Категории",
                                function: () {},
                              ),
                              SizedBox(height: context.h * 0.012),
                              TextButtonForLinks(
                                text: "Популярное",
                                function: () {},
                              ),
                              SizedBox(height: context.h * 0.012),
                              TextButtonForLinks(
                                text: "Новинки",
                                function: () {},
                              ),
                              SizedBox(height: context.h * 0.012),
                              TextButtonForLinks(
                                text: "На скидке",
                                function: () {},
                              ),
                              SizedBox(height: context.h * 0.016),
                              classicText("Центр помощи",
                                  size: FontConst.meduimFont + 2),
                              SizedBox(height: context.h * 0.012),
                              TextButtonForLinks(
                                text: "Доставка и оплата",
                                function: () {},
                              ),
                              SizedBox(height: context.h * 0.012),
                              TextButtonForLinks(
                                text: "Часто задаваемые вопросы",
                                function: () {},
                              ),
                              SizedBox(height: context.h * 0.012),
                              TextButtonForLinks(
                                text: "Политика конфиденциальности",
                                function: () {},
                              ),
                              SizedBox(height: context.h * 0.016),
                              classicText("Адрес",
                                  size: FontConst.meduimFont + 2),
                              SizedBox(height: context.h * 0.024),
                              aboutTheCompany(
                                context,
                                "assets/icons/li_location.png",
                                "Улица Пахлавона Махмуда,\nЯшнабадский район, город Ташкент",
                              ),
                              SizedBox(height: context.h * 0.01),
                              aboutTheCompany(
                                context,
                                "assets/icons/li_phone.png",
                                "+998 (90) 128 81 82",
                              ),
                              SizedBox(height: context.h * 0.01),
                              aboutTheCompany(
                                  context,
                                  "assets/icons/li_mail.png",
                                  "Intex@gmail.com"),
                              SizedBox(height: context.h * 0.01),
                              aboutTheCompany(
                                  context,
                                  "assets/icons/li_clock-9.png",
                                  "10:00 - 22:00 Без выходных"),
                              SizedBox(height: context.h * 0.01),
                              Divider(
                                thickness: 2,
                                color: ColorConst.dividerColor,
                                indent: context.w * 0.02,
                                endIndent: context.w * 0.03,
                              ),
                              SizedBox(height: context.h * 0.016),
                              classicText(
                                "INTEX-MARKET © 2022, Разработано в Support Solutions Все права защищены.",
                                size: FontConst.meduimFont - 2,
                                color: ColorConst.textColor,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(height: context.h * 0.02),
                            ],
                          ),
                        ),
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
          );

          //? FutureBuilder(
          //?   future: Future.wait(
          //?     [
          //?       CategoryService.inherentce.getCatrgory(),
          //?       ProductService.inherentce.getProducts(),
          //?     ],
          //?   ),
          //?   builder: (context, AsyncSnapshot snapshot) {
          //?     if (!snapshot.hasData) {
          //?       return const Center(child: CircularProgressIndicator());
          //?     } else if (snapshot.hasError) {
          //?       return Center(child: classicText("ERROR: ${snapshot.error}"));
          //?     } else {
          //?       var data = snapshot.data;
          //?       for (int i = 0; i < data[0].length; i++) {
          //?         context.watch<HomeCubit>().lstProducts.add(
          //?           {
          //?             data[0][i].id: data[1]
          //?                 .where(
          //?                     (element) => element.categoryId == data[0][i].id)
          //?                 .toList()
          //?           },
          //?         );
          //?       }
          //?       return
          //?     }
          //?   },
          //? );
        },
      ),
    );
  }

  Row aboutTheCompany(BuildContext context, String iconPath, String text) {
    return Row(
      children: [
        SizedBox(
          height: context.h * 0.04,
          width: context.w * 0.06,
          child: Image.asset(iconPath),
        ),
        SizedBox(width: context.w * 0.02),
        classicText(
          text,
          color: ColorConst.textColor,
          size: FontConst.meduimFont - 2,
        )
      ],
    );
  }

  Column categoryForProducts(
    BuildContext context, {
    required String categoryName,
    required String status,
    required String poolType,
    required String size,
    required String imagePath,
    required double oldPrice,
    required double newPrice,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: context.w * 0.05, right: context.w * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              classicText(categoryName, size: FontConst.largeFont + 2),
              Wrap(
                children: [
                  chevronRightAndLeftButton(
                    context,
                    'assets/icons/chevronLeft.png',
                    () {},
                  ),
                  chevronRightAndLeftButton(
                    context,
                    'assets/icons/chevronRight.png',
                    () {
                      // ! Buni to'g'irla bolakay button bosgan scroll bo'lishi kerak
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          color: ColorConst.containerBackground,
          height: context.h * 0.48,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // superIndex = index;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: productAndOrdering(
                  context,
                  poolType,
                  imagePath,
                  oldPrice,
                  newPrice,
                  size,
                  status,
                ),
              );
            },
            itemCount: 6,
          ),
        ),
      ],
    );
  }

  Chip ourAmenities(
    BuildContext context,
    String text,
  ) {
    return Chip(
      backgroundColor: ColorConst.white,
      label: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: context.w * 0.055,
            child: Image.asset(
              'assets/icons/roundedCheckbox.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: context.w * 0.02),
          classicText(
            text,
            color: Colors.black,
            size: FontConst.meduimFont + 2,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }

  IconButton chevronRightAndLeftButton(
      BuildContext context, String path, Function function) {
    return IconButton(
      icon: CircleAvatar(
        backgroundColor: ColorConst.containerBackground,
        child: SizedBox(
          width: context.w * 0.06,
          child: Image.asset(
            path,
          ),
        ),
      ),
      onPressed: () {
        function();
      },
    );
  }

  InkWell iconButton(
    BuildContext context,
    String path,
    Function function,
  ) {
    return InkWell(
      child: Container(
        height: context.h * 0.06,
        width: context.w * 0.13,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConst.accentColor,
        ),
        child: SizedBox(
          height: context.h * 0.035,
          child: Image.asset(
            path,
            fit: BoxFit.cover,
          ),
        ),
      ),
      onTap: () {
        function();
      },
    );
  }
}
