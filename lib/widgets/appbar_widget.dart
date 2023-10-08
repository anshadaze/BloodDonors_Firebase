import 'package:blood_donation_app/constants.dart/contants.dart';
import 'package:blood_donation_app/helpers.dart/colors.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final leading;
  final action;

  AppBarWidget({
    super.key,
    required this.title,
    this.leading,
    this.action,
    
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Center(child: Text(title, style: kAppBarStyle)),
      actions: action,
      
      backgroundColor: appbarColor,
    );
  }
}
