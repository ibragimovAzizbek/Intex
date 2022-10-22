import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/cubit/home/home_cubit.dart';
import 'package:intex/views/no_internet_view/no_internet_view.dart';

class BaseView<T> extends StatefulWidget {
  final T? viewModel;
  final Widget Function(BuildContext context, T value)? onPageBuilder;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  const BaseView({
    Key? key,
    required this.viewModel,
    required this.onPageBuilder,
    this.onModelReady,
    this.onDispose,
  }) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  dynamic subscription;
  dynamic internetStatus;

  @override
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        internetStatus = result;
      });
    });
    if (widget.onModelReady != null) widget.onModelReady!(widget.viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return internetStatus == ConnectivityResult.none
        ? const NoInternetView()
        : widget.onPageBuilder!(
            context,
            widget.viewModel,
          );
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }
}
