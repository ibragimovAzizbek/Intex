import 'package:flutter/material.dart';

import '../constants/color_const.dart';

alertDiologOrderAProduct(BuildContext context, String text) => showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            child: Container(
              width: 362,
              height: 573,
              color: ColorConst.accentColor,
            ),
          );
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
        },
      ),
    );
