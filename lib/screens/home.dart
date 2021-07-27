import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/car_rental/pick_model_screen.dart';

class Home extends StatelessWidget {
  TextStyle style = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Car Rental",
                style: style,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => PickModel()));
              },
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
