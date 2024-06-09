import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shaheendrive/view/services/mainservicespage.dart';
import 'package:shaheendrive/view/services/servicesMainpage.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home imageslider.dart';
import 'package:get/get.dart';
import 'package:shaheendrive/features/uber_home_page_feature/presentation/pages/uber_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late SharedPreferences _prefs;
  bool _isPrivacyDialogShown = false;
  @override
  void initState() {
    super.initState();
    // Execute showPrivacyPolicyDialog after the frame is painted
   _initPreferences();
  }


  void openWhatsApp() async {
    String phoneNumber = '+923459823114'; // Replace with the desired phone number
    String message = 'Hello!'; // Replace with the desired message

    String url = 'https://api.whatsapp.com/send?phone=$phoneNumber&text=Hello!!';
    Uri whatsappUri = Uri.parse(url);
    await launch(url);

    if (await canLaunch(whatsappUri.toString())) {
      await launch(whatsappUri.toString());
    } else {
      throw 'Could not launch WhatsApp.';
    }
  }
  void _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _isPrivacyDialogShown = _prefs.getBool('privacy_dialog_shown') ?? false;

    // Execute showPrivacyPolicyDialog if it's the first time the dialog is shown
    if (!_isPrivacyDialogShown) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        showPrivacyPolicyDialog();
      });
    }
  }

  Future<void> showPrivacyPolicyDialog() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            constraints: BoxConstraints(maxWidth: 300, maxHeight: 250),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Privacy Policy',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'We are using your location services to provide the best and nearest rides to you.',
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    launch('https://docs.google.com/document/d/1HYJ2X_ma7n7kDQFDRhcNUC-xMgHMdbZAWcQqVE2gZW0/edit?usp=sharing');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Click here to read the privacy policy in detail.',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Close the dialog and set the flag to true
                        Navigator.of(context).pop();
                        _prefs.setBool('privacy_dialog_shown', true);
                      },
                      child: Text('Accept'),
                    ),
                    SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        // Close the app
                        exit(0);
                      },
                      child: Text('Deny'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  Future<void> showMartDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Coming Soon'),
          content: Column(
            children: [
              Text(
                'This service is starting soon. Thank you for patience.',
              ),
              SizedBox(height: 16),

            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
       /* leading: GestureDetector(
          onTap: () {
          },
          child: badges.Badge(
            *//*position: badges.BadgePosition.topEnd(top: -1, end: 5),
            badgeContent: Text(
              '',
              style: TextStyle(color: Colors.white),
            ),*//*
            child: Icon(
              Icons.notifications,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),*/

        // GestureDetector(
        //   child: Icon(
        //     Icons.notifications,
        //     color: Colors.black,
        //   ),
        //   onTap: () {
        //     Get.to(SimpleNotificaiton());
        //
        //
        //   },
        // ),
        backgroundColor: Colors.white,
        title: Center(
            child: Text("Shaheen Drive",

              style: TextStyle(color: Colors.lightGreen,fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
      ),
      body: Column(
        children: [
          SizedBox(height: queryData.size.height/35,),
          ImageSlider(),



          Center(
            child: Row(
              children: [
                SizedBox(height: queryData.size.height/5,),
                SizedBox(width: queryData.size.width/28,),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context)=> UberHomePage())
                    );
                    // Handle onTap event
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffCAEECA),
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: queryData.size.height / 6.5,
                    width: queryData.size.width / 2.3,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 25,
                          left: 43,
                          child: Transform.scale(
                            scale: 0.6, // Adjust the scale value as needed
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                  image: AssetImage('assets/ride.png'), // Replace with your image path
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              height: queryData.size.height / 6.5,
                              width: queryData.size.width / 2.5,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 90,
                          right: 112,
                          child:  Text(
                            'Ride',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 70,
                          right: 92,
                          child:  Text(
                            'Pohanchee',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff165216),
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 55,
                          right: 95,
                          child:  Text(
                            'Har Jagah',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff165216),
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 20,
                          right: 125,
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
                SizedBox(width: queryData.size.width/20,),
                GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => services(),
                      ),
                    );
                    // Handle onTap event
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffC6DEDB),
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: queryData.size.height / 6.5,
                    width: queryData.size.width / 2.3,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 25,
                          left: 43,
                          child: Transform.scale(
                            scale: 0.6, // Adjust the scale value as needed
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                  image: AssetImage('assets/services bike.png'), // Replace with your image path
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              height: queryData.size.height / 6.5,
                              width: queryData.size.width / 2.5,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 90,
                          right: 80,
                          child:  Text(
                            'Services',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 70,
                          right: 92,
                          child:  Text(
                            'Pohanchee',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff155a58),
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 55,
                          right: 95,
                          child:  Text(
                            'Har Jagah',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff155a58),
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 20,
                          right: 125,
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

          ),
          Center(
            child: Row(
              children: [
                SizedBox(height: queryData.size.height/5,),
                SizedBox(width: queryData.size.width/28,),
                GestureDetector(
                  onTap: () async {
                    showMartDialog();
                    // Handle onTap event
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffEDF6EF),
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: queryData.size.height / 6.5,
                    width: queryData.size.width / 2.3,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 25,
                          left: 43,
                          child: Transform.scale(
                            scale: 0.6, // Adjust the scale value as needed
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                  image: AssetImage('assets/mart.png'), // Replace with your image path
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              height: queryData.size.height / 6.5,
                              width: queryData.size.width / 2.5,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 90,
                          right: 112,
                          child:  Text(
                            'Mart',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 70,
                          right: 92,
                          child:  Text(
                            'Pohanchee',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff165216),
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 55,
                          right: 95,
                          child:  Text(
                            'Har Jagah',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff165216),
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 20,
                          right: 125,
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
                SizedBox(width: queryData.size.width/20,),
                GestureDetector(
                  onTap: () async {
                    openWhatsApp();
                    // Handle onTap event
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffDAE4F4),
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: queryData.size.height / 6.5,
                    width: queryData.size.width / 2.3,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 25,
                          left: 43,
                          child: Transform.scale(
                            scale: 0.6, // Adjust the scale value as needed
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                image: DecorationImage(
                                  image: AssetImage('assets/contact.png'), // Replace with your image path
                                  // fit: BoxFit.cover,
                                ),
                              ),
                              height: queryData.size.height / 6.5,
                              width: queryData.size.width / 2.5,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 90,
                          right: 62,
                          child:  Text(
                            'Contact us',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 70,
                          right: 92,
                          child:  Text(
                            'Pohanchee',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff155a58),
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 55,
                          right: 95,
                          child:  Text(
                            'Har Jagah',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff155a58),
                            ),
                          ),

                        ),
                        Positioned(
                          bottom: 20,
                          right: 125,
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

          ),

          SizedBox(height: queryData.size.height/25,),
          GestureDetector(
            onTap: () {
              launchPhoneNumber('+923459823114');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: queryData.size.height/15,
              width: queryData.size.width/1.2,
              //color: Colors.yellow.shade600,
              padding: const EdgeInsets.all(8),
              // Change button text when light changes state.
              child: Center(child: Text('Emergency',style: TextStyle(
                  fontSize: 16,
                  color: Colors.white
                //fontWeight: FontWeight.bold
              ),)),
            ),
          ),
        ],
      ),

    );
  }
  void launchPhoneNumber(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
