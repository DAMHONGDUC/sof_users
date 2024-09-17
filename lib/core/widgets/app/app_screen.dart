import 'package:flutter/material.dart';
import 'package:sof_users/core/resources/app_colors.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white, //status bar color
      child: SafeArea(
        child: Scaffold(
          // drawer: const MainAppDrawer(),
          // appBar: _buildAppBar(isLandscape: isLandscape),
          // body: _buildBody(isLandscape: isLandscape),
          body: child,
        ),
      ),
    );
  }
}
