import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoxModel {
  final String title;
  final String description;
  final String subtitle;
  final Color color;
  final String iconPath;

  BoxModel({required this.title, required this.description,required this.subtitle, required this.color,required this.iconPath});
}

class BoxController extends GetxController {
  RxList<BoxModel> boxes = <BoxModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    boxes.addAll([
      BoxModel(title: '  Carpenter   ', iconPath: 'assets/cleaner.png',color: Color(0xffC6DEDB),subtitle: " Reliable Plumbing Services for Your Plumbing Needs", description: " Experience top-notch carpentry services that bring your visions to life. Ourskilled carpenters are dedicated to delivering unparalleled craftsmanship and precision.From customized furniture to stunning cabinetry, our team specializes in tailoredwoodworking solutions that elevate your space. Trust us to provide expert renovationsand meticulous restorations. Discover the perfect blend of functionality and aestheticswith our exceptional carpenter service."),
      BoxModel(title: 'Electrician  ',iconPath: 'assets/electrician.png',color: Color(0xffbeefc6),subtitle: " Professional Electrical Services for Your Home or Business", description: ' Count on our trustworthy plumbing services to solve all your plumbingissues efficiently. Our team of skilled plumbers is dedicated to delivering reliablesolutions, whether its fixing leaks, unclogging drains, or installing new fixtures. Withprompt service and attention to detail, we ensure your plumbing system runs smoothly, providing you with peace of mind and a hassle-free experience.'),
      BoxModel(title: '   Mechanic   ',  iconPath: 'assets/mechanic.png',color: Color(0xffabfffc),subtitle: " Expert Mechanical Services for Your Vehicle",description: 'Get your vehicle back on the road with our expert mechanical services. Ourskilled mechanics have the knowledge and expertise to diagnose and repair a widerange of automotive issues. From routine maintenance to complex repairs, we strive toprovide efficient and reliable solutions. Rest assured that your vehicle is in capablehands, and we are committed to ensuring its optimal performance and your drivingsatisfaction.'),
      BoxModel(title: '    plumber', iconPath: 'assets/plumber.png',color: Color(0xffd6eeaa),subtitle: "",description: ' Count on our trustworthy plumbing services to solve all your plumbingissues efficiently. Our team of skilled plumbers is dedicated to delivering reliablesolutions, whether its fixing leaks, unclogging drains, or installing new fixtures. Withprompt service and attention to detail, we ensure your plumbing system runs smoothly, providing you with peace of mind and a hassle-free experience.'),
      BoxModel(title: '    Cleaner', iconPath: 'assets/cleaner.png',color: Color(
          0xffe8dbf5),subtitle: " Professional Cleaning Services for a Sparkling Clean Space",description: 'Experience the difference of professional cleaning services for a spotlessand hygienic environment. Our dedicated team of cleaners is trained to deliver thoroughand meticulous cleaning tailored to your specific needs. Whether its regular homecleaning, office maintenance, or post-construction cleanup, we use industry-standardtechniques and eco-friendly products to ensure exceptional cleanliness'),
    ]);
  }
}

class BoxGridView extends GetWidget<BoxController> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Services',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Obx(
            () => GridView.builder(
          itemCount: controller.boxes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 25.0,
              mainAxisExtent: 140
          ),
          itemBuilder: (context, index) {
            final box = controller.boxes[index];
            return GestureDetector(
              onTap: () async {
                // Handle onTap event
              },
              child: Container(
                decoration: BoxDecoration(
                  color: box.color,
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
                width: queryData.size.width / 1,
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
                              image: AssetImage(box.iconPath), // Replace with your image path
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
                      right: 92,
                      child:  Text(
                        box.title,
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
            );
          },
        ),
      ),
    );
  }
}

