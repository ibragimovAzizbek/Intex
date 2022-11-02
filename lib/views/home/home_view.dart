import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/base/base_view.dart';
import 'package:intex/core/components/eleveted_button.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/core/widgets/app_bar_widget.dart';
import 'package:intex/core/widgets/product_and_ordering.dart';
import 'package:intex/core/widgets/why_chouse_us_base_widget.dart';
import 'package:intex/cubit/home/home_cubit.dart';
import 'package:intex/cubit/home/home_state.dart';
import 'package:intex/extensions/mq_extension.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/widgets/classic_text.dart';
import '../../core/widgets/drawer_widget.dart';
import '../../core/widgets/text_button_for_useful_links.dart';

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
      drawer: HomeDrawer(),
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.024),
                        Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.55,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorConst.containerBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: classicText("poolsInTashkent".tr()),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: classicText(
                                      "brieflyAboutThePool".tr(),
                                      size: FontConst.largeFont - 2,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Image.asset('assets/images/intexbassen.png'),
                                  elevatedButtonBig(
                                    context,
                                    "orderWithCalling".tr(),
                                    () {
                                      context
                                          .read<HomeCubit>()
                                          .callButtonOnTap();
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.069),
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          color: ColorConst.containerBackground,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.04),
                              classicText("poolsInTashkent".tr(),
                                  size: FontConst.meduimFont + 2),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.016),
                              classicText(
                                "intexConveniences".tr(),
                                size: FontConst.meduimFont - 2,
                                color: ColorConst.textColor,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              ourAmenities(context, "veryQuality".tr()),
                              ourAmenities(context, "strength".tr()),
                              ourAmenities(context, "easyToInstall".tr()),
                              ourAmenities(
                                  context, "beautifulAndBrightColors".tr()),
                              ourAmenities(context, "modernDesign".tr()),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              SizedBox(
                                  child: Image.asset(
                                      'assets/images/IntexPool.png')),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        Container(
                          color: ColorConst.containerBackground,
                          height: MediaQuery.of(context).size.height * 0.8,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.04),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.037),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    classicText("generalPurchase".tr(),
                                        size: FontConst.meduimFont + 2),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    classicText(
                                      "conditionOfPurchaseAtWholesalePrice"
                                          .tr(),
                                      size: FontConst.meduimFont - 2,
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.024),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.85,
                                        child: Center(
                                          child: Image.asset(
                                              'assets/images/karkasniybaseyn.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Center(
                                child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.345,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: ColorConst.white,
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.032),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        classicText("name".tr(),
                                            size: FontConst.meduimFont),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.06,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: "inputFiledName".tr(),
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
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        classicText("phoneNumber".tr(),
                                            size: FontConst.meduimFont),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
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
                                            onInputChanged:
                                                (PhoneNumber number) {
                                              // print(number.phoneNumber);
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
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02),
                                        elevatedButtonBig(
                                            context, "send".tr(), () {}),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.035),
                          child: classicText("whyChooseUs".tr(),
                              size: FontConst.meduimFont + 2),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        WhyChouseUs(
                          path: 'assets/images/worker.png',
                          title: "experience".tr(),
                          subtitle: "experienceSubtitle".tr(),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.028),
                        WhyChouseUs(
                          path: "assets/images/deliverCar.png",
                          title: "delivery".tr(),
                          subtitle: "deliverySubtitle".tr(),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.028),
                        WhyChouseUs(
                          path: "assets/images/intexbassen.png",
                          title: "quality".tr(),
                          subtitle: "qualitySubtitle".tr(),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.032),
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.035),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.035),
                          color: ColorConst.containerBackground,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.045),
                              classicText(
                                "INTEX-MARKET",
                                color: ColorConst.accentColor,
                                size: FontConst.largeFont + 2,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.0219),
                              classicText(
                                "swimmingPoolsFromIntex".tr(),
                                color: ColorConst.textColor,
                                size: FontConst.meduimFont,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Wrap(
                                children: [
                                  iconButton(
                                    context,
                                    "assets/icons/facebook.png",
                                    () {},
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.03),
                                  iconButton(
                                    context,
                                    "assets/icons/in.png",
                                    () {},
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.03),
                                  iconButton(
                                    context,
                                    "assets/icons/instagram.png",
                                    () async {
                                      await context
                                          .read<HomeCubit>()
                                          .instagramOnTap();
                                    },
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.03),
                                  iconButton(
                                    context,
                                    "assets/icons/twitter.png",
                                    () {},
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.024),
                              classicText("usefulLinks".tr(),
                                  size: FontConst.meduimFont + 2),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.016),
                              TextButtonForLinks(
                                text: "О Продукт",
                                function: () {},
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.012),
                              TextButtonForLinks(
                                text: "Почему мы?",
                                function: () {},
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.012),
                              TextButtonForLinks(
                                text: "Контакты",
                                function: () {},
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.012),
                              TextButtonForLinks(
                                text: "Категории",
                                function: () {},
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.012),
                              TextButtonForLinks(
                                text: "Популярное",
                                function: () {},
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.012),
                              TextButtonForLinks(
                                text: "Новинки",
                                function: () {},
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.012),
                              TextButtonForLinks(
                                text: "На скидке",
                                function: () {},
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.016),
                              classicText("helpCenter".tr(),
                                  size: FontConst.meduimFont + 2),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.012),
                              TextButtonForLinks(
                                text: "Доставка и оплата",
                                function: () {},
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.012),
                              TextButtonForLinks(
                                text: "Часто задаваемые вопросы",
                                function: () {},
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.012),
                              TextButtonForLinks(
                                text: "Политика конфиденциальности",
                                function: () {},
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.016),
                              classicText("address".tr(),
                                  size: FontConst.meduimFont + 2),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.024),
                              aboutTheCompany(
                                context,
                                "assets/icons/li_location.png",
                                "Улица Пахлавона Махмуда,\nЯшнабадский район, город Ташкент",
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              aboutTheCompany(
                                context,
                                "assets/icons/li_phone.png",
                                "+998 (90) 128 81 82",
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              aboutTheCompany(
                                  context,
                                  "assets/icons/li_mail.png",
                                  "Intex@gmail.com"),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              aboutTheCompany(
                                  context,
                                  "assets/icons/li_clock-9.png",
                                  "10:00 - 22:00 Без выходных"),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.01),
                              Divider(
                                thickness: 2,
                                color: ColorConst.dividerColor,
                                indent:
                                    MediaQuery.of(context).size.width * 0.02,
                                endIndent:
                                    MediaQuery.of(context).size.width * 0.03,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.016),
                              classicText(
                                "developer".tr(),
                                size: FontConst.meduimFont - 2,
                                color: ColorConst.textColor,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
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
          //?         MediaQuery.of(context).size.widthatch<HomeCubit>().lstProducts.add(
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
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width * 0.06,
          child: Image.asset(iconPath),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
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
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.02),
          child: classicText(categoryName, size: FontConst.largeFont + 2),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.029),
        Container(
          color: ColorConst.containerBackground,
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
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
            width: 24,
            height: 24,
            child: Image.asset(
              'assets/icons/roundedCheckbox.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
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
          width: MediaQuery.of(context).size.width * 0.06,
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
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.13,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorConst.accentColor,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.035,
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
