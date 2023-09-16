import 'package:blood_donation_app/model/donors_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final CollectionReference firebaseDonors =
      FirebaseFirestore.instance.collection('donor');

  Future<List<Donor>> fetchDonors() async {
    final snapshot = await firebaseDonors.orderBy('name').get();
    return snapshot.docs.map((doc) {
      return Donor.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  void deleteDonor(String docId) {
    firebaseDonors.doc(docId).delete();
  }

  void addDonor(Donor donor) {
    final data = donor.toMap();
    firebaseDonors.add(data);
  }

  void updateDonor(Donor donor) {
    final data = donor.toMap();
    firebaseDonors.doc(donor.id).update(data);
  }
}
