import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_kit/screens/car_rental2/widgets/app_bar.dart';
import 'package:flutter_ui_kit/screens/car_rental2/details.dart';

class RentalHome extends StatefulWidget {
  const RentalHome({Key? key}) : super(key: key);

  @override
  _RentalHomeState createState() => _RentalHomeState();
}

final List<String> imgList = [
  'https://p1.pxfuel.com/preview/249/742/510/jaguar-sports-car-fast-automobile.jpg',
  'https://stimg.cardekho.com/images/carexteriorimages/930x620/Maruti/Maruti-Wagon-R/6741/1564746908438/front-left-side-47.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/1/16/Bugatti_Divo%2C_GIMS_2019%2C_Le_Grand-Saconnex_%28GIMS0029%29.jpg',
  'https://cdn.pixabay.com/photo/2021/03/04/14/39/cars-6068215_1280.jpg',
  'https://p1.pxfuel.com/preview/504/801/234/tesla-electric-car-vehicle-car-auto-model-x.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/8/89/Kia_Seltos_car_Htx_model.jpg',
];

class _RentalHomeState extends State<RentalHome> {
  var current = 0;
  List<Map<String, dynamic>>? carsList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carsList = [
      {
        "name": "Maruti Swift",
        "price": "RS.5.14 - 8.89 Lakh",
        "image": imgList[0],
        "rating": 4.0,
        "reviews": 25,
        "updates":
            "Maruti Swift Engine and Transmission: It is powered by the new 1.2-litre DualJet petrol engine (90PS/113Nm) introduced on the facelifted Dzire that comes with an idle start-stop feature for improved fuel efficiency. ... 1.2-litre MT- 23.20kmpl. 1.2-litre AMT- 23.76kmpl."
      },
      {
        "name": "Maruti Wagon R",
        "price": "RS.4.34 - 7.92 Lakh",
        "image": imgList[1],
        "rating": 3.5,
        "reviews": 18,
        "updates":
            "Maruti Wagon R Powertrain: Maruti has equipped the Wagon R with two petrol engine options: a 1.0-litre (68PS/90Nm) and a 1.2-litre (83PS/113Nm). Both engines can be mated to 5-speed manual and AMT gearboxes. ... 1.0-litre CNG- 32.52km/kg. 1.2-litre MT/AMT- 20.52kmpl."
      },
      {
        "name": "Maruti Brezza",
        "price": "RS.6.61 - 13.52 Lakh",
        "image": imgList[5],
        "rating": 4.5,
        "reviews": 42,
        "updates":
            "Latest Update: Maruti is offering discounts of up to Rs 39,000 on the Vitara Brezza this July. Maruti Vitara Brezza Price: The Vitara Brezza is priced between Rs 7.51 lakh and Rs 11.41 lakh (ex-showroom Delhi). Maruti Vitara Brezza Variants: It is sold in four trims: LXi, VXi, ZXi, and ZXi+."
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * .6,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: height * .5,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      }),
                  items: imgList.map((list) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            child: CachedNetworkImage(
                              imageUrl: list,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                              fit: BoxFit.cover,
                            ));
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  left: 30.0,
                  bottom: 130.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.map((url) {
                      int index = imgList.indexOf(url);
                      return Container(
                        width: 6.0,
                        height: 6.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: current == index
                              ? Color(0xffF5A623)
                              : Color.fromRGBO(255, 255, 255, 1),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  top: 40.0,
                  left: 20.0,
                  right: 20.0,
                  child: MyAppBar(
                    isImage: true,
                    isBack: false,
                  ),
                ),
                Positioned(
                  top: height * .1,
                  left: 20.0,
                  right: 20.0,
                  child: Container(
                    width: width * .2,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Color(0xffF5A623),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search...",
                            hintStyle: TextStyle(
                              color: Color(0xff484848),
                            ))),
                  ),
                ),
                Positioned(
                  bottom: height * .2,
                  left: 30.0,
                  child: Text(
                    'Find Right Cars By \nBody Type',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Gotham',
                        fontSize: 25,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1.2666666666666666),
                  ),
                ),
                Positioned(
                  bottom: 30.0,
                  left: 30.0,
                  right: 0.0,
                  child: SizedBox(
                    height: 90,
                    child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Container(
                            width: 150,
                            height: 90,
                            margin: EdgeInsets.only(right: 10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              gradient: getColor(index),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xff151526),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    "${index + 1}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Mulish',
                                        fontSize: 9,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 15.0, top: 5.0),
                                  child: Text(
                                    index == 0
                                        ? 'New Car'
                                        : index == 1
                                            ? "Rent Car"
                                            : "Rent Car",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Open Sans',
                                        fontSize: 14,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 15.0, top: 5.0),
                                  child: Text(
                                    index == 0
                                        ? 'All that car you want'
                                        : "Choose Car",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontFamily: 'Gotham',
                                        fontSize: 10,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Color(0xffF6F6F6),
                padding: EdgeInsets.only(left: 30.0, top: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'The most searched cars',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Gotham',
                              fontSize: 18,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            'See All',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Color.fromRGBO(245, 165, 35, 1),
                                fontFamily: 'Gotham',
                                fontSize: 18,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 240,
                      child: ListView.builder(
                          itemCount: carsList?.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                        DetailsScreen(carsList![index])));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: CachedNetworkImage(
                                          imageUrl: carsList![index]['image'],
                                          height: 160,
                                          width: width * .6,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      carsList![index]['name'],
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Gotham',
                                          fontSize: 18,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      carsList![index]['price'] + "*",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'Gotham',
                                          fontSize: 18,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w600,
                                          height: 1),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  LinearGradient getColor(int index) {
    if (index == 0)
      return LinearGradient(colors: [Color(0xffF37315), Color(0xffF5AF19)]);
    if (index == 1)
      return LinearGradient(colors: [Color(0xffBC4956), Color(0xffF27121)]);
    else
      return LinearGradient(colors: [Color(0xff635DBA), Color(0xff9EB2F5)]);
  }
}
