import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasbehTeb extends StatefulWidget {
  const TasbehTeb({Key? key}) : super(key: key);

  @override
  State<TasbehTeb> createState() => _TasbehTebState();
}

class _TasbehTebState extends State<TasbehTeb> {
  int sebhaCounter = 0;
  int tsbeehatCounter = 0;
  double angle = 0;
  List<String> tsbeehat = [
    'سبحان الله',
    "الحمد لله",
    "الله اكبر",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(left: width * 0.1),
                child: Image.asset(
                  'assets/images/head_sebha_logo.png',
                  width: width * 0.2,
                  height: height * 0.13,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.1),
                child: Transform.rotate(
                  angle: angle,
                  child: GestureDetector(
                    onTap: () {
                      tsbeeeh();
                    },
                    child: Image.asset(
                      'assets/images/body_sebha_logo.png',
                      fit: BoxFit.fitHeight,
                      height: height * 0.27,
                      width: width * 0.7,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        Text(
          AppLocalizations.of(context)!.tasbehnumber,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        Container(
          padding: EdgeInsets.only(
              left: width * 0.05,
              right: width * 0.05,
              top: height * 0.02,
              bottom: height * 0.02),
          decoration: BoxDecoration(
              color: Color(0xffB7935F).withOpacity(0.5),
              borderRadius: BorderRadius.circular(25)),
          child: Text(
            sebhaCounter.toString(),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        SizedBox(
          height: height * 0.03,
        ),
        ElevatedButton(
          onPressed: () {
            tsbeeeh();
          },
          child: Text(
            tsbeehat[tsbeehatCounter],
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
        )
      ],
    );
  }

  void tsbeeeh() {
    if (sebhaCounter == 32) {
      sebhaCounter = 0;
      if (tsbeehatCounter == 2) {
        tsbeehatCounter = 0;
      } else {
        tsbeehatCounter++;
      }
    } else {
      sebhaCounter++;
    }
    angle += 20;
    setState(() {});
  }
}
