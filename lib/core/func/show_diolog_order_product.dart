import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/func/show_diolog_check.dart';
import 'package:intex/extensions/mq_extension.dart';

import '../../cubit/home/home_cubit.dart';
import '../constants/color_const.dart';
import '../widgets/classic_text.dart';
import '../widgets/text_form_filed.dart';

alertDiologOrderAProduct(BuildContext context, String text) => showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            icon: IconButton(
              icon: Image.asset('assets/icons/cancel.png'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            iconPadding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.7),
            backgroundColor: ColorConst.backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                      color: ColorConst.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        classicText(text, color: ColorConst.primaryColor),
                        Image.asset(
                          'assets/images/bassen.png',
                        ), // ! MASULAT RASIMI BECK-END'dan keladi
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Center(
                    child: classicText(
                      '1.390.000 ${"currency_name".tr()}',
                    ), // ! MASULAT NARXI BECK-END'dan keladi
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.048,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: textFormFiled(
                            "your_name".tr(),
                            context.watch<HomeCubit>().nameController,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.048,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: textFormFiled(
                            "your_phone".tr(),
                            context.watch<HomeCubit>().phoneNumberController,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                        Row(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: textFormFiled(
                                "your_address".tr(),
                                context.watch<HomeCubit>().locationController,
                                keyboardType: TextInputType.streetAddress,
                              ),
                            ),
                            IconButton(
                              iconSize:
                                  MediaQuery.of(context).size.width * 0.15,
                              icon: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.043,
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Image.asset(
                                  'assets/icons/location.png',
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                              ),
                              onPressed: () async {
                                await context.read<HomeCubit>().getLocation();
                                // showDialog(
                                //   context: context,
                                //   builder: (context) => SizedBox(
                                //     height: MediaQuery.of(context).size.height * 0.005,
                                //     child: const AlertDialog(
                                //       content: Center(
                                //         child: CircularProgressIndicator
                                //             .adaptive(),
                                //       ),
                                //     ),
                                //   ),
                                // );
                                // Navigator.pop(context);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConst.primaryAmber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: classicText("order".tr()),
                    onPressed: () {
                      Navigator.pop(context);
                      checkAlertDiolog(context);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
