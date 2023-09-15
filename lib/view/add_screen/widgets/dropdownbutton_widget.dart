import 'package:blood_donation_app/constants.dart/booldgroups.dart';
import 'package:blood_donation_app/constants.dart/contants.dart';
import 'package:blood_donation_app/controller/donor_provider.dart';
import 'package:blood_donation_app/helpers.dart/colors.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  Dropdown({
    super.key,
    required this.donorProvider,
  });

  final DonorProvider donorProvider;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: kWhiteColor,
        border: OutlineInputBorder(
          borderRadius: kRadius10,
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(color: kWhiteColor),
        hintText: 'Select Blood Group',
        hintStyle: kHintTextstyle,
      ),
      items: bloodGroups
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                      color: kRedColor, fontWeight: FontWeight.bold),
                ),
              ))
          .toList(),
      dropdownColor: kWhiteColor,
      borderRadius: kRadius30,
      onChanged: (value) {
        donorProvider.selectedGroup = value;
      },
      validator: (value) {
        if (value == null) {
          return "Select Blood Group";
        } else {
          return null;
        }
      },
    );
  }
}
