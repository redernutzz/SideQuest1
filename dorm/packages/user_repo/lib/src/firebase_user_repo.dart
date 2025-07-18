import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';  
import 'package:cloud_firestore/cloud_firestore.dart'; 
import 'package:rxdart/rxdart.dart';
import 'package:user_repo/src/models/user.dart';
import 'package:user_repo/src/user_repo.dart';
import 'package:user_repo/user_repository.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  
  @override
  // TO: implement user
  Stream<MyUser> get user {
    return _firebaseAuth.authStateChanges().flatMap((firebaseUser) async*{
      if(firebaseUser == null){
        yield MyUser.empty;
      } else {
        final docSnapshot = await usersCollection.doc(firebaseUser.uid).get();
        if (docSnapshot.exists) {
          final data = docSnapshot.data() as Map<String, dynamic>; // Explicit cast
          yield MyUser.fromEntity(MyUserEntity.fromDocument(data));
        } else {
          yield MyUser.empty;
        }
      }
    });
  }

  @override
  Future<void> signIn(String email, String password) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } catch(e) {
      log(e.toString());
      rethrow;
    }
  }
  
  @override
  Future<MyUser> signUp(MyUser myUser, String password) async{
    try{
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(email: myUser.email, password: password);

      myUser.userId = user.user!.uid;

      return myUser;

    } catch(e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> logOut() async{
    await _firebaseAuth.signOut();
  }
  
  @override
  Future<void> setUserData(MyUser myUser) async{
    try{
      await usersCollection
        .doc(myUser.userId)
        .set(myUser.toEntity().toDocument());
    } catch(e) {
      log(e.toString());
      rethrow;
    }

  }
  

  

}