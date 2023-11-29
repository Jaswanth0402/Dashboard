

// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard_task/data/models/user_model.dart';

import '../../../data/models/response_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// ignore: non_constant_identifier_names
final CollectionReference _Collection = _firestore.collection('user');
class FirebaseMethods{


static Future<Response> addUser ({
    required String name,
    required String image,
    required String email,
    required String contact,
    required String password,

  })async{

     Response response =Response();
     DocumentReference documentReference =_Collection.doc();

     Map<String,dynamic> data =<String,dynamic>{
      "username" :name,
      "image":image,
      'email':email,
      'contact_no':contact,
      'password':password
     };
     // ignore: unused_local_variable
     var result =await documentReference
     .set(data)
     .whenComplete((){
      response.code =200;
      response.message='Sucessfully added';
     })
     .catchError((e){
      response.code =500;
      response.message =e;
        
     });
    return response;
  }
  static Stream<QuerySnapshot> getUser({
    final String? email
  }){
   
    print('email:$email');
    return
    _Collection.where("email", isEqualTo: email).snapshots();
//     .get().then(
//   (querySnapshot) {
//     print("Successfully completed");
//     // for (var docSnapshot in querySnapshot.docs) {
//     //   print('${docSnapshot.id} => ${docSnapshot.data()}');
//     // }
//      user = querySnapshot.docs[0].data();
  
   
//   },
  
//   onError: (e) => print("Error completing: $e"),
// );

  }
}