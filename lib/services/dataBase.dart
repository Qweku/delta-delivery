// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delta/model/cartModel.dart';

class DbServices {
  final String uid;
  DbServices({this.uid = ''});

  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('carts');

  Future cartDataUpdate(
      String price, String itemName, String count, String itemImage) async {
    return await cartCollection.doc(uid).set({
      'price': price,
      'itemName': itemName,
      'count': count,
      'itemImage': itemImage,
    });
  }

  List<CartModel> _cartFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return CartModel(
        itemName: doc.get('itemName') ?? '',
        itemCount: doc.get('count') ?? '',
        itemImage: doc.get('itemImage') ?? '',
        itemPrice: doc.get('price') ?? '',
      );
    }).toList();
  }

  CartData _cartDataFromSnapshot(DocumentSnapshot snapshot) {
    return CartData(
      itemName: snapshot.get('itemName') ?? '',
      itemCount: snapshot.get('count') ?? '',
      itemImage: snapshot.get('itemImage') ?? '',
      itemPrice: snapshot.get('price') ?? '',
      uid: uid,
    );
  }

  Stream<List<CartModel>> get carts {
    return cartCollection.snapshots().map(_cartFromSnapshot);
  }

  Stream<CartData> get cartData {
    return cartCollection.doc(uid).snapshots().map(_cartDataFromSnapshot);
  }
}
