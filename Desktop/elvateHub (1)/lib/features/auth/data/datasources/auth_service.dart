import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elvateHub/core/helpers/firebase_helper.dart';
import 'package:elvateHub/core/routes/common_import.dart';
import 'package:elvateHub/features/auth/data/models/user_model.dart';
import 'package:elvateHub/features/auth/domain/entities/user_entity.dart';

import '../../../../core/helpers/string_constant.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register user by email and password
  Future<UserModel> registerUser({
    required String name,
    required DateTime birtdate,
    required bool isActive,
    String? image,
    String? attachment,
    required String email,
    required String? password,
    required UserType type, // admin, user
    required String mobileNumber,
    required String categoryId,
    required Gender gender, // male, female
  }) async {
    try {
      UserModel userModel = UserModel(
        name: name,
        birthDate: birtdate,
        isActive: isActive,
        image: image,
        categoryId: categoryId,
        attachment: attachment,
        email: email,
        type: type,
        mobileNumber: mobileNumber,
        gender: gender,
        rate: 0,
        rateList: [],
      );
      // Create a user in FirebaseAuth
      if (password != null) {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        userModel = userModel.copyWith(
          id: userCredential.user!.uid,
        );

        // Prepare user data to store in Firestore
        if (attachment != null) {
          String attachmentUrl = await FirebaseHelper.uploadFile(
            file: File(attachment),
            userId: userModel.id ?? '',
            folderName: 'attachment',
          );
          userModel = userModel.copyWith(attachment: attachmentUrl);
        }

        if (image != null) {
          String imageUrl = await FirebaseHelper.uploadFile(
            file: File(image),
            userId: userModel.id ?? '',
            folderName: 'image',
          );
          userModel = userModel.copyWith(image: imageUrl);
        }

        // Store additional user data in Firestore
        await FirebaseHelper.postData(
          collection: userCollection,
          data: userModel.toJson(),
          doc: userCredential.user!.uid,
          updateUserImage: true,
        );
        AppController.instance.setLoggedIn(true);

        // await userCredential.user!.updateDisplayName('$firstName $lastName');
      } else {
        await FirebaseHelper.putData(
          collection: userCollection,
          documentId: FirebaseAuth.instance.currentUser?.uid ?? '',
          data: userModel.toJson(),
          updateUserImage: true,
        );
      }
      return userModel;

      // Optionally, you can also update Firebase Auth profile
    } on FirebaseAuthException catch (e) {
      throw Exception('Registration failed: ${e.message}');
    }
  }

  Future<UserModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // Create a user in FirebaseAuth
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store additional user data in Firestore
      DocumentSnapshot<Map<String, dynamic>> result = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      UserModel userModel = UserModel.fromJson(result.data() ?? {});
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw Exception('Registration failed: ${e.message}');
    }
  }
}
