import 'package:blood_donation_app/helpers.dart/colors.dart';
import 'package:blood_donation_app/view/add_screen/add_screen.dart';
import 'package:blood_donation_app/widgets/appbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference donor=FirebaseFirestore.instance.collection('donor');
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor:appBackgroundColor,
        appBar: PreferredSize(
           preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(title: "Donors List",)),
          floatingActionButton: floatingActionButton(context),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            // body:StreamBuilder(
            //   stream: donor.snapshots(),
            //    builder: (context, snapshot) {
            //      if(snapshot.hasData){
            //        return ListView.builder(
            //         itemCount: snapshot.data.docs.length,
            //         itemBuilder: itemBuilder)
            //      }
            //      return Container();
            //    },),


      ),
    );
  }

  FloatingActionButton floatingActionButton(BuildContext context) {
    return FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddUserScreen(),));
          },
          backgroundColor:kWhiteColor ,
           shape: const CircleBorder(),
          child:const Icon(Icons.bloodtype,size: 40,color:appBackgroundColor,) ,
           
          );
  }
}

