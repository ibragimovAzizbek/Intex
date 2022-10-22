import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/base/base_view.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/core/func/show_diolog_check.dart';
import 'package:intex/core/func/show_diolog_order_product.dart';
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
        backgroundColor: ColorConst.backgroundColor,
        drawer: const HomeDrawer(),
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
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: context.h * 0.4,
                            width: double.infinity,
                            color: ColorConst.primaryColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "INTEX-MARKET.UZ",
                                        style: TextStyle(
                                          color: ColorConst.white,
                                          fontSize: FontConst.largeFont,
                                        ),
                                      ),
                                      // ? Button to switch to Call
                                      Wrap(
                                        children: [
                                          topIconButton(
                                            context,
                                            'assets/icons/phone2.png',
                                            () {
                                              context
                                                  .read<HomeCubit>()
                                                  .callButtonOnTap();
                                            },
                                          ),
                                          // ?  Button to switch to telegram
                                          topIconButton(
                                            context,
                                            'assets/icons/telegram2.png',
                                            () {
                                              context
                                                  .read<HomeCubit>()
                                                  .telegramOnTap();
                                            },
                                          ),
                                          // ? Button to change the language
                                          topIconButton(
                                            context,
                                            context.locale.toString() == "uz_UZ"
                                                ? 'assets/icons/languageru.png'
                                                : 'assets/icons/languageuz.png',
                                            () {
                                              switch (
                                                  context.locale.toString()) {
                                                case "uz_UZ":
                                                  context.setLocale(
                                                      const Locale("ru", "RU"));
                                                  break;
                                                case "ru_RU":
                                                  context.setLocale(
                                                      const Locale("uz", "UZ"));
                                                  break;
                                              }
                                            },
                                          ),
                                          // ? Button to Open Drawer
                                          topIconButton(
                                            context,
                                            'assets/icons/menu.png',
                                            () {
                                              _key.currentState!.openDrawer();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: SizedBox(
                                    height: context.h * 0.23,
                                    width: context.w,
                                    child: Image.asset(
                                      'assets/images/bigImage.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // ? Seasonal sale -> text
                                classicText(
                                  "seasonal_sale".tr(),
                                  color: ColorConst.white,
                                  size: FontConst.extraLargeFont,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: context.h * 0.01),
                          Text(
                            "free_sh_pool".tr(),
                            style: TextStyle(
                              fontSize: FontConst.meduimFont,
                              color: ColorConst.primaryColor,
                            ),
                            textAlign: TextAlign.center,
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
                          SizedBox(height: context.h * 0.02),
                          categoryContainer(context, "frame_pools".tr()),
                          SizedBox(height: context.h * 0.02),
                          productAndOrdering(
                            context,
                            "metal_carcass".tr(),
                            'assets/images/bassen.png',
                            1600000,
                            1512000,
                          ),
                          SizedBox(height: context.h * 0.02),
                          categoryContainer(context, "inflatable_pools".tr()),
                          SizedBox(height: context.h * 0.02),
                          productAndOrdering(
                            context,
                            "metal_carcass".tr(),
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
                                classicText(
                                  "free_sh".tr(),
                                  color: ColorConst.white,
                                  size: 25,
                                ),
                                SizedBox(height: context.h * 0.02),
                                Text(
                                  "free_t".tr(),
                                  style: const TextStyle(
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
                                    "checkout".tr(),
                                    style: TextStyle(
                                      color: ColorConst.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  onPressed: () {
                                    alertDiologOrderAProduct(
                                      context,
                                      "metal_carcass".tr(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: context.h * 0.03),
                          categoryContainer(
                            context,
                            "values_of_our_clients".tr(),
                            color: ColorConst.customersColor,
                            textColor: ColorConst.primaryColor,
                          ),
                          SizedBox(height: context.h * 0.02),
                          aboutCutomerWorldView(
                            'assets/icons/exprience.png',
                            "an_experience".tr(),
                            "the_employees".tr(),
                          ),
                          aboutCutomerWorldView(
                            'assets/icons/car.png',
                            "delivery".tr(),
                            "free_city".tr(),
                          ),
                          aboutCutomerWorldView(
                            'assets/icons/check.png',
                            "quality".tr(),
                            "sturdy_pools".tr(),
                          ),
                          SizedBox(height: context.h * 0.03),
                          categoryContainer(
                            context,
                            "pools_t".tr(),
                            color: ColorConst.customersColor,
                            textColor: ColorConst.primaryColor,
                          ),
                          SizedBox(height: context.h * 0.02),
                          Padding(
                            padding: EdgeInsets.only(left: context.w * 0.07),
                            child: SizedBox(
                              child: Text(
                                "pools_days".tr(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: context.h * 0.02),
                          poolAdvantage(context, "strength".tr()),
                          poolAdvantage(context, "easy_to_install".tr()),
                          poolAdvantage(context, "b_colors".tr()),
                          poolAdvantage(context, "stylish_design".tr()),
                          poolAdvantage(context, "high_quality".tr()),
                          SizedBox(height: context.h * 0.03),
                          Container(
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    backgroundColor: ColorConst.primaryAmber,
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
                                            SizedBox(width: context.w * 0.02),
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
                                              MainAxisAlignment.spaceBetween,
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
          },
        ));
  }

  IconButton topIconButton(
    BuildContext context,
    String path,
    Function function,
  ) {
    return IconButton(
      // iconSize: context.w * 0.15,
      icon: Image.asset(
        path,
      ),
      onPressed: () {
        function();
      },
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
