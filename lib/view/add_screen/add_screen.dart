import 'package:blood_donation_app/constants.dart/contants.dart';
import 'package:blood_donation_app/helpers.dart/colors.dart';
import 'package:blood_donation_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final bloodGroups = ['A+', "A-", 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedGroup;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBarWidget(
              title: "Add Donors",
            )),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: donorNameField(),
            ),


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: phoneNumberField(),
            ),


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: dropDownButton(),
            ),


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: elevatedButton(),
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton elevatedButton() {
    return ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50)),
                    backgroundColor: MaterialStateProperty.all(kWhiteColor)),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 20, color:kRedColor,fontWeight:  FontWeight.bold),
                ));
  }

  Container dropDownButton() {
    return Container(
              decoration: BoxDecoration(
                borderRadius:kRadius10 ,
                color: kWhiteColor),
              child: DropdownButtonFormField(
                decoration:
                    const InputDecoration(
                      border: InputBorder.none,
                      label: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text('Select blood Group',style:TextStyle(color:kRedColor,fontSize: 17,fontWeight: FontWeight.bold ) ,),
                      )),
                items: bloodGroups
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,top: 5),
                            child: Text(item,style: const TextStyle(color: kRedColor,fontWeight: FontWeight.bold),),
                          ),
                        ))
                    .toList(),
                      dropdownColor:kWhiteColor,
                                 borderRadius:kRadius30,
                onChanged: (value) {
                  selectedGroup = value;
                },
              ),
            );
  }

  TextFormField phoneNumberField() {
    return TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 10,
                 decoration: InputDecoration(
                hintText: "Phone Number",hintStyle: const TextStyle(color:kRedColor,fontWeight: FontWeight.bold ),
                filled: true,
                fillColor: kWhiteColor,
                border: OutlineInputBorder(
                  borderRadius:kRadius10,
                  borderSide: BorderSide.none,
                ),
              ),
           
            );
  }

  TextFormField donorNameField() {
    return TextFormField(
              decoration: InputDecoration(
                hintText: "Donor Name",hintStyle: const TextStyle(color: kRedColor,fontWeight: FontWeight.bold),
                filled: true,
                fillColor: kWhiteColor,
                border: OutlineInputBorder(
                  borderRadius:kRadius10,
                  borderSide: BorderSide.none,
                ),
              ),
            );
  }
}