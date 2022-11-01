import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/constants/color_const.dart';
import 'package:intex/cubit/home/home_cubit.dart';
import 'package:intex/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
