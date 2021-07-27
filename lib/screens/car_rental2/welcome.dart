import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/car_rental2/login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double widget = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: widget,
        height: height,
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: new ExactAssetImage('assets/images/car2/welcome.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Spacer(),
            Image.asset(
              'assets/images/car2/logo.png',
              width: widget * .8,
              height: 50,
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Welcome to CarRent',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Gotham',
                    fontSize: 30,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Rent new & used cars, search by filter & preferences, compare cars, read latest news and updates',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Gotham',
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1.5),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Login()));
              },
              child: Container(
                  width: widget * .8,
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
            Container(
                width: widget * .8,
                height: 50.0,
                margin: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Color.fromRGBO(0, 122, 255, 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/car2/facebook.png',
                      width: 30,
                      height: 30,
                    ),
                    Text(
                      'Connect with facebook',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'Gotham',
                          fontSize: 15,
                          letterSpacing: -0.3617647886276245,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ],
                )),
            SizedBox(height: height * .1)
          ],
        ),
      ),
    );
  }
}
