import '../graph/graphModel.dart';

class BarModel{
  final double sumAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  BarModel({
    required this.sumAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount,
});
  List<graphModel> barData = [];

  void graphDebtData(){
    barData = [
      graphModel(x: 0, y: sumAmount),
      graphModel(x: 0, y: monAmount),
      graphModel(x: 0, y: tueAmount),
      graphModel(x: 0, y: wedAmount),
      graphModel(x: 0, y: thurAmount),
      graphModel(x: 0, y: friAmount),
      graphModel(x: 0, y: satAmount),
    ];
  }
}