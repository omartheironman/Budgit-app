class Budgets{

  String text;
  String value;
  String spent;


  Budgets({this.text, this.value, this.spent});


  //Get the sum of all budgets
  double GetTotalValues(List<Budgets> budgets) {
    var total = 0.0;

    if (budgets != null) {
      for (var i = 0; i < budgets.length; i++) {
        total += double.parse(budgets[i].value);
      }
    } else {
      return 0.0;
    }

    return total;
  }

  //Get the sum of all spent
  double GetTotalSpent(List<Budgets> budgets) {
    var total = 0.0;


    for (var i = 0; i < budgets.length; i++) {
      total += double.parse(budgets[i].spent);

      return total;
    }
  }
}


class Cash {

  String cashValue;


  Cash({this.cashValue});

}
