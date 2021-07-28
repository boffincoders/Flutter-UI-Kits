import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/car_rental2/otp_verification.dart';
import 'package:flutter_ui_kit/screens/car_rental2/widgets/app_bar.dart';
import 'package:flutter_ui_kit/screens/car_rental2/widgets/keyboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                'Enter your phone \nnumber',
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
              height: 40.0,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/car2/flag.png",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.arrow_drop_down_sharp,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Text(
                    '+91',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Mulish',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextFormField(
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        cursorColor: Color(0xffF5A623),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your phone number",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                            ))),
                  ),
                ],
              ),
            ),
            Container(
                width: width * .8,
                margin: EdgeInsets.only(left: 20.0),
                height: 3,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                )),
            SizedBox(
              height: height * .1,
            ),
            Center(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => OTPVerification()));
                },
                child: Container(
                    width: width * .8,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color.fromRGBO(245, 165, 35, 1),
                    ),
                    child: Center(
                      child: Text(
                        'Sign in',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Gotham',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 30.0,
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
