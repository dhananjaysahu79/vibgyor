import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future createUser(UserCredential userCreds) async {
  
  bool result = false;
  // First check user exist in our firestore database or not
  final user = await FirebaseFirestore
  .instance.collection('users')
  .doc(userCreds.user?.uid)
  .get()
  .then((DocumentSnapshot snapshot) => {
    if(snapshot.exists)       // If exist no need to create
    result = true
    else                      // If not exist create a user in database
    createUserInFirestore(userCreds).then((value) => {
      result = value
    }).onError((error, stackTrace) => {
      result = false
    })
  }).onError((error, stackTrace) => {
    result = false
  });

  return result;
}


// If there is a new user we will add a default data into the database
Future<bool> createUserInFirestore(UserCredential userCreds) async {
  bool result = false;

  return result;
}