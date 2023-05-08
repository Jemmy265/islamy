import 'package:flutter/material.dart';

class TasbehTeb extends StatefulWidget {
  @override
  State<TasbehTeb> createState() => _TasbehTebState();
}

class _TasbehTebState extends State<TasbehTeb> {
  int tasbehNumber = 0;
  int index = 0;
  List<String> Names = [
    "سبحان الله",
    "الحمد الله",
    "الله اكبر",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.asset(
                  "assets/images/head_sebha_logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 80, bottom: 20),
                  child: Image.asset("assets/images/body_sebha_logo.png")),
            ],
          ),
          Column(
            children: [
              Text(
                "عدد التسبيحات",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Card(
                elevation: 15,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFFC9B396),
                  ),
                  alignment: Alignment.center,
                  height: 60,
                  width: 50,
                  child: Text(
                    "$tasbehNumber",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                margin: EdgeInsets.symmetric(vertical: 36, horizontal: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
              ElevatedButton(
                  onPressed: () {
                    tasbehNumber++;
                    if (tasbehNumber == 33) {
                      index++;
                    } else if (tasbehNumber == 66) {
                      index++;
                    } else if (tasbehNumber == 99) {
                      index = 0;
                      tasbehNumber = 0;
                    }
                    setState(() {});
                  },
                  child: Text(Names[index]))
            ],
          )
        ],
      ),
    );
  }
}
