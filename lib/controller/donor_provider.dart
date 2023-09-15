import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DonorProvider extends ChangeNotifier {
  final CollectionReference firebaseDonors =
      FirebaseFirestore.instance.collection('donor');

  List<DocumentSnapshot> donors = [];

  void fetchDonors() {
    firebaseDonors.orderBy('name').snapshots().listen((snapshot) {
      donors = snapshot.docs;
      notifyListeners();
    });
  }

  void deleteDonor(String docId) {
    firebaseDonors.doc(docId).delete();
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
    firebaseDonors.add(data);
  }


    void updateDonor(String docId) {
    final data = {
      'name': donorName.text,
      'phone': donorPhone.text,
      'group': selectedGroup
    };
    firebaseDonors.doc(docId).update(data);
  }
}


