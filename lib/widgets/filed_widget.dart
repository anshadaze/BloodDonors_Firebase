import 'package:blood_donation_app/constants.dart/contants.dart';
import 'package:blood_donation_app/helpers.dart/colors.dart';
import 'package:flutter/material.dart';

class DonorNameField extends StatelessWidget {
  const DonorNameField({
    super.key,
    required this.donorNameController,
  });

  final TextEditingController donorNameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: donorNameController,
      decoration: InputDecoration(
        hintText: "Donor Name",
        hintStyle: const TextStyle(
            color: kRedColor, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: kWhiteColor,
        border: OutlineInputBorder(
          borderRadius: kRadius10,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}


class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    required this.donorPhoneController,
  });

  final TextEditingController donorPhoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: donorPhoneController,
      keyboardType: TextInputType.number,
      maxLength: 10,
      decoration: InputDecoration(
        hintText: "Phone Number",
        hintStyle: const TextStyle(
            color: kRedColor, fontWeight: FontWeight.bold),
        filled: true,
        fillColor: kWhiteColor,
        border: OutlineInputBorder(
          borderRadius: kRadius10,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

