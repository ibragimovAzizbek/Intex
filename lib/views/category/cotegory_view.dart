import 'package:flutter/material.dart';
import 'package:intex/core/widgets/app_bar_widget.dart';

class CategoryDataView extends StatelessWidget {
  CategoryDataView({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        homeContext: context,
        function: () {
          _key.currentState!.openDrawer();
        },
      ),
    );
  }
}
