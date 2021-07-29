import 'package:flutter/material.dart';

TextStyle textMsg() {
  return const TextStyle(
    color: Color(0xff817B8B),
    fontSize: 14,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.20000000298023224,
  );
}

TextStyle textName() {
  return const TextStyle(
    color: Color(0xff0C0020),
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.20000000298023224,
  );
}

TextStyle textName2() {
  return const TextStyle(
    color: Color(0xff0C0020),
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.20000000298023224,
  );
}

TextStyle textMsg2() {
  return const TextStyle(
    color: Color(0xff817B8B),
    fontSize: 12,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.20000000298023224,
  );
}

TextStyle chatMsg(bool me) {
  return TextStyle(
    color: me ? Colors.white.withOpacity(.8) : Color(0xff817B8B),
    fontSize: 11,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    letterSpacing: 0.20000000298023224,
  );
}
