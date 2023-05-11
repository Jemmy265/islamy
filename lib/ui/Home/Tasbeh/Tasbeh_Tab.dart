import 'package:flutter/material.dart';

class TasbehTeb extends StatefulWidget {
  @override
  State<TasbehTeb> createState() => _TasbehTebState();
}

class _TasbehTebState extends State<TasbehTeb> {
  int tasbehNumber = 0;
  int index = 0;
  double angle = 0;
  List<String> Names = [
    "سبحان الله",
    "الحمد الله",
    "الله اكبر",
    "لا اله الا الله",
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
              Transform.rotate(
                angle: angle,
                child: GestureDetector(
                  onTap: tasbeeh,
                  child: Container(
                      margin: EdgeInsets.only(top: 80, bottom: 20),
                      child: Image.asset(
                        "assets/images/body_sebha_logo.png",
                        fit: BoxFit.fitHeight,
                      )),
                ),
              ),
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
                    color: Theme.of(context).primaryColor,
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
                    tasbeeh();
                  },
                  child: Text(Names[index]))
            ],
          )
        ],
      ),
    );
  }

  void tasbeeh() {
    if (tasbehNumber == 32) {
      tasbehNumber = 0;
      if (index == 3) {
        index = 0;
      } else {
        index++;
      }
    } else {
      tasbehNumber++;
    }
    angle += 20;
    setState(() {});
  }
}
