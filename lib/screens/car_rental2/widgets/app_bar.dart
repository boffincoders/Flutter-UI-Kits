import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/car_rental2/home.dart';
import 'package:flutter_ui_kit/screens/home.dart';

class MyAppBar extends StatelessWidget {
  final bool? isImage;

  const MyAppBar({Key? key, this.isImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isImage!
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/car2/side_menu.png",
              ),
              Image.asset(
                "assets/images/car2/logo.png",
                width: 100,
                height: 40,
              ),
              SizedBox(
                width: 20.0,
              )
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Navigator.of(context).pop(),
                child: Image.asset(
                  "assets/images/car2/icons_arrow.png",
                  fit: BoxFit.cover,
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => RentalHome()));
                },
                child: Text(
                  'Skip for now',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Gotham',
                      fontSize: 14,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
              )
            ],
          );
  }
}
