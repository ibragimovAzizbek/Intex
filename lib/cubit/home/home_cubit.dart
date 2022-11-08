// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:intex/data/services/beckend/products_service.dart';
import 'package:intex/data/services/location/get_location.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/products_model.dart';
import '../../main.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final formKey = GlobalKey<FormState>();

  String noImagePath =
      "https://images.unsplash.com/photo-1628155930542-3c7a64e2c833?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGltYWdlJTIwbm98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60";

  late ScrollController scrollCtx = ScrollController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  String initialCountry = 'UZ';

  PhoneNumber number = PhoneNumber(isoCode: 'UZ');

  int howManyProducts = 0;

  double totalAmount = 0;

  bool isFirstLoadRunning = false;

  bool hasNextPage = true;

  bool isLoadMoreRunning = false;

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

  clearNameAndNumberController() {
    nameController.clear();
    phoneNumberController.clear();
  }

  botSendMessage() async {
    return await teledart.sendMessage(
      812258141,
      "Name: ${nameController.text}\nTel: ${phoneNumberController.text}",
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

  paginationControllTrue() async {
    isFirstLoadRunning = true;
    emit(HomeInitial());
  }

  loadMore() {
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false) {
      isLoadMoreRunning = false;
      emit(HomeInitial());
      ProductService.inherentce.page++;
      List fetchPosts = ProductService.inherentce.getProducts() as List;
      isLoadMoreRunning = false;
      emit(HomeInitial());
    }
  }
}
