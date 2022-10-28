import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/base/base_view.dart';
import 'package:intex/core/components/eleveted_button.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/core/widgets/app_bar.dart';
import 'package:intex/core/widgets/product_and_ordering.dart';
import 'package:intex/cubit/home/home_cubit.dart';
import 'package:intex/cubit/home/home_state.dart';
import 'package:intex/extensions/mq_extension.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/widgets/classic_text.dart';
import '../../core/widgets/drawer.dart';
import '../../data/services/beckend/category_service.dart';
import '../../data/services/beckend/products_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final ScrollController controller = ScrollController();
  // final double _height = 100.0;
  int superIndex = 0;

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
          return FutureBuilder(
            future: Future.wait(
              [
                CategoryService.inherentce.getCatrgory(),
                ProductService.inherentce.getProducts(),
              ],
            ),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: classicText("ERROR: ${snapshot.error}"));
              } else {
                var data = snapshot.data;
                for (int i = 0; i < data[0].length; i++) {
                  context.watch<HomeCubit>().lstProducts.add(
                    {
                      data[0][i].id: data[1]
                          .where(
                              (element) => element.categoryId == data[0][i].id)
                          .toList()
                    },
                  );
                }
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
                                    padding:
                                        EdgeInsets.only(left: context.w * 0.03),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        Image.asset(
                                            'assets/images/intexbassen.png'),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  classicText('Популярные товары',
                                      size: FontConst.largeFont + 2),
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
                                          controller.animateTo(100,
                                              duration: Duration(seconds: 2),
                                              curve: Curves.ease);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                color: ColorConst.containerBackground,
                                height: context.h * 0.48,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    superIndex = index;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: productAndOrdering(
                                        context,
                                        "Каркасный прямоугольный\nбассейн",
                                        "https://i7.imageban.ru/out/2022/02/01/7873a774e6a8bec056bb64e6412b56f3.jpg",
                                        1265.546,
                                        654138,
                                        "220х150х60см, 1662л",
                                        "Хит продаж",
                                      ),
                                    );
                                  },
                                  itemCount: data[1].length,
                                ),
                              ),
                              SizedBox(height: context.h * 0.2)
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
              }
            },
          );
        },
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

  IconButton iconButton(
    BuildContext context,
    String path,
    Function function,
  ) {
    return IconButton(
      iconSize: context.w * 0.05,
      icon: Image.asset(
        path,
        fit: BoxFit.cover,
      ),
      onPressed: () {
        function();
      },
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

  /* slivers: [
                            SliverToBoxAdapter(
                              child: Column(
                                children: [
                                  SizedBox(height: context.h * 0.01),
                                  classicText(
                                    "free_sh_pool".tr(),
                                    size: FontConst.meduimFont + 1,
                                    color: ColorConst.primaryColor,
                                  ),
                                  SizedBox(height: context.h * 0.01),
                                  Text(
                                    "we_service".tr(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: ColorConst.primaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: context.h * 0.01),
                                ],
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: SizedBox(
                                // height: context.h * 1,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: data[0].length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, bigIndex) {
                                    return Column(
                                      children: [
                                        SizedBox(height: context.h * 0.03),
                                        categoryContainer(
                                          context,
                                          context.locale.toString() == "uz_UZ"
                                              ? data[0][bigIndex].categoryNameUz
                                              : data[0][bigIndex]
                                                  .categoryNameRu,
                                        ),
                                        SizedBox(height: context.h * 0.03),
                                        ListView.separated(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          separatorBuilder:
                                              (context, indexSeprator) =>
                                                  SizedBox(
                                            height: context.h * 0.02,
                                          ),
                                          itemBuilder: (context, index) =>
                                              Center(
                                            child: productAndOrdering(
                                              context,
                                              context.locale.toString() ==
                                                      "uz_UZ"
                                                  ? context
                                                      .watch<HomeCubit>()
                                                      .lstProducts[bigIndex]
                                                          [bigIndex + 1]![index]
                                                      .frameUz
                                                      .toString()
                                                  : context
                                                      .watch<HomeCubit>()
                                                      .lstProducts[bigIndex]
                                                          [bigIndex + 1]![index]
                                                      .frameRu
                                                      .toString(),
                                              context
                                                  .watch<HomeCubit>()
                                                  .lstProducts[bigIndex]
                                                      [bigIndex + 1]![index]
                                                  .image
                                                  .toString(),
                                              context
                                                  .watch<HomeCubit>()
                                                  .lstProducts[bigIndex]
                                                      [bigIndex + 1]![index]
                                                  .oldPrice!
                                                  .toDouble(),
                                              context
                                                  .watch<HomeCubit>()
                                                  .lstProducts[bigIndex]
                                                      [bigIndex + 1]![index]
                                                  .newPrice!
                                                  .toDouble(),
                                              context.locale.toString() ==
                                                      "uz_UZ"
                                                  ? context
                                                      .watch<HomeCubit>()
                                                      .lstProducts[bigIndex]
                                                          [bigIndex + 1]![index]
                                                      .statusUz
                                                      .toString()
                                                  : context
                                                      .watch<HomeCubit>()
                                                      .lstProducts[bigIndex]
                                                          [bigIndex + 1]![index]
                                                      .statusRu
                                                      .toString(),
                                            ),
                                          ),
                                          itemCount: context
                                              .watch<HomeCubit>()
                                              .lstProducts[bigIndex]
                                                  [bigIndex + 1]!
                                              .length,

                                          // ? Bu yerda productga qarab length o'zgarishi kerak
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                                child: SizedBox(height: context.h * 0.02)),
                            SliverToBoxAdapter(
                              child: Container(
                                height: context.h * 0.58,
                                width: context.w,
                                color: ColorConst.primaryColor,
                                child: Column(
                                  children: [
                                    SizedBox(height: context.h * 0.02),
                                    classicText("git_consultation".tr(),
                                        color: ColorConst.white),
                                    Form(
                                      child: Column(
                                        children: [
                                          SizedBox(height: context.h * 0.015),
                                          SizedBox(
                                            width: context.w * 0.9,
                                            height: context.h * 0.048,
                                            child: textFormFIled(
                                              "name".tr(),
                                              context
                                                  .watch<HomeCubit>()
                                                  .nameController,
                                            ),
                                          ),
                                          SizedBox(height: context.h * 0.022),
                                          SizedBox(
                                            width: context.w * 0.9,
                                            height: context.h * 0.048,
                                            child: textFormFIled(
                                              "phone".tr(),
                                              context
                                                  .watch<HomeCubit>()
                                                  .phoneNumberController,
                                              keyboardType: TextInputType.phone,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: context.h * 0.02),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor:
                                            ColorConst.primaryAmber,
                                      ),
                                      child: classicText(
                                        "i_consult".tr(),
                                        size: FontConst.meduimFont,
                                      ),
                                      onPressed: () async {
                                        checkAlertDiolog(context);
                                      },
                                    ),
                                    SizedBox(height: context.h * 0.02),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Image.asset(
                                                    'assets/icons/subwayTime.png'),
                                                SizedBox(
                                                    width: context.w * 0.02),
                                                classicText(
                                                  "working_time".tr(),
                                                  color: ColorConst.white,
                                                  size: FontConst.meduimFont,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: context.h * 0.01),
                                            classicText(
                                              "${"weekdays".tr()} 10:00 - 22:00\n${"seven_week".tr()}", // ! Database'dan keladi
                                              color: ColorConst.white,
                                              size: FontConst.smallFont,
                                            ),
                                            SizedBox(height: context.h * 0.01),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                // ? Go to the Phone with Url
                                                iconButton(
                                                  context,
                                                  'assets/icons/phone2.png',
                                                  () {
                                                    context
                                                        .read<HomeCubit>()
                                                        .callButtonOnTap();
                                                  },
                                                ),
                                                // ? Go to the Telegram with URL
                                                iconButton(
                                                  context,
                                                  'assets/icons/telegram2.png',
                                                  () {
                                                    context
                                                        .read<HomeCubit>()
                                                        .telegramOnTap();
                                                  },
                                                ),

                                                // ? Go to the Instagram with URL
                                                iconButton(
                                                  context,
                                                  'assets/icons/instagram2.png',
                                                  () {
                                                    context
                                                        .read<HomeCubit>()
                                                        .instagramOnTap();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                              ),
                            ),
                          ],*/
}
