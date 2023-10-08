import 'package:blood_donation_app/constants.dart/booldgroups.dart';
import 'package:blood_donation_app/controller/donor_provider.dart';
import 'package:blood_donation_app/helpers.dart/colors.dart';
import 'package:blood_donation_app/view/update_screen/widgets/dropdown_widget.dart';
import 'package:blood_donation_app/view/update_screen/widgets/updatebutton_widget.dart';
import 'package:blood_donation_app/widgets/appbar_widget.dart';
import 'package:blood_donation_app/widgets/filed_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final donorProvider = Provider.of<DonorProvider>(context);
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    donorProvider.donorName.text = args['name'];
    donorProvider.donorPhone.text = args['phone'];
    donorProvider.selectedGroup = args['group'];
    final docId = args['id'];

    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarWidget(
              title: "Edit Donors",
              leading:IconButton(onPressed: (){Navigator.of(context).pop();}, icon:const Icon(Icons.arrow_back_outlined,color: kWhiteColor,)),
               action: [Icon(Icons.abc,color: kRedColor,),Icon(Icons.abc,color: kRedColor,),],
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
                child: updateScreenDrodown(
                    donorProvider: donorProvider, bloodGroups: bloodGroups),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: UpdateButton(
                    donorProvider: donorProvider,
                    docId: docId,
                    formkey: formkey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
