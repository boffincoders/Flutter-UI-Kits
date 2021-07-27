import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  AnimationController? moveAnimation;

  Animation? bottomPaddingValue;
  Animation? topPaddingValue;

  int carPosition = 1;
  int duration = 200;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveAnimation = AnimationController(
        duration: Duration(milliseconds: duration), vsync: this);
    setBottomPaddingValue(0.0, 0.0);
    setTopPaddingValue(0.0, 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: MediaQuery.of(context).size.width*0.70,
              height: MediaQuery.of(context).size.height,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.0,),
                    Text(
                      "Bugatti\nChiron",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width*0.1,
                          fontWeight: FontWeight.w600),
                    ),
                    Expanded(
                      child: getDetail(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$59.99 ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                MediaQuery.of(context).size.width *
                                    0.06,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "/ month",
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
                    SizedBox(height: 80,),
                  ],
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                //width: MediaQuery.of(context).size.width * 0.5,

                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.17),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.24,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-1.5, -0.21),
                      end: Alignment(1.5, 0.21),
                      colors: [
                        const Color(0xff32a9fd),
                        const Color(0xff1057e5)
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
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                  onTap: () {
                                    if (carPosition == 1) {
                                      duration = 200;
                                      setBottomPaddingValue(
                                          0,
                                          MediaQuery.of(context).size.height *
                                              0.60);
                                    } else if (carPosition == 2) {
                                      duration = 400;
                                      setTopPaddingValue(
                                          MediaQuery.of(context).size.height *
                                              0.60,
                                          0);
                                      setBottomPaddingValue(
                                          0,
                                          MediaQuery.of(context).size.height *
                                              0.60);
                                      restTopPadding();
                                    }

                                    carPosition = 0;
                                  },
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RotatedBox(
                                      quarterTurns: -1,
                                      child: Text(
                                        "Expert Rating",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  duration = 200;
                                  if (carPosition == 0) {
                                    setBottomPaddingValue(
                                        MediaQuery.of(context).size.height *
                                            0.60,
                                        0);
                                    resetBottomPadding();
                                  } else if (carPosition == 2) {
                                    setTopPaddingValue(
                                        MediaQuery.of(context).size.height *
                                            0.60,
                                        0);
                                    restTopPadding();
                                  }
                                  carPosition = 1;
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: Text(
                                      "Power",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  if (carPosition == 1) {
                                    duration = 200;
                                    setTopPaddingValue(
                                        0,
                                        MediaQuery.of(context).size.height *
                                            0.60);
                                  } else if (carPosition == 0) {
                                    duration = 400;
                                    setBottomPaddingValue(
                                        MediaQuery.of(context).size.height *
                                            0.60,
                                        0);
                                    setTopPaddingValue(
                                        0,
                                        MediaQuery.of(context).size.height *
                                            0.60);
                                    resetBottomPadding();
                                  }
                                  carPosition = 2;

                                  /* setPaddingValue(
                                      MediaQuery.of(context).size.height * 0.70, 0);*/
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: Text(
                                      "Technical Specification",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedBuilder(
                  animation: moveAnimation!,
                  builder: (_, child) {
                    return Positioned(
                        right: 0.0,
                        bottom: 0.0,
                        top: 0.0,
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: bottomPaddingValue!.value,
                              top: topPaddingValue!.value),
                          child: Center(
                            child: Image.asset(
                              "assets/images/car.png",
                              width: MediaQuery.of(context).size.width * 0.34,
                            ),
                          ),
                        ));
                  })
            ],
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(),
                Container(
                  //padding: EdgeInsets.all(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    alignment: Alignment.center,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Color(0xff1057e5),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(-1.8369700935892946e-15, 30),
                          blurRadius: 120,
                        ),
                      ],
                    ),
                    child: Text(
                      "Book Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  void setBottomPaddingValue(double start, double end) {
    moveAnimation!.reset();
    moveAnimation!.duration = Duration(milliseconds: duration);
    bottomPaddingValue = Tween<double>(begin: start, end: end)
        .animate(CurvedAnimation(parent: moveAnimation!, curve: Curves.linear));
    if (mounted)
      setState(() {
        moveAnimation!.forward();
      });
  }

  void setTopPaddingValue(double start, double end) {
    moveAnimation!.reset();
    moveAnimation!.duration = Duration(milliseconds: duration);
    topPaddingValue = Tween<double>(begin: start, end: end)
        .animate(CurvedAnimation(parent: moveAnimation!, curve: Curves.linear));
    if (mounted)
      setState(() {
        moveAnimation!.forward();
      });
  }

  restTopPadding() async {
    await Future.delayed(Duration(milliseconds: duration));
    topPaddingValue = Tween<double>(begin: 0.0, end: 0.0)
        .animate(CurvedAnimation(parent: moveAnimation!, curve: Curves.linear));
  }

  resetBottomPadding() async {
    await Future.delayed(Duration(milliseconds: duration));
    bottomPaddingValue = Tween<double>(begin: 0.0, end: 0.0)
        .animate(CurvedAnimation(parent: moveAnimation!, curve: Curves.linear));
  }

  getDetail() {
    switch(carPosition){
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [

            SizedBox(height: 40.0,),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Rating information",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width*0.05,
                ),
              ),
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                /* Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Speed",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width*0.05,
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "\$235 ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                MediaQuery.of(context).size.width *
                                    0.05,
                                fontWeight: FontWeight.bold),
                          ),

                          Text(
                            "hp",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize:
                              MediaQuery.of(context).size.width *
                                  0.05,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),*/
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Rating",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width*0.05,
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      CircularPercentIndicator(
                        radius: MediaQuery.of(context).size.width *
                            0.2,
                        lineWidth: 5.0,
                        percent: 0.80,
                        center:   Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "4.5 ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                  MediaQuery.of(context).size.width *
                                      0.05,
                                  fontWeight: FontWeight.bold),
                            ),

                            Text(
                              "rating",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize:
                                MediaQuery.of(context).size.width *
                                    0.05,
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.transparent,
                        progressColor: Colors.blue,
                      )

                    ],
                  ),
                ),
              ],))

          ],);
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [

            SizedBox(height: 40.0,),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Power information",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width*0.05,
                ),
              ),
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               /* Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Speed",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width*0.05,
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "\$235 ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                MediaQuery.of(context).size.width *
                                    0.05,
                                fontWeight: FontWeight.bold),
                          ),

                          Text(
                            "hp",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize:
                              MediaQuery.of(context).size.width *
                                  0.05,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),*/
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Power",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width*0.05,
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      CircularPercentIndicator(
                        radius: MediaQuery.of(context).size.width *
                            0.2,
                        lineWidth: 5.0,
                        percent: 0.3,
                        center:   Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "\$355 ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                  MediaQuery.of(context).size.width *
                                      0.05,
                                  fontWeight: FontWeight.bold),
                            ),

                            Text(
                              "hp",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize:
                                MediaQuery.of(context).size.width *
                                    0.05,
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.transparent,
                        progressColor: Colors.blue,
                      )

                    ],
                  ),
                ),
              ],))

          ],);
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [

            SizedBox(height: 40.0,),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Technical information",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width*0.05,
                ),
              ),
            ),
           Expanded(child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
             Align(
               alignment: Alignment.center,
               child: Column(
                 children: [
                   Text(
                     "Speed",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: MediaQuery.of(context).size.width*0.05,
                     ),
                   ),
                   SizedBox(height: 5.0,),
                   CircularPercentIndicator(
                     radius: MediaQuery.of(context).size.width *
                         0.2,
                     lineWidth: 5.0,
                     percent: 0.3,
                     center:  Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text(
                           "\$235 ",
                           style: TextStyle(
                               color: Colors.white,
                               fontSize:
                               MediaQuery.of(context).size.width *
                                   0.05,
                               fontWeight: FontWeight.bold),
                         ),

                         Text(
                           "hp",
                           style: TextStyle(
                             color: Colors.white70,
                             fontSize:
                             MediaQuery.of(context).size.width *
                                 0.05,
                           ),
                         ),
                       ],
                     ),
                     backgroundColor:Colors.transparent,
                     progressColor: Colors.blue,
                   )

                 ],
               ),
             ),
             Align(
               alignment: Alignment.center,
               child: Column(
                 children: [
                   Text(
                     "Power",
                     style: TextStyle(
                       color: Colors.white,
                       fontSize: MediaQuery.of(context).size.width*0.05,
                     ),
                   ),
                   SizedBox(height: 5.0,),
                   CircularPercentIndicator(
                     radius: MediaQuery.of(context).size.width *
                         0.2,
                     lineWidth: 5.0,
                     percent: 0.35,
                     center:  Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text(
                           "\$355 ",
                           style: TextStyle(
                               color: Colors.white,
                               fontSize:
                               MediaQuery.of(context).size.width *
                                   0.05,
                               fontWeight: FontWeight.bold),
                         ),

                         Text(
                           "hp",
                           style: TextStyle(
                             color: Colors.white70,
                             fontSize:
                             MediaQuery.of(context).size.width *
                                 0.05,
                           ),
                         ),
                       ],
                     ),
                     backgroundColor: Colors.transparent,
                     progressColor: Colors.blue,
                   )

                 ],
               ),
             ),
           ],))

          ],);
    }
  }
}
