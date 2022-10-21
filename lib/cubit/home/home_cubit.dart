// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:intex/data/services/location/get_location.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController =
      TextEditingController(text: "+998 ");
  TextEditingController locationController = TextEditingController();

  var location;
  var address;

  bool hasCallSupport = false;
  Future<void>? launched;
  String phone = '+998994294143';
  String path = 'https://t.me/ibragimov_azizbekk';

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
