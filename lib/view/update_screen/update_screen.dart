import 'package:blood_donation_app/constants.dart/contants.dart';
import 'package:blood_donation_app/helpers.dart/colors.dart';
import 'package:blood_donation_app/widgets/appbar_widget.dart';
import 'package:blood_donation_app/widgets/filed_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<UpdateScreen> { 
  final bloodGroups = ['A+', "A-", 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedGroup;
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

      TextEditingController donorName=TextEditingController();
       TextEditingController donorPhone=TextEditingController();

       void updateDonor(docId){
        final data={
          'name':donorName.text,
          'phone':donorPhone.text,
          'group':selectedGroup
        };
        donor.doc(docId).update(data);

       }

  @override
  Widget build(BuildContext context) {
    final args= ModalRoute.of(context)!.settings.arguments as Map;
    donorName.text=args['name'];
     donorPhone.text=args['phone'];
    selectedGroup=args['group'];
    final docId=args['id']; 

    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarWidget(
              title: "Edit Donors",
            )),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: DonorNameField(donorNameController: donorName),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: PhoneNumberField(donorPhoneController: donorPhone),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: kRadius10, color: kWhiteColor),
                child: DropdownButtonFormField(
                  value: selectedGroup,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      label: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Select blood Group',
                          style: TextStyle(
                              color: kRedColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  items: bloodGroups
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15, top: 5),
                              child: Text(
                                item,
                                style: const TextStyle(
                                    color: kRedColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ))
                      .toList(),
                  dropdownColor: kWhiteColor,
                  borderRadius: kRadius30,
                  onChanged: (value) {
                      selectedGroup = value;
                   
                    
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    updateDonor(docId);
                  },
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          const Size(double.infinity, 50)),
                      backgroundColor: MaterialStateProperty.all(kWhiteColor)),
                  child: const Text(
                    "Update",
                    style: TextStyle(
                        fontSize: 20,
                        color: kRedColor,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

