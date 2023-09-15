import 'package:blood_donation_app/controller/donor_provider.dart';
import 'package:blood_donation_app/helpers.dart/colors.dart';
import 'package:blood_donation_app/view/add_screen/widgets/dropdownbutton_widget.dart';
import 'package:blood_donation_app/view/add_screen/widgets/submitbutton_widget.dart';
import 'package:blood_donation_app/widgets/appbar_widget.dart';
import 'package:blood_donation_app/widgets/filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final donorProvider = Provider.of<DonorProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarWidget(
              title: "Add Donors",
            )),
        body: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: DonorNameField(
                    donorNameController: donorProvider.donorName),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: PhoneNumberField(
                    donorPhoneController: donorProvider.donorPhone),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Dropdown(donorProvider: donorProvider),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SubmitButton(
                    formkey: formkey, donorProvider: donorProvider),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
