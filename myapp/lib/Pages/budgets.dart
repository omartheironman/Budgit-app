class Budgets{

  String text;
  String value;


  Budgets({this.text, this.value});


  double GetTotalValues(List<Budgets> budgets) {
    var total = 0.0;

    for (var i = 0; i < budgets.length; i++) {
      total += double.parse(budgets[i].value);
    }

    print("Left to spend");
    print(total);
    return total;
  }



}


class Cash {

  String cashValue;


  Cash({this.cashValue});

}
