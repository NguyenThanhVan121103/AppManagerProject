import 'package:appmanager/common_widgets/widget/textfield/textFieldInput.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/controller/debt/debtController.dart';
import 'package:appmanager/database/debt_DB/goalDebt_data.dart';
import 'package:appmanager/database/debt_DB/graphDebt_data.dart';
import 'package:appmanager/models/debt/barModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';

class DebtPageView extends StatefulWidget {
  const DebtPageView({super.key});

  @override
  State<DebtPageView> createState() => _DebtPageViewState();
}

class _DebtPageViewState extends State<DebtPageView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorGoal = GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorSchedule = GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorGraphs = GlobalKey<RefreshIndicatorState>();
  late String _selectedDate = DateFormat.yMd().format(DateTime.now());



  @override
  Widget build(BuildContext context) {
    BarModel myBarData = BarModel(
        sumAmount: graphDebtData[0].currentBlance,
        monAmount:graphDebtData[1].currentBlance,
        tueAmount: graphDebtData[2].currentBlance,
        wedAmount: graphDebtData[3].currentBlance,
        thurAmount: graphDebtData[4].currentBlance,
        friAmount: graphDebtData[5].currentBlance,
        satAmount: graphDebtData[6].currentBlance,
    );
    myBarData.graphDebtData();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const MAppBar(
          title: Text("Debt", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white
          ),),
          showBackArrows: true,
          backgroundColor: MColor.primary,
          iconColor: Colors.white,
          showTabBar: true,
          title1: "Goal",
          title2: "Schedule",
          title3: "Graphs",
          heightAppBar: 100,

        ),
        body: TabBarView(children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(child: TextFieldInput(title: "Current balance", fontWeightTitle: FontWeight.normal, fontSizeTitle: 16,
                      controller: goalDebtController.currentBalanceController = TextEditingController(text: "${goalDebtData[0].currentBlance}"),
                    )),
                    SizedBox(width: 8,),
                    Flexible(child: TextFieldInput(title: "Monthly payment", fontWeightTitle: FontWeight.normal, fontSizeTitle: 16,
                      controller: goalDebtController.monthlyPaymentController = TextEditingController(text: "${goalDebtData[0].monthlyPayment}"),
                    )),
                  ],
                ),

                const SizedBox(height: 16,),
                const Divider(height: 0,),

                Row(
                  children: [
                    Flexible(child: TextFieldInput(title: "Interest rate (APR)", fontWeightTitle: FontWeight.normal, fontSizeTitle: 16,
                      controller: goalDebtController.interestRateController = TextEditingController(text: "${goalDebtData[0].interestRate}"),

                    ),),
                    SizedBox(width: 8,),
                    Flexible(child: TextFieldInput(title: "Monthly charges", fontWeightTitle: FontWeight.normal, fontSizeTitle: 16,
                      controller: goalDebtController.monthlyChargesController = TextEditingController(text: "${goalDebtData[0].monthlyCharges}"),
                    )),
                  ],
                ),

                const SizedBox(height: 16,),
                const Divider(height: 0,),

                Row(
                  children: [
                    Flexible(child: TextFieldInput(title: "Payoff goal (in month)", fontWeightTitle: FontWeight.normal, fontSizeTitle: 16,
                      controller: goalDebtController.payoffGoalController = TextEditingController(text: "${goalDebtData[0].payoffGoal}"),
                    )),
                    SizedBox(width: 8,),
                    Flexible(child: TextFieldInput(title: "Start date", fontWeightTitle: FontWeight.normal, fontSizeTitle: 16,
                      iconButton: Iconsax.calendar, onPressed: _getDateFormUser,
                      controller: goalDebtController.startDateController = TextEditingController(text: _selectedDate),

                    )),
                  ],
                ),

                const SizedBox(height: 16,),
                const Divider(height: 0,),

                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: const Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey),
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                  ),
                  child:  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                  Text("Total interest:"),
                                  Text("Total interest:"),
                                  Text("Saving:"),
                                  Text("Payoff early by:"),
                                  Text("New pay of date:"),
                        ],
                      ),
                      SizedBox(width: 60,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${goalDebtData[0].interestRate}"),
                          Text("${goalDebtData[0].interestRate}"),
                          Text("${goalDebtData[0].currentBlance}"),
                          Text("55 months"),
                          Text(_selectedDate),

                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(12),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text("#", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                  SizedBox(width: 71 , child: Text("Payment", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                  Text("Principal", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  Text("Interest", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  Text("Balance", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ],
              ),
              SizedBox(height: 16),

              Expanded(child: ListView.separated(
                  itemBuilder: (BuildContext context, index){
                    return Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Text("${index + 1}", style: TextStyle( fontSize: 16),),
                        // SizedBox(width: 32),
                        SizedBox(width:71 , child: Text("1000000", style: TextStyle(fontSize: 16),)),
                        SizedBox(width: 72, child: Text("500000", style: TextStyle(fontSize: 16),)),
                        SizedBox(width: 71, child: Text("100000", style: TextStyle(fontSize: 16),)),
                        SizedBox(width: 71, child: Text("50000", style: TextStyle(fontSize: 16),)),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, index) => Divider(),
                  itemCount: 50))
            ],
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: BarChart(
              BarChartData(
                maxY: 30000,
                minY: 0,
                barGroups: myBarData.barData
                    .map(
                    (data) => BarChartGroupData(
                      x: data.x,
                      barRods: [BarChartRodData(toY: data.y)]
                    )
                ).toList(),

              )
            ),
          ),
        ]),
      ),
    );
  }
  _getDateFormUser() async{
    DateTime? _pickerDate= await showDatePicker(context: context,
        firstDate: DateTime(2020), lastDate: DateTime(2030), initialDate: DateTime.now());
    if(_pickerDate != null){
      setState(() {
        _selectedDate = DateFormat.yMd().format(_pickerDate);

      });
    } else{
      print("Something is wrong");
    }
  }
}
