import 'package:appmanager/database/debt_DB/graphDebt_data.dart';
import 'package:appmanager/models/graph/graphModel.dart';

class graphDebtModel{
  double currentBlance, monthlyPayment, interestRate, monthlyCharges, payoffGoal;

  graphDebtModel({ required this.currentBlance, required this.monthlyPayment, required this.interestRate, required this.payoffGoal, required this.monthlyCharges});

}