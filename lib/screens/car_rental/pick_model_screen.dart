import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/car_rental/detail_screen.dart';

class PickModel extends StatefulWidget {
  @override
  _PickModelState createState() => _PickModelState();
}

class _PickModelState extends State<PickModel> {
  int currentIndex = 1;
  List<Widget> itemList = [];
  LinearGradient dark = LinearGradient(
    begin: Alignment(-1.5, -0.69),
    end: Alignment(1.5, 0.69),
    colors: [const Color(0xff282845), const Color(0xff020204)],
    stops: [0.0, 1.0],
  );
  LinearGradient light = LinearGradient(
    begin: Alignment(-1.5, -0.69),
    end: Alignment(1.5, 0.69),
    colors: [const Color(0xff282845), const Color(0xff020204)],
    stops: [0.0, 1.0],
  );

  @override
  Widget build(BuildContext context) {
    itemList = [
      pickedModelItems(context, dark),
      pickedModelItems(context, light),
      pickedModelItems(context, dark)
    ];
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
                    children: [
                      Text(
                        "Rent with driver",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: Container(
                        color: Colors.white,
                        child: CarouselSlider(
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.5,
                        aspectRatio: 16 / 9,

                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.ease,
                        enlargeCenterPage: true,
                        onPageChanged: (currentIndex, _) {
                          getCurrentIndex(currentIndex);
                        },
                        scrollDirection: Axis.horizontal,
                    ),
                    items: itemList.map((element) {
                        return element;
                    }).toList(),
                  ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "$currentIndex ",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.08,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "/ ${itemList.length}",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.08,
                                fontWeight: FontWeight.bold,
                                color: Colors.black26),
                          ),
                        ],
                      ),
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

  Widget pickedModelItems(BuildContext context, LinearGradient linearGradient) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailScreen()));
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width - 41.0,
              child: Stack(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Padding(

                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.17),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5 - 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              gradient: LinearGradient(
                                begin: Alignment(-1.5, -0.69),
                                end: Alignment(1.5, 0.69),
                                colors: [
                                  const Color(0xff282845),
                                  const Color(0xff020204)
                                ],
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
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Bugatti \nChiron",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width * 0.06,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "\$59.99",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  MediaQuery.of(context).size.width *
                                                      0.06,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "/month",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize:
                                                MediaQuery.of(context).size.width *
                                                    0.06,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Detail",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.06,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 0.0,
                            bottom:0.0,
                            top:0.0,child:  Center(
                          child: Image.asset(
                            "assets/images/car.png",
                            width: MediaQuery.of(context).size.width * 0.34,
                          ),
                        ))
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          Positioned(
              left: 20.0,
              bottom: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 40.0,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(
                      8.0,
                    )),
              ))
        ],
      ),
    );
  }

  getCurrentIndex(int index) {
    if (mounted)
      setState(() {
        currentIndex = index + 1;
      });
  }
}
