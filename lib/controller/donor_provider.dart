import 'package:blood_donation_app/services/firebase/firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DonorProvider extends ChangeNotifier {
  final FirebaseServices firebaseServices = FirebaseServices();
  String? selectedGroup;
  TextEditingController donorName = TextEditingController();
  TextEditingController donorPhone = TextEditingController();
  List<DocumentSnapshot> donors = [];

  Future<void> fetchDonors() async {
    donors = await firebaseServices.fetchDonors();
    notifyListeners();
  }

  Future<void> deleteDonor(String docId) async {
    firebaseServices.deleteDonor(docId);
    await fetchDonors();
    notifyListeners();
  }

  void setSelectedGroup(String value) {
    selectedGroup = value;
    notifyListeners();
  }

  void addDonor() async {
    firebaseServices.addDonor(
      name: donorName.text,
      phone: donorPhone.text,
      selectedGroup: selectedGroup.toString(),
    );
    await fetchDonors();
    notifyListeners();
  }

  void updateDonor(String docId) async {
    firebaseServices.updateDonor(
      docId,
      name: donorName.text,
      phone: donorPhone.text,
      selectedGroup: selectedGroup.toString(),
    );
    await fetchDonors();
    notifyListeners();
  }
}
