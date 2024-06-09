import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class detailservices1 extends StatefulWidget {
  const detailservices1({Key? key}) : super(key: key);

  @override
  State<detailservices1> createState() => _detailservices1State();
}

class _detailservices1State extends State<detailservices1> {
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
            'Plumber       ',style: TextStyle(color: Colors.lightGreen),
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
              bottom: 410,
              right: 54,

              child:Image.asset('assets/plumber.png',width: 250,height: 250,)
          ),
          Positioned(
              bottom: 250,



              child:Text("  Count on our trustworthy plumbing services to solve all \n  your plumbingissues efficiently. Our team of skilled \n  plumbers is dedicated to delivering reliablesolutions, \n  whether it's fixing leaks, unclogging drains, or installing \n  new fixtures. Withprompt service and attention to detail, \n  we ensure your plumbing system runs smoothly, providing \n  you with peace of mind and a hassle-free experience..")
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
