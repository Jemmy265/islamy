import 'package:flutter/material.dart';

class ZakahTab extends StatefulWidget {
  @override
  _ZakahTabState createState() => _ZakahTabState();
}

class _ZakahTabState extends State<ZakahTab> {
  TextEditingController goldController = TextEditingController();
  TextEditingController goldPriceController = TextEditingController();
  TextEditingController silverController = TextEditingController();
  TextEditingController silverPriceController = TextEditingController();
  TextEditingController cashController = TextEditingController();
  String zakatAmount = '';
  bool showCalculator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showCalculator
          ? Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'أدخل أصولك لحساب الزكاة',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: goldController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'الذهب (بالجرام)',
                          labelStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                    TextFormField(
                      controller: goldPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'سعر الذهب (بالوحدة)',
                          labelStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                    TextFormField(
                      controller: silverController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'الفضة (بالجرام)',
                          labelStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                    TextFormField(
                      controller: silverPriceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'سعر الفضة (بالوحدة)',
                          labelStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                    TextFormField(
                      controller: cashController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'النقد',
                          labelStyle: Theme.of(context).textTheme.bodyMedium),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        calculateZakat();
                      },
                      child: Text(
                        'حساب الزكاة',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      zakatAmount,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'هل لديك أصول لحساب الزكاة؟',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      askQuestions();
                    },
                    child: Text(
                      'نعم',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                  ),
                ],
              ),
            ),
    );
  }

  void askGoldQuestion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'هل تملك ذهب بغرض الادخار اكثر من او يعادل 85 جرام من عيار 21 ؟',
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                askSilverQuestion();
              },
              child: Text(
                'لا',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  showCalculator = true;
                });
              },
              child: Text(
                'نعم',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        );
      },
    );
  }

  void askSilverQuestion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'هل تملك فضة بغرض الادخار اكثر من او يعادل 595 جرام ؟',
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                askCashQuestion();
              },
              child: Text(
                'لا',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  showCalculator = true;
                });
              },
              child: Text(
                'نعم',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        );
      },
    );
  }

  void askCashQuestion() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'هل تملك نقد بغرض الادخار اكثر من او يعادل 85 جرام من الذهب  عيار 21 ؟',
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                noZakah();
              },
              child: Text(
                'لا',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  showCalculator = true;
                });
              },
              child: Text(
                'نعم',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        );
      },
    );
  }

  void noZakah() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'لا يوجد زكاه',
            textAlign: TextAlign.center,
          ),
          // actionsAlignment: MainAxisAlignment.center,
          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //     child: Text('لا',
          //       style: Theme.of(context).textTheme.bodySmall,
          //     ),
          //   ),
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //       setState(() {
          //         showCalculator = true;
          //       });
          //     },
          //     child: Text('نعم',
          //       style: Theme.of(context).textTheme.bodySmall,
          //     ),
          //   ),
          // ],
        );
      },
    );
  }

  void askQuestions() {
    askGoldQuestion();
  }

  void calculateZakat() {
    double gold = double.tryParse(goldController.text) ?? 0;
    double goldPrice = double.tryParse(goldPriceController.text) ?? 0;
    double silver = double.tryParse(silverController.text) ?? 0;
    double silverPrice = double.tryParse(silverPriceController.text) ?? 0;
    double cash = double.tryParse(cashController.text) ?? 0;

    // Calculate the value of gold
    double totalGoldValue = gold * goldPrice;

    // Calculate the value of silver
    double totalSilverValue = silver * silverPrice;

    // Calculate Nisab for gold and silver individually
    double nisabGold = 85 * goldPrice;
    double nisabSilver = 595 * silverPrice;

    // Check if gold or cash meets the Nisab threshold
    bool isGoldAboveNisab = totalGoldValue >= nisabGold;
    bool isCashAboveNisab = cash >= nisabGold;

    if (gold >= 85 && silver >= 595 && isCashAboveNisab) {
      double zakatAmountValue =
          (totalSilverValue + totalGoldValue + cash) * 0.025;
      setState(() {
        zakatAmount =
            'مبلغ الزكاة الخاص بك هو: ${zakatAmountValue.toStringAsFixed(2)} ';
      });
    } else if (gold >= 85 && silver >= 595 && !isCashAboveNisab) {
      // Zakat is calculated based on total Zakatable assets
      var zakatAmountValue = (totalSilverValue + totalGoldValue) * 0.025;
      setState(() {
        zakatAmount =
            'مبلغ الزكاة الخاص بك هو: ${zakatAmountValue.toStringAsFixed(2)} ';
      });
    } else if (silver >= 595 && isCashAboveNisab) {
      var zakatAmountValue = (cash + totalSilverValue) * 0.025;
      setState(() {
        zakatAmount =
            'مبلغ الزكاة الخاص بك هو: ${zakatAmountValue.toStringAsFixed(2)} ';
      });
    } else if (gold >= 85 && isCashAboveNisab) {
      var zakatAmountValue = (cash + totalGoldValue) * 0.025;
      setState(() {
        zakatAmount =
            'مبلغ الزكاة الخاص بك هو: ${zakatAmountValue.toStringAsFixed(2)} ';
      });
    } else if (gold >= 85) {
      var zakatAmountValue = (totalGoldValue) * 0.025;
      setState(() {
        zakatAmount =
            'مبلغ الزكاة الخاص بك هو: ${zakatAmountValue.toStringAsFixed(2)} ';
      });
    } else if (isCashAboveNisab) {
      var zakatAmountValue = cash * 0.025;
      setState(() {
        zakatAmount =
            'مبلغ الزكاة الخاص بك هو: ${zakatAmountValue.toStringAsFixed(2)} ';
      });
    } else if (silver >= 595) {
      // Zakat is calculated based on total Zakatable assets
      var zakatAmountValue = totalSilverValue * 0.025;
      setState(() {
        zakatAmount =
            'مبلغ الزكاة الخاص بك هو: ${zakatAmountValue.toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        zakatAmount = 'لا يوجد زكاة مستحقة لأن أصولك أقل من النصاب.';
      });
    }
  }
}
