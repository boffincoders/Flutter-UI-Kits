import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'widgets/app_bar.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> carData;

  const DetailsScreen(this.carData, {Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState(carData);
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  final Map<String, dynamic> carData;

  _DetailsScreenState(this.carData);

  TabController? tabController;
  int currentTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: MyAppBar(
          isImage: true,
          isBack: true,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20),
          child: TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: Color(0xffF5A623),
            indicatorWeight: 4,
            tabs: [
              Tab(text: "Overview"),
              Tab(text: "Gallery"),
              Tab(text: "Variants"),
              Tab(text: "Specifications"),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height * .4,
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: carData['image'],
                  fit: BoxFit.cover,
                  height: height * .4,
                  width: width,
                ),
                Positioned(
                    bottom: 30.0,
                    left: 20.0,
                    right: 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/images/car2/hart.png"),
                        Row(
                          children: [
                            Text(
                              '11 Photos',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Gotham',
                                  fontSize: 10,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Image.asset("assets/images/car2/email.png"),
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  carData['name'],
                  style: TextStyle(
                      color: Color.fromRGBO(42, 42, 67, 1),
                      fontFamily: 'Gotham',
                      fontSize: 14,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                      height: 1),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: carData['rating'],
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 25,
                      ignoreGestures: true,
                      itemPadding: EdgeInsets.zero,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Color(0xffF5A623),
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: '${carData['rating']} Based on ',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Gotham',
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w400,
                                  height: 1)),
                          TextSpan(
                              text: '${carData['reviews']} Reviews',
                              style: TextStyle(
                                  color: Color(0xffF5A623),
                                  fontFamily: 'Gotham',
                                  fontSize: 14,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                  height: 1),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('View Reviews"');
                                }),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  carData['price'] + "*",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Gotham',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Ex-showroom Price in New Delhi',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(167, 170, 190, 1),
                      fontFamily: 'Gotham',
                      fontSize: 12,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width * .4,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          40.0,
                        ),
                        border: Border.all(
                          color: Color.fromRGBO(245, 165, 35, 1),
                          width: 2,
                        ),
                      ),
                      child: Center(
                          child: Text(
                        'Call Dealer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(245, 165, 35, 1),
                            fontFamily: 'Gotham',
                            fontSize: 17,
                            letterSpacing: 0.10726270079612732,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                    ),
                    Container(
                      width: width * .4,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          40.0,
                        ),
                        color: Color.fromRGBO(245, 166, 35, 1),
                      ),
                      child: Center(
                          child: Text(
                        'Get a Quote',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Gotham',
                            fontSize: 17,
                            letterSpacing: 0.10726270079612732,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  '${carData['name']} Latest Update',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Open Sans',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                      height: 1),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Latest Update: ${carData['updates']}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )
              ],
            ),
          )))
        ],
      ),
    );
  }
}
