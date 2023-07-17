import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class StorageMethods {
  final _storage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;

  Future<String> storeImage(
      {required bool ispost,
      required Uint8List image,
      required String folderName}) async {
    try {
      Reference ref =
          _storage.ref().child(folderName).child(_auth.currentUser!.uid);
      final UploadTask uploadImage = ref.putData(image);

      final snapshot = await uploadImage;

      String imageUrl =
          await snapshot.ref.getDownloadURL(); // pass this to user data
      debugPrint("Image Url");
      return imageUrl;
    } on Exception catch (e) {
      // TODO
      return "$e";
    }
  }
}
