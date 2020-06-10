import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:login_app/screens/History_page.dart';

import 'newreservation.dart';
class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

final List<String> imgList = [
  "assets/IMages/0db45806-8737-4971-bb52-167d9d4d1e6c.jpeg",
  "assets/IMages/d6f1aeb8-6136-484b-a8ec-b2c15ec8e2dc.jpeg",
];

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 100.0,),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "Welcome", style: TextStyle(
                          fontFamily: 'WorkSans',
                          color: Colors.black,
                          fontSize: 38,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                        )),
                        TextSpan(text: "\n"),
                        TextSpan(text: "Ticket clerk.", style: TextStyle(
                          fontFamily: 'WorkSans',
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.1,
                        )),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 100.0,),
                        Container(
                          height: 400.0,
                          width: double.infinity,
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 500.0,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              enlargeCenterPage: true,
                            ),
                            items: imgList.map((item) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                              child: GestureDetector(
                                onTap: (){
                                  if(item == "assets/IMages/0db45806-8737-4971-bb52-167d9d4d1e6c.jpeg"){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ReservationPage()));
                                  } if(item == "assets/IMages/d6f1aeb8-6136-484b-a8ec-b2c15ec8e2dc.jpeg"){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HistoryPage()));
                                  }
                                },
                                child: Center(
                                    child: Image.asset(item)
                                ),
                              ),
                            )).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


