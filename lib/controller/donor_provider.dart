import 'package:blood_donation_app/model/donors_model.dart';
import 'package:blood_donation_app/services/firebase/firebase_services.dart';
import 'package:flutter/material.dart';

class DonorProvider extends ChangeNotifier {
  final FirebaseServices firebaseServices = FirebaseServices();
  String? selectedGroup;
  TextEditingController donorName = TextEditingController();
  TextEditingController donorPhone = TextEditingController();
  List<DonorModel> donors = [];

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
   final donor=DonorModel(
    id: "",
     name:donorName.text,
      phone: donorPhone.text,
       group: selectedGroup,
       );
     firebaseServices.addDonor( donor);
      await fetchDonors();
    notifyListeners();

  }

  void updateDonor(String docId) async { 
  final donor=DonorModel(
    id: docId,
     name:donorName.text,
      phone: donorPhone.text,
       group:selectedGroup
       );
       firebaseServices.updateDonor(donor);
    await fetchDonors();
    notifyListeners();
  }
}
