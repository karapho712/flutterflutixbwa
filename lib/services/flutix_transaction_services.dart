part of 'services.dart';

class FlutixTransactionServices {
  static CollectionReference transactionCollection = FirebaseFirestore.instance.collection('transactions');

  static Future<void> saveTransaction(FlutixTransaction flutixTransaction) async {
    // COBA1, PAKE RETURN BILA INI MASIH ADA BERARTI BENAR (SAAT INI SALAH)
    await transactionCollection
        .doc()
        .set({
          'userID': flutixTransaction.userID,
          'title': flutixTransaction.title,
          'subtitle': flutixTransaction.subtitle,
          'time': flutixTransaction.time.millisecondsSinceEpoch,
          'amount': flutixTransaction.amount,
          'picture': flutixTransaction.picture
        })
        .then((value) => print("Data Added, DAN TELAH SELESAI"))
        .catchError((error) => print("Failed to add data: $error"));
  }

  static Future<List<FlutixTransaction>> getTransaction(String userID) async {
    QuerySnapshot snapshot = await transactionCollection.get();

    // print(snapshot);

    var documents = snapshot.docs.where((document) => document['userID'] == userID);

    // print(documents);

    // return documents;

    return documents
        .map((e) => FlutixTransaction(
            userID: e['userID'],
            title: e['title'],
            subtitle: e['subtitle'],
            time: DateTime.fromMillisecondsSinceEpoch(e['time']),
            amount: e['amount'],
            picture: e['picture']))
        .toList();
  }
}
