import 'package:blood_donation_app/model/donors_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final CollectionReference firebaseDonors =
      FirebaseFirestore.instance.collection('donor');

  Future<List<DonorModel>> fetchDonors() async {
    final snapshot = await firebaseDonors.orderBy('name').get();
    return snapshot.docs.map((doc) {
      return DonorModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  void deleteDonor(String docId) {
    firebaseDonors.doc(docId).delete();
  }

  void addDonor(DonorModel donor) {
    final data = donor.toMap();
    firebaseDonors.add(data);
  }

  void updateDonor(DonorModel donor) {
    final data = donor.toMap();
    firebaseDonors.doc(donor.id).update(data);
  }
}
