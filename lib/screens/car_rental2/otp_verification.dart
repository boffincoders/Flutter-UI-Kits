import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_kit/screens/car_rental2/widgets/app_bar.dart';
import 'package:flutter_ui_kit/screens/car_rental2/widgets/keyboard.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: MyAppBar(
          isImage: false,
          isBack: false,
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(
                'Enter the 4-digit \ncode sent to you at',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Gotham',
                    fontSize: 30,
                    letterSpacing:
                        .2 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.2),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Text(
                '09501887900',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(245, 165, 35, 1),
                    fontFamily: 'Gotham',
                    fontSize: 30,
                    letterSpacing: -0.23999999463558197,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 55,
                  alignment: Alignment.center,
                  child: TextFormField(
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      cursorColor: Color(0xffF5A623),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "1",
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ))),
                ),
                Container(
                  width: 55,
                  alignment: Alignment.center,
                  child: TextFormField(
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      cursorColor: Color(0xffF5A623),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "2",
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ))),
                ),
                Container(
                  width: 55,
                  alignment: Alignment.center,
                  child: TextFormField(
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      cursorColor: Color(0xffF5A623),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "3",
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ))),
                ),
                Container(
                  width: 55,
                  alignment: Alignment.center,
                  child: TextFormField(
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      cursorColor: Color(0xffF5A623),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "4",
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 55,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                    )),
                Container(
                    width: 55,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    )),
                Container(
                    width: 55,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    )),
                Container(
                    width: 55,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                    ))
              ],
            ),
            SizedBox(
              height: height * .1,
            ),
            Center(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {},
                child: Container(
                    width: width * .8,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        "I haven't received a code",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Gotham',
                            fontSize: 16,
                            letterSpacing: -0.23999999463558197,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 2,
              child: MyKeyBoard(),
            )
          ],
        ),
      ),
    );
  }
}
