

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/models/response_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
  static getUser({
    final String? email
  }){
    print(email);
    _Collection.where("email", isEqualTo: email).get().then(
  (querySnapshot) {
    print("Successfully completed");
    for (var docSnapshot in querySnapshot.docs) {
      // print('${docSnapshot.id} => ${docSnapshot.data()}');
    }
  },
  onError: (e) => print("Error completing: $e"),
);
  }
}