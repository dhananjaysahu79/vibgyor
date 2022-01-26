import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io' as io;

import 'package:vibgyor/methods/getUser.dart';


Future<String> uploadImage(file) async {
    // get the userid to set the file name
    var userID = 'v4bcdbm6xINF0IEvYu1WuBCqoEE3';//await getUserID();
    var number = 1;   // how many number of setup a particular user has already uploaded.

    firebase_storage.UploadTask uploadTask;
    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('setups')
        .child('/${userID}_${number}.jpg');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});

    
      uploadTask = ref.putFile(io.File(file.path), metadata);

    var link = '';
    await ref.getDownloadURL().then((value) => {
      link = value
    });
    return link;
  }