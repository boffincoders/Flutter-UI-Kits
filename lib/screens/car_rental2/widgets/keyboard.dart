import 'package:flutter/material.dart';

class MyKeyBoard extends StatelessWidget {
  const MyKeyBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(210, 213, 219, 0.8999999761581421),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(context, label: "1", onPressed: () {}),
                _otpKeyboardInputButton(context,
                    label: "2", onPressed: () {}, text: "ABC"),
                _otpKeyboardInputButton(context,
                    label: "3", onPressed: () {}, text: "DEF"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(context,
                    label: "4", onPressed: () {}, text: "GHI"),
                _otpKeyboardInputButton(context,
                    label: "5", onPressed: () {}, text: "JKL"),
                _otpKeyboardInputButton(context,
                    label: "6", onPressed: () {}, text: "MNO"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(context,
                    label: "7", onPressed: () {}, text: "PQRS"),
                _otpKeyboardInputButton(context,
                    label: "8", onPressed: () {}, text: "TUV"),
                _otpKeyboardInputButton(context,
                    label: "9", onPressed: () {}, text: "WXYZ"),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                ),
                _otpKeyboardInputButton(context, label: "0", onPressed: () {}),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  height: 50.0,
                  child: SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: Image.asset(
                      "assets/images/car2/delete.png",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .3,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  height: 50.0,
                  child: SizedBox(
                    width: 30.0,
                    height: 30.0,
                    child: Image.asset(
                      "assets/images/car2/dictation.png",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _otpKeyboardInputButton(BuildContext context,
      {String? label, VoidCallback? onPressed, String text = ""}) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onPressed,
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label!,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
