import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseServices {
  final CollectionReference firebaseDonors =
      FirebaseFirestore.instance.collection('donor');


  Future<List<DocumentSnapshot>> fetchDonors() async {
    final snapshot = await firebaseDonors.orderBy('name').get();
    return snapshot.docs;
  }

  void deleteDonor(String docId) {
    firebaseDonors.doc(docId).delete();
  }

  void addDonor({
    required String name,
    required String phone,
    required String selectedGroup,
  }) {
    final data = {'name': name, 'phone': phone, 'group': selectedGroup};
    firebaseDonors.add(data);
  }


      void updateDonor(
        String docId,
        {
          required String name,
          required String phone,
          required String selectedGroup,
        }) {
    final data = {
      'name': name,
      'phone': phone,
      'group': selectedGroup
    };
   firebaseDonors.doc(docId).update(data);
  }
}
