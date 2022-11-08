import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/components/eleveted_button.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/core/widgets/classic_text.dart';
import 'package:intex/cubit/home/home_cubit.dart';

import '../widgets/input_filed_name_phone_number.dart';

alertDiologOrderAProduct(BuildContext context, String text) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorConst.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Center(
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    classicText('your_order'.tr(), color: ColorConst.textColor),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.17),
              IconButton(
                icon: Image.asset('assets/icons/baseColorX.png'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        titlePadding:
            EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.13),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.65,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                divider(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 72,
                      width: 76,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConst.dividerColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      
                      child: Image.asset(
                        'assets/images/karkasniybaseyn.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: classicText(
                            "Каркасный прямоугольный бассейн 260х160х65см, 2282л",
                            size: FontConst.smallFont,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005),
                        classicText(
                          "260х160х65см, 2282л",
                          size: FontConst.smallFont,
                          color: ColorConst.textColor,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005),
                        Wrap(
                          children: [
                            InkWell(
                              child: SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset(
                                  'assets/icons/minus.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              onTap: () {
                                context.read<HomeCubit>().reduceProduct();
                              },
                            ),
                            Container(
                              height: 23,
                              width: 30,
                              color: ColorConst.skyDarck,
                              alignment: Alignment.center,
                              child: classicText(
                                context
                                    .watch<HomeCubit>()
                                    .howManyProducts
                                    .toString(),
                                size: FontConst.smallFont,
                              ),
                            ),
                            InkWell(
                              child: SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset(
                                  'assets/icons/plus.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              onTap: () {
                                context.read<HomeCubit>().incrementProduct();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Image.asset('assets/icons/greyX.png'),
                          onPressed: () {
                            // ? Tavarni o'chirish uchun lekin meni fikrimcha bu kerak emas
                          },
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.027),
                        classicText(
                          "1 290 000 сум",
                          color: ColorConst.accentColor,
                          size: FontConst.smallFont,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02)
                      ],
                    )
                  ],
                ),
                divider(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Wrap(
                  children: [
                    classicText(
                      'total_amount'.tr(),
                      size: FontConst.meduimFont - 2,
                      fontWeight: FontWeight.normal,
                    ),
                    classicText(
                      " ${context.watch<HomeCubit>().totalAmount} ${'currency_name'.tr()}",
                      size: FontConst.meduimFont - 2,
                      color: ColorConst.grey,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                divider(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                NameAndPhonenumberInputFiled(width: 0.9),
                classicText("address".tr(), size: FontConst.meduimFont),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.075,
                  child: TextFormField(
                    controller: context.watch<HomeCubit>().locationController,
                    cursorColor: ColorConst.grey,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "input_address".tr(),
                      hintStyle: TextStyle(color: ColorConst.skyDarck),
                      suffixIcon: IconButton(
                        icon: SizedBox(
                          child: Image.asset('assets/icons/Location.png'),
                        ),
                        onPressed: () {
                          context.read<HomeCubit>().getLocation();
                        },
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConst.textformBorderColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.016),
                elevatedButtonBig(context, 'order'.tr(), () {
                  // !
                  Navigator.pop(context);
                }),
              ],
            ),
          ),
        ),
        insetPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01),
      ),
    );

Divider divider() {
  return Divider(
    thickness: 1,
    color: ColorConst.dividerColor,
    height: 1,
  );
}

// Container(
//     color: ColorConst.baseBackground,
//     height: MediaQuery.of(context).size.height * 0.3,
//     width: MediaQuery.of(context).size.width * 0.9,
//     child: classicText(text));
// return AlertDialog(
//   shape:
//       RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//   title: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       classicText(text, color: ColorConst.textColor),
// IconButton(
//   icon: Image.asset('assets/icons/baseColorX.png'),
//   onPressed: () {
//     Navigator.pop(context);
//   },
// ),
//     ],
//   ),
//   content: Column(
//     children: [
//       Divider(thickness: 1, color: ColorConst.dividerColor),
//       Row(
//         children: [
//           Container(
//             height: 72,
//             width: 76,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               border: Border.all(color: ColorConst.dividerColor),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: CachedNetworkImage(
//               imageUrl:
//                   "https://media.istockphoto.com/photos/blue-portable-outdoor-round-swimming-water-pool-with-ladder-3d-picture-id646435568?b=1&k=20&m=646435568&s=170667a&w=0&h=DY00n234YNjTwkxSa9Z83YJyzLXE7Ei2_rZVsTsl_vc=",
//               fit: BoxFit.cover,
//             ),
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 width: 700,
//                 child: classicText(
//                   "Каркасный прямоугольный\nбассейн 260х160х65см, 2282л",
//                   color: ColorConst.grey,
//                   size: FontConst.smallFont,
//                 ),
//               ),
//             ],
//           )
//         ],
//       )
//     ],
//   ),

// icon: IconButton(
//   icon: Image.asset('assets/icons/cancel.png'),
//   onPressed: () {
//     Navigator.pop(context);
//   },
// ),
// iconPadding:
//     EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.7),
// backgroundColor: ColorConst.backgroundColor,
// shape:
//     RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
// content: SingleChildScrollView(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       Container(
//         width: MediaQuery.of(context).size.width * 0.8,
//         height: MediaQuery.of(context).size.height * 0.2,
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(35),
//             topRight: Radius.circular(35),
//             bottomRight: Radius.circular(35),
//           ),
//           color: ColorConst.white,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             classicText(text, color: ColorConst.primaryColor),
//             Image.asset(
//               'assets/images/bassen.png',
//             ), // ! MASULAT RASIMI BECK-END'dan keladi
//           ],
//         ),
//       ),
//       SizedBox(height: MediaQuery.of(context).size.height * 0.02),
//       Center(
//         child: classicText(
//           '1.390.000 ${"currency_name".tr()}',
//         ), // ! MASULAT NARXI BECK-END'dan keladi
//       ),
//       SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//       Form(
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.048,
//               width: MediaQuery.of(context).size.width * 0.8,
//               child: textFormFiled(
//                 "name".tr(),
//                 context.watch<HomeCubit>().nameController,
//               ),
//             ),
//             SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.01),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.048,
//               width: MediaQuery.of(context).size.width * 0.8,
//               child: textFormFiled(
//                 "phoneNumber".tr(),
//                 context.watch<HomeCubit>().phoneNumberController,
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//             SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.01),
//             Row(
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.05,
//                   width: MediaQuery.of(context).size.width * 0.5,
//                   child: textFormFiled(
//                     "address".tr(),
//                     context.watch<HomeCubit>().locationController,
//                     keyboardType: TextInputType.streetAddress,
//                   ),
//                 ),
//                 IconButton(
//                   iconSize:
//                       MediaQuery.of(context).size.width * 0.15,
//                   icon: SizedBox(
//                     height:
//                         MediaQuery.of(context).size.height * 0.043,
//                     width: MediaQuery.of(context).size.width * 0.4,
//                     child: Image.asset(
//                       'assets/icons/location.png',
//                       fit: BoxFit.cover,
//                       width:
//                           MediaQuery.of(context).size.width * 0.2,
//                     ),
//                   ),
//                   onPressed: () async {
//                     await context.read<HomeCubit>().getLocation();
//                     // showDialog(
//                     //   context: context,
//                     //   builder: (context) => SizedBox(
//                     //     height: MediaQuery.of(context).size.height * 0.005,
//                     //     child: const AlertDialog(
//                     //       content: Center(
//                     //         child: CircularProgressIndicator
//                     //             .adaptive(),
//                     //       ),
//                     //     ),
//                     //   ),
//                     // );
//                     // Navigator.pop(context);
//                   },
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//       ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: ColorConst.primaryAmber,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         child: classicText("order".tr()),
//         onPressed: () {
//           Navigator.pop(context);
//           checkAlertDiolog(context);
//         },
//       ),
//     ],
//   ),
// ),
// );
