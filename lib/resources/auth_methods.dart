import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:insta_clone/resources/stoarge_methods.dart';
import 'package:insta_clone/models/user_model.dart' as model;

class AuthMethods {
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String userBio,
    required Uint8List image,
  }) async {
    String returnedString = "Error Occured";
    try {
      // Signing Up with Email and password

      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Saving image in the storage
      // TODO : 1check for input , store image on storage
      final imageUrl = await StorageMethods().storeImage(
          ispost: false, image: image, folderName: 'user_profile_pictures');

      model.User user = model.User(
          email: email,
          password: password,
          username: username,
          userBio: userBio,
          imageUrl: imageUrl,
          uid: userCred.user!.uid,
          followers: [],
          following: []);

      // add user to data base

      await _firestore.collection('users').doc(userCred.user!.uid).set(
        //data to be passed in key value pair
        user.userToJsonMap(user)
      );
      returnedString = "success";
    } on FirebaseAuthException catch (err) {
      if (err.code == 'email-already-in-use') {
        returnedString = "Email already in use typerd by me";
      }
    } catch (e) {
      returnedString = "$e";
      // TODO
    }
    return returnedString;
  }

// loggin user

  Future<String> loginUserWithEmailPassword(
      {required String email, required String password}) async {
    String returnedString = "An Error Occured";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        returnedString = "success";
      }
    } on Exception catch (e) {
      // TODO
      returnedString = "$e";
    }
    return returnedString;
  }
}
