import 'package:blood_donation_app/services/firebase/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DonorProvider extends ChangeNotifier {

  final FirebaseServices firebaseServices = FirebaseServices();

  void fetchDonors() {
   firebaseServices.firebaseDonors.orderBy('name').snapshots().listen((snapshot) {
    firebaseServices.donors = snapshot.docs;
      notifyListeners();
    });
  }

  void deleteDonor(String docId) {
   firebaseServices.firebaseDonors.doc(docId).delete();
  }



    String? selectedGroup;
  TextEditingController donorName = TextEditingController();
  TextEditingController donorPhone = TextEditingController();

   void setSelectedGroup(String value) {
    selectedGroup = value;
    notifyListeners();
  }

   void addDonor() {
    final data = {
      'name': donorName.text,
      'phone': donorPhone.text,
      'group': selectedGroup
    };
   firebaseServices.firebaseDonors.add(data);
  }


    void updateDonor(String docId) {
    final data = {
      'name': donorName.text,
      'phone': donorPhone.text,
      'group': selectedGroup
    };
   firebaseServices.firebaseDonors.doc(docId).update(data);
  }
}


