import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/cubit/home/home_cubit.dart';
import 'package:intex/routes/routes.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';

late TeleDart teledart;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  var botToken = '5664303071:AAG8lx4NcQYvhbJZixG-GJ8om1DhL1ObkPE';
  final username = (await Telegram(botToken).getMe()).username;
  print("Username: $username");
  teledart = TeleDart(botToken, Event(username!));

  teledart.start();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: EasyLocalization(supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('uz', 'UZ'),
        Locale('en', 'US'),
      ], path: 'assets/lang', child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConst.baseColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Intex Market',
      theme: ThemeData.light().copyWith(
        // primaryColor: ColorConst.baseBackground,
        // brightness: Brightness.light,
        backgroundColor: const Color(0xFFE5E5E5),
        colorScheme: ColorScheme.light(primary: ColorConst.baseBackground),
      ),
      initialRoute: '/home',
      onGenerateRoute: RouteCont.inherentce.onGenerateRoute,
    );
  }
}
