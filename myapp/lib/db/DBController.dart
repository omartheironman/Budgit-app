import 'package:cloud_firestore/cloud_firestore.dart';

class Dbcontroller {
  //Adding
  Future<void> AddBudget(Map<String, dynamic> data, String user) async {
    print(data);
    return Firestore.instance
        .collection('users')
        .document(user)
        .collection('Budgets')
        .add(data);
  }

  //Updates
  Future<void> UpdateBudget(
      String budgetName, String spentVal, String user) async {
    var userQuery = Firestore.instance
        .collection('users')
        .document('omarmoharrem')
        .collection('Budgets')
        .where('budgetName', isEqualTo: budgetName)
        .limit(1);
    userQuery.getDocuments().then((data) {
      if (data.documents.length > 0) {
        // setState(() {

        print(data.documents[0].documentID);
        Firestore.instance
            .collection('users')
            .document(user)
            .collection('Budgets')
            .document(data.documents[0].documentID)
            .updateData({'spent': spentVal});
//         firstName = data.documents[0].data['firstName'];
//         lastName = data.documents[0].data['lastName'];
        //});
      }
    });

    //return Firestore.instance.collection('users').document(user).collection('Budgets').document(userQuery.getDocuments().toString()).updateData({'spent':spentVal});
  }

  Future<void> UpdateAllocation(Map<String, dynamic> data, String user) async {
    // await  Firestore.instance.collection('users').document("OmarMoharrem").setData({'Allocation':cash.cashValue});

    return Firestore.instance.collection('users').document(user).setData(data);
  }
}
