// ignore_for_file: use_build_context_synchronously

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
import 'package:intex/data/model/products_model.dart';
import 'package:intex/data/services/beckend/products_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/func/show_diolog_congratulations.dart';
import '../../core/widgets/classic_text.dart';
import '../../core/widgets/drawer_widget.dart';
import '../../core/widgets/input_filed_name_phone_number.dart';
import 'package:teledart/teledart.dart';

import '../../main.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  ScrollController controller = ScrollController();
  Future<List<Result>>? getProducts;

  Future<List<Result>> _getProducts() async {
    return await ProductService.inherentce.getProducts();
  }

  @override
  void initState() {
    super.initState();
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      context.read<HomeCubit>().checkCallSupport(result);
    });
    getProducts = _getProducts();
  }

  @override
  void dispose() {
    super.dispose();
    context.watch<HomeCubit>().scrollCtx.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: ColorConst.white,
      drawer: HomeDrawer(),
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
                return FutureBuilder(
                  future: getProducts,
                  builder: (context, AsyncSnapshot<List<Result>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    } else if (snapshot.hasError) {
                      return Center(
                          child: classicText(snapshot.error.toString()));
                    } else {
                      return SafeArea(
                        child: CustomScrollView(
                          controller: context.watch<HomeCubit>().scrollCtx,
                          slivers: [
                            const HomeAppBarOne(),
                            SliverToBoxAdapter(
                              child: Divider(
                                height: 1,
                                thickness: 1,
                                color: ColorConst.dividerColor,
                              ),
                            ),
                            HomeAppBarTwo(
                              homeContext: context,
                              function: () {
                                _key.currentState!.openDrawer();
                              },
                            ),
                            SliverToBoxAdapter(
                              child: SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.024),
                            ),
                            SliverToBoxAdapter(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.55,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: ColorConst.containerBackground,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                child: classicText(
                                                    "poolsInTashkent".tr()),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.8,
                                                child: classicText(
                                                  "brieflyAboutThePool".tr(),
                                                  size: FontConst.largeFont - 2,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              Image.asset(
                                                  'assets/images/intexbassen.png'),
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
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.069,
                                    ),
                                    categoryForProducts(context,
                                        data: snapshot.data!,
                                        status: "Хит продаж"),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05),
                                      color: ColorConst.containerBackground,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                          ),
                                          classicText("poolsInTashkent".tr(),
                                              size: FontConst.meduimFont + 2),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.016),
                                          classicText(
                                            "intexConveniences".tr(),
                                            size: FontConst.meduimFont - 2,
                                            color: ColorConst.textColor,
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05),
                                          ourAmenities(
                                              context, "veryQuality".tr()),
                                          ourAmenities(
                                              context, "strength".tr()),
                                          ourAmenities(
                                              context, "easyToInstall".tr()),
                                          ourAmenities(context,
                                              "beautifulAndBrightColors".tr()),
                                          ourAmenities(
                                              context, "modernDesign".tr()),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02),
                                          SizedBox(
                                              child: Image.asset(
                                                  'assets/images/IntexPool.png')),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03),
                                    categoryForProducts(context,
                                        data: snapshot.data!,
                                        status: "Новинки"),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05),
                                    Container(
                                      color: ColorConst.containerBackground,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.04),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.037),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                classicText(
                                                    "generalPurchase".tr(),
                                                    size: FontConst.meduimFont +
                                                        2),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02),
                                                classicText(
                                                  "conditionOfPurchaseAtWholesalePrice"
                                                      .tr(),
                                                  size:
                                                      FontConst.meduimFont - 2,
                                                ),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.024),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
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
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          Center(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.345,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.9,
                                              decoration: BoxDecoration(
                                                color: ColorConst.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  12,
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  NameAndPhonenumberInputFiled(
                                                      width: 0.8),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.037,
                                                    ),
                                                    child: elevatedButtonBig(
                                                      context,
                                                      "send".tr(),
                                                      () async {
                                                        if (BlocProvider.of<
                                                                    HomeCubit>(
                                                                context)
                                                            .formKey
                                                            .currentState!
                                                            .validate()) {
                                                          await context
                                                              .read<HomeCubit>()
                                                              .botSendMessage();
                                                          BlocProvider.of<
                                                                      HomeCubit>(
                                                                  context)
                                                              .clearNameAndNumberController();
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              backgroundColor:
                                                                  ColorConst
                                                                      .red,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              content:
                                                                  classicText(
                                                                "Ma'lumotlarni qaytadan to'ldiring .",
                                                                size: FontConst
                                                                    .meduimFont,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035),
                                      child: classicText("whyChooseUs".tr(),
                                          size: FontConst.meduimFont + 2),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04),
                                    WhyChouseUs(
                                      path: 'assets/images/worker.png',
                                      title: "experience".tr(),
                                      subtitle: "experienceSubtitle".tr(),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.028),
                                    WhyChouseUs(
                                      path: "assets/images/deliverCar.png",
                                      title: "delivery".tr(),
                                      subtitle: "deliverySubtitle".tr(),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.028),
                                    WhyChouseUs(
                                      path: "assets/images/intexbassen.png",
                                      title: "quality".tr(),
                                      subtitle: "qualitySubtitle".tr(),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.032),
                                    categoryForProducts(context,
                                        data: snapshot.data!,
                                        status: "-17% скидка"),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.035),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.035),
                                      color: ColorConst.containerBackground,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.045),
                                          classicText(
                                            "INTEX-MARKET",
                                            color: ColorConst.accentColor,
                                            size: FontConst.largeFont + 2,
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0219,
                                          ),
                                          Wrap(
                                            children: [
                                              iconButton(
                                                context,
                                                "assets/icons/facebook.png",
                                                () {},
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03),
                                              iconButton(
                                                context,
                                                "assets/icons/in.png",
                                                () {},
                                              ),
                                              SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
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
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03),
                                              iconButton(
                                                context,
                                                "assets/icons/twitter.png",
                                                () {},
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.024),
                                          classicText("address".tr(),
                                              size: FontConst.meduimFont + 2),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.024),
                                          aboutTheCompany(
                                            context,
                                            "assets/icons/li_location.png",
                                            "Улица Пахлавона Махмуда,\nЯшнабадский район, город Ташкент",
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          aboutTheCompany(
                                            context,
                                            "assets/icons/li_phone.png",
                                            "+998 (90) 128 81 82",
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          aboutTheCompany(
                                              context,
                                              "assets/icons/li_mail.png",
                                              "Intex@gmail.com"),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          aboutTheCompany(
                                              context,
                                              "assets/icons/li_clock-9.png",
                                              "10:00 - 22:00 Без выходных"),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          Divider(
                                            thickness: 2,
                                            color: ColorConst.dividerColor,
                                            indent: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                            endIndent: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.016),
                                          classicText(
                                            "developer".tr(),
                                            size: FontConst.meduimFont - 2,
                                            color: ColorConst.textColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  },
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

  Column categoryForProducts(BuildContext context,
      {required List<Result> data, required String status}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.02),
          child:
              classicText("Популярные товары", size: FontConst.largeFont + 2),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.029),
        SizedBox(
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
                  data[index].nameRu!,
                  context.watch<HomeCubit>().noImagePath,
                  data[index].price!,
                  data[index].discountPrice!,
                  "220х150х60см, 1662л",
                  status,
                ),
              );
            },
            itemCount: data.length,
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
