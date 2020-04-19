import 'package:cloud_firestore/cloud_firestore.dart';
import '../Pages/budgets.dart';

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


  //Delete a budget
  Future<void> DeleteBudget(String budgetName, String user) async {
    //Fetch first the allocation
    var userQuery = Firestore.instance
        .collection('users')
        .document(user)
        .collection('Budgets')
        .where('budgetName', isEqualTo: budgetName)
        .limit(1);


    //if we have data back then delete it
    userQuery.getDocuments().then((data) {
      if (data.documents.length > 0) {
        // setState(() {

        print(data.documents[0].documentID);
        Firestore.instance
            .collection('users')
            .document(user)
            .collection('Budgets')
            .document(data.documents[0].documentID)
            .delete();
      }
    });
  }


  Future<Map<String, dynamic>> GetBudgets(String user) async {
    Map<String, dynamic> dataReturned = new Map<String, dynamic>();

    //Fetch first the allocation
    var userQuery = Firestore.instance
        .collection('users')
        .document(user);


    List<Budgets> budgets = new List<Budgets>();

    //if we have data back then delete it
    await userQuery.collection('Budgets').getDocuments().then((data) {
      if (data.documents.length > 0) {
//        Map<dynamic, dynamic> yearMap = data;
//        yearMap.forEach((key, value) {
//          //years.add(Year.fromJson(key, value));
//        });
        // print(data.documents[0].data.forEach(f));
        //data.documents[0].data.forEach((key, value) {
        //years.add(Year.fromJson(key, value));
        for (int i = 0; i < data.documents.length; i++) {
          print("spent " + data.documents[i].data['spent']);
          print("budgetName " + data.documents[i].data['budgetName']);
          print("BudgetValue " + data.documents[i].data['budgetValue']);
          budgets.add(Budgets(text: data.documents[i].data['budgetName'],
              value: data.documents[i].data['budgetValue'],
              spent: data.documents[i].data['spent']));
        }

        Cash cashInHand;

        userQuery.get().then((data) {
          if (data.data.length > 0) {
            cashInHand = new Cash(cashValue: data.data["Allocations"]);
            //print(data.data["Allocations"]);
          }
        });


        //print(budgets);
        dataReturned['Budgets'] = budgets;
        // print(dataReturned);


        // });
        //print("Data returned" + dataReturned['Budgets']);

      }

      return dataReturned;
      //print("Data returned" + dataReturned['Allocation']);
    });

    Cash cashInHand;

    await userQuery.get().then((data) {
      if (data.data.length > 0) {
        cashInHand = new Cash(cashValue: data.data["Allocations"]);
        //print(data.data["Allocations"]);
      }
      dataReturned['Allocation'] = cashInHand;
    });

//    print("Data returned" + dataReturned['Allocations']);
//    return dataReturned;
    return dataReturned;
  }

}


