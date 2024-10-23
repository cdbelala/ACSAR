import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference usersColl = firestore.collection('Courses');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
