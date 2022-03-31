import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirestoreServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  final CollectionReference fieldsCollection =
      FirebaseFirestore.instance.collection('Fields');

  addMeetingHistoryToFirestore(
      { @required Map<String, dynamic> fieldModel}) async {
    await fieldsCollection.doc(_auth.currentUser.uid).collection('meetings').add(fieldModel);
  }

  addMeetingHistoryToFirestoreGoogle(
      {@required Map<String, dynamic> fieldModel}) async {
    await fieldsCollection
        .doc(_googleSignIn.currentUser.id)
        .collection('meetings')
        .add(fieldModel);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get fieldsHistory =>
      fieldsCollection
          .doc(_auth.currentUser.uid)
          .collection('meetings')
          .snapshots();
}
