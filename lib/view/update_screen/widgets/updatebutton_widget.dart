import 'package:blood_donation_app/controller/donor_provider.dart';
import 'package:blood_donation_app/helpers.dart/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateButton extends StatefulWidget {
  const UpdateButton({
    super.key,
    required this.donorProvider,
    required this.docId,
    required this.formkey,
  });

  final GlobalKey<FormState> formkey;
  final DonorProvider donorProvider;
  final docId;

  @override
  State<UpdateButton> createState() => _UpdateButtonState();
}

class _UpdateButtonState extends State<UpdateButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (widget.formkey.currentState!.validate()) {
            Navigator.pop(context);
            widget.donorProvider.updateDonor(widget.docId);
          }
        },
        style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all(const Size(double.infinity, 50)),
            backgroundColor: MaterialStateProperty.all(kWhiteColor)),
        child: const Text(
          "Update",
          style: TextStyle(
              fontSize: 20, color: kRedColor, fontWeight: FontWeight.bold),
        ));
  }
}
