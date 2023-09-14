import 'package:blood_donation_app/helpers.dart/colors.dart';
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

  void deleteDonor(docid){
    donor.doc(docid).delete();

  }
  @override
  Widget build(BuildContext context) {
      final Size size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        backgroundColor:appBackgroundColor,
        appBar: PreferredSize(
           preferredSize: const Size.fromHeight(50),
          child: AppBarWidget(title: "Donors List",)),
          floatingActionButton: floatingActionButton(context),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            body:StreamBuilder(
              stream: donor.orderBy('name') .snapshots(),
               builder: (context,AsyncSnapshot snapshot) {
                 if(snapshot.hasData){
                   return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder:(context, index) {
                      final DocumentSnapshot donorSnap=snapshot.data.docs[index];
                      return
                       Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Container(
                          height: size.height*0.1,
                       
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(15),
                             color: kWhiteColor,
                            boxShadow:const [ BoxShadow(color:Colors.black26,blurRadius: 4,spreadRadius: 5)],
                             
                          ),
                                             
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CircleAvatar(
                                  backgroundColor: kRedColor,
                                  radius: 30,
                                  child: Text(donorSnap['group'],style: const TextStyle(color: kWhiteColor,fontWeight: FontWeight.bold,fontSize: 25),),
                                                     
                                  ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(donorSnap['name'],style: const TextStyle(color:kRedColor,fontWeight: FontWeight.bold,fontSize: 20),),
                                  Text(donorSnap['phone'].toString(),style: TextStyle(color: kRedColor,fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                   Navigator.pushNamed(context, '/UpdateScreen',
                                   arguments: {
                                    'name':donorSnap['name'],
                                    'phone':donorSnap['phone'].toString(),
                                    'group':donorSnap['group'],
                                    'id':donorSnap.id
                                   }
                                   );
                                  }, icon:const Icon(Icons.edit),iconSize: 25,color: kRedColor,),
                                  IconButton(onPressed: (){
                                   deleteDonor(donorSnap.id);

                                  }, icon:const Icon(Icons.delete),iconSize: 25,color: kRedColor,)
                                ],
                              )
                            ],
                          ),
                                             ),
                       );
                    },);
                 }
                 return Container();
               },),


      ),
    );
  }

  FloatingActionButton floatingActionButton(BuildContext context) {
    return FloatingActionButton(
          onPressed: (){
           Navigator.pushNamed(context, '/AddScreen');
          },
          backgroundColor:kWhiteColor ,
           shape: const CircleBorder(),
          child:const Icon(Icons.bloodtype,size: 40,color:appBackgroundColor,) ,
           
          );
  }
}

