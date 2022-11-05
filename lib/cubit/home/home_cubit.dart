// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:intex/data/services/location/get_location.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/products_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  late ScrollController scrollCtx = ScrollController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController =
      TextEditingController(text: "+998 ");
  TextEditingController locationController = TextEditingController();
  String initialCountry = 'UZ';
  PhoneNumber number = PhoneNumber(isoCode: 'UZ');
  int howManyProducts = 0;
  double totalAmount = 0;

  var location;
  var address;

  List<Map<int, List<ProductsModel>>> lstProducts = [];

  bool hasCallSupport = false;
  Future<void>? launched;
  String phone = '+998994294143';
  String path = 'https://t.me/ibragimov_azizbekk';

  void scrollWidgets(double pixsel) {
    scrollCtx.animateTo(
      pixsel,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  changeLanguage(BuildContext context, String countryCode) async {
    await context.setLocale(
      countryCode == "Ru"
          ? const Locale('ru', 'RU')
          : countryCode == "Uz"
              ? const Locale('uz', 'UZ')
              : const Locale('en', 'US'),
    );
    emit(HomeInitial());
  }

  countTotalAmount(double price) {
    totalAmount = price * howManyProducts;
    emit(HomeInitial());
  }

  incrementProduct() {
    howManyProducts++;
    emit(HomeInitial());
  }

  reduceProduct() {
    howManyProducts != 0 ? howManyProducts-- : howManyProducts = 0;
    emit(HomeInitial());
  }

  changeInitialState() {
    emit(HomeInitial());
  }

  checkCallSupport(bool result) {
    hasCallSupport = result;
    emit(state);
  }

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  callButtonOnTap() {
    launched = makePhoneCall(phone);
  }

  Future<void> makeTelegramOpen(String path) async {
    if (!await launchUrl(
      Uri.parse(path),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $path';
    }
  }

  telegramOnTap() {
    launched = makeTelegramOpen(path);
  }

  Future<void> makeInstagramOpen(String path) async {
    if (!await launchUrl(
      Uri.parse(path),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $path';
    }
  }

  instagramOnTap() {
    launched = makeInstagramOpen(path);
  }

  getLocation() async {
    location = await GetLocation.determinePosition();
    address = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(location.latitude, location.longitude));

    locationController.clear();
    locationController.text = address[0].addressLine;
    emit(HomeInitial());
  }
}
