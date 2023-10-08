import 'package:blood_donation_app/constants.dart/contants.dart';
import 'package:blood_donation_app/helpers.dart/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        hintStyle: kHintTextstyle,
        filled: true,
        fillColor: kWhiteColor,
        border: OutlineInputBorder(
          borderRadius: kRadius10,
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(
          color: kWhiteColor,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter name ';
        } else {
          return null;
        }
      },
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
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
      decoration: InputDecoration(
        hintText: "Phone Number",
        hintStyle: kHintTextstyle,
        filled: true,
        fillColor: kWhiteColor,
        border: OutlineInputBorder(
          borderRadius: kRadius10,
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(
          color: kWhiteColor,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter number';
        } else if (value.length != 10) {
          return 'Enter correct number';
        } else {
          return null;
        }
      },
    );
  }
}
