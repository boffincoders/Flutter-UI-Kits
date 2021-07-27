import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PickModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.24,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xfff7f7f7),
          ),
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/drawer.png",
                        height: 25.0,
                        width: 25.0,
                      ),
                      Icon(
                        Icons.search,
                        size: 25.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Pick your model",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.095,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [Text("Rent with driver",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,),
                    )],
                  ),
                  Expanded(child: CarouselSlider(
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16/9,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.ease,
                        enlargeCenterPage: true,
                        //onPageChanged: callbackFunction,
                        scrollDirection: Axis.horizontal,
                      ),
                    items: [pickedModelItems()].map((element) {
                      return element;
                    }).toList(),
                  )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text(
                          "09 ",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.08,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "/ 13",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.08,
                              fontWeight: FontWeight.bold,
                          color: Colors.black26),
                        ),
                      ],),

                      Text(
                        "Next",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget pickedModelItems() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.5, -0.69),
          end: Alignment(1.5, 0.69),
          colors: [const Color(0xff282845), const Color(0xff020204)],
          stops: [0.0, 1.0],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1a010202),
            offset: Offset(-1.8369700935892946e-15, 30),
            blurRadius: 120,
          ),
        ],
      ),
    );
  }
}
