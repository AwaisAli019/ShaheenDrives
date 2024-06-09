import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class detailservices extends StatefulWidget {
  const detailservices({Key? key}) : super(key: key);

  @override
  State<detailservices> createState() => _detailservicesState();
}

class _detailservicesState extends State<detailservices> {
  void launchPhoneNumber(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        //automaticallyImplyLeading: true,
        title: Center(
          child: Text(
            'Mechanic       ',style: TextStyle(color: Colors.lightGreen),
          ),
        ),

        leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),onPressed: (){
          Navigator.pop(context);
        },),
        //leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,),onPressed: (){},),

      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3.0,
                decoration: BoxDecoration(
                  color: Color(0xffC6DEDB),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
            ],
          ),

          Positioned(
              bottom: 390,
              right: 34,

              child:Image.asset('assets/mechanic.png',width: 300,height: 300,)
          ),
          Positioned(
              bottom: 200,



              child:Text("  Get your vehicle back on the road with our expert \n  mechanical services. Ourskilled mechanics have the \n  knowledge and expertise to diagnose and repair\n  a widerange of automotive issues. From routine \n  maintenance to complex repairs, we strive to provide \n  efficient and reliable solutions. Rest assured that your \n  vehicle is in capablehands, and we are committed to\n  ensuring its optimal performance and your \n  driving satisfaction.")
          ),
          Positioned(
            bottom: 90,
            left: 20,
            child: GestureDetector(
              onTap: (){
                launchPhoneNumber('+923459823114'); // Replace with your desired phone number

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
                width: queryData.size.width/2.5,
                //color: Colors.yellow.shade600,
                padding: const EdgeInsets.all(8),
                // Change button text when light changes state.
                child: Center(child: Text('Call',style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  //fontWeight: FontWeight.bold
                ),)),
              ),
            ),
          ),
          Positioned(
            bottom: 90,
            right: 20,
            child: GestureDetector(
              onTap: (){
                openWhatsApp();
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
                width: queryData.size.width/2.5,
                //color: Colors.yellow.shade600,
                padding: const EdgeInsets.all(8),
                // Change button text when light changes state.
                child: Center(child: Text('Whatsapp',style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  //fontWeight: FontWeight.bold
                ),)),
              ),
            ),
          ),



          // Container(
          //   height: MediaQuery.of(context).size.height/4,
          //   margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2, left:MediaQuery.of(context).size.width/10, right:MediaQuery.of(context).size.width/10  ),
          //   child:
          // FutureBuilder(
          //     future: userId,
          //     builder: (context, snapshot) {
          //       if(snapshot.data!=null){
          //         print(snapshot.data);
          //         return Center(
          //           child: QrImage(
          //             data: snapshot.data,
          //             version: QrVersions.auto,
          //             size: MediaQuery.of(context).size.width/2.3,
          //             //gapless: true,
          //           ),
          //         );}
          //       else return
          //         CircularProgressIndicator();
          //     }
          // ),
          //   ),




        ],
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.

  }
}
