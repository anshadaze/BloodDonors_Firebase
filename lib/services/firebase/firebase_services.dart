import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseServices{
   final CollectionReference firebaseDonors =
      FirebaseFirestore.instance.collection('donor');


      List<DocumentSnapshot> donors= [];
}