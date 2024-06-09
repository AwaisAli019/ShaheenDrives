import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shaheendrive/view/services/plumber.dart';

import '../home imageslider.dart';
import 'cleaner.dart';
import 'detailservicespage.dart';
import 'electrician.dart';
class services extends StatefulWidget {
  const services({Key? key}) : super(key: key);

  @override
  State<services> createState() => _servicesState();
}

class _servicesState extends State<services> {
  List<Map<String, dynamic>> iconList = [
    {"name": "Cleaner", "path": "assets/cleaner.png","subtitle":"Experience top-notch carpentry services that bring your visions to life. Ourskilled carpenters are dedicated to delivering unparalleled craftsmanship and precision.From customized furniture to stunning cabinetry, our team specializes in tailoredwoodworking solutions that elevate your space. Trust us to provide expert renovationsand meticulous restorations. Discover the perfect blend of functionality and aestheticswith our exceptional carpenter service."},
    {"name": "Plumber", "path": "assets/plumber.png"},
    {"name": "Electriction", "path": "assets/electrician.png"},
    {"name": "Mechanic", "path": "assets/mechanic.png"},
    {"name": "Carpenter", "path": "assets/cleaner.png"},
    // Add more icons as needed
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){Navigator.pop(context);},),
        title: Center(
            child: Text("Shaheen Services",

              style: TextStyle(color: Colors.lightGreen,fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: queryData.size.height/35,),
              ImageSlider(),
              SizedBox(height: queryData.size.height/35,),
              Row(
                children: [
                  SizedBox(width: queryData.size.width/35,),
                  Text("Top Services",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ],
              ),
              // SizedBox(height: queryData.size.height/55,),
              Container(
                  color: Colors.white,
                  height: 150,
                  child:
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: iconList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              iconList[index]['path'],
                              width: 72.0,
                              height: 72.0,
                            ),
                            SizedBox(height: 4.0),
                            Text(iconList[index]['name']),
                          ],
                        ),
                      );
                    },
                  )

              ),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailservices2(

                      ),
                    ),
                  );
                  // Handle onTap event
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffC6DEDB),
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  height: queryData.size.height / 9.4,
                  width: queryData.size.width / 1.1,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 210,
                        bottom: 1,
                        top: 1,

                        child: Transform.scale(
                          scale: 0.6, // Adjust the scale value as needed
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage('assets/cleaner.png'), // Replace with your image path
                                // fit: BoxFit.cover,
                              ),
                            ),
                            height: queryData.size.height / 3,
                            width: queryData.size.width / 2,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 60,
                        right: 170,
                        child:  Text(
                          'Cleaner',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                      ),
                      Positioned(
                        bottom: 30,
                        right: 50,
                        child:  Text(
                          'Reliable Plumbing Services for Your\nPlumbing Needs',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff155a58),
                          ),
                        ),

                      ),

                      Positioned(
                        bottom: 10,
                        right: 208,
                        child: Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.black,
                          size: 25,
                        ),

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: queryData.size.height/55,),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailservices3(

                      ),
                    ),
                  );
                  // Handle onTap event
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffbeefc6),
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  height: queryData.size.height / 9.4,
                  width: queryData.size.width / 1.1,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 210,
                        bottom: 1,
                        top: 1,

                        child: Transform.scale(
                          scale: 0.6, // Adjust the scale value as needed
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage('assets/electrician.png'), // Replace with your image path
                                // fit: BoxFit.cover,
                              ),
                            ),
                            height: queryData.size.height / 3,
                            width: queryData.size.width / 2,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 60,
                        right: 150,
                        child:  Text(
                          'Electiction',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                      ),
                      Positioned(
                        bottom: 30,
                        right: 57,
                        child:  Text(
                          'Professional Electrical Services for \nYour Home or Business',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff155a58),
                          ),
                        ),

                      ),

                      Positioned(
                        bottom: 10,
                        right: 208,
                        child: Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.black,
                          size: 25,
                        ),

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: queryData.size.height/55,),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailservices1(

                      ),
                    ),
                  );
                  // Handle onTap event
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffd6eeaa),
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  height: queryData.size.height / 9.4,
                  width: queryData.size.width / 1.1,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 210,
                        bottom: 1,
                        top: 1,

                        child: Transform.scale(
                          scale: 0.6, // Adjust the scale value as needed
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage('assets/plumber.png'), // Replace with your image path
                                // fit: BoxFit.cover,
                              ),
                            ),
                            height: queryData.size.height / 3,
                            width: queryData.size.width / 2,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 60,
                        right: 168,
                        child:  Text(
                          'Plumber',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                      ),
                      Positioned(
                        bottom: 30,
                        right: 58,
                        child:  Text(
                          'Reliable Plumbing Services for Your\nPlumbing Needs',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff155a58),
                          ),
                        ),

                      ),

                      Positioned(
                        bottom: 10,
                        right: 208,
                        child: Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.black,
                          size: 25,
                        ),

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: queryData.size.height/55,),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => detailservices(

                      ),
                    ),
                  );
                  // Handle onTap event
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffC6DEDB),
                    borderRadius: BorderRadius.circular(10.0),

                  ),
                  height: queryData.size.height / 9.4,
                  width: queryData.size.width / 1.1,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 210,
                        bottom: 1,
                        top: 1,

                        child: Transform.scale(
                          scale: 0.6, // Adjust the scale value as needed
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage('assets/mechanic.png'), // Replace with your image path
                                // fit: BoxFit.cover,
                              ),
                            ),
                            height: queryData.size.height / 3,
                            width: queryData.size.width / 2,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 60,
                        right: 158,
                        child:  Text(
                          'Mechanic',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                      ),
                      Positioned(
                        bottom: 30,
                        right: 75,
                        child:  Text(
                          'Expert Mechanical Services for \nYour Vehicle',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff155a58),
                          ),
                        ),

                      ),

                      Positioned(
                        bottom: 10,
                        right: 208,
                        child: Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.black,
                          size: 25,
                        ),

                      ),
                    ],
                  ),
                ),
              ),




            ],
          ),
        ],
      ),

    );
  }
}
