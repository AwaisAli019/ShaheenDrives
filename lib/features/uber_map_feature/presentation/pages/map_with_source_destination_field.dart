import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shaheendrive/features/uber_home_page_feature/presentation/pages/uber_home_page.dart';
import 'package:shaheendrive/features/uber_map_feature/presentation/getx/uber_map_controller.dart';
import 'package:shaheendrive/features/uber_map_feature/presentation/widgets/map_confirmation_bottomsheet.dart';
import 'package:shaheendrive/injection_container.dart' as di;
import 'package:geolocator/geolocator.dart';

class MapWithSourceDestinationField extends StatefulWidget {
  final CameraPosition defaultCameraPosition;
  final CameraPosition newCameraPosition;

  const MapWithSourceDestinationField({
    required this.newCameraPosition,
    required this.defaultCameraPosition,
    Key? key,
  }) : super(key: key);

  @override
  _MapWithSourceDestinationFieldState createState() =>
      _MapWithSourceDestinationFieldState();
}

class _MapWithSourceDestinationFieldState
    extends State<MapWithSourceDestinationField> {
  final sourcePlaceController = TextEditingController();
  final destinationController = TextEditingController();

  final UberMapController _uberMapController =
  Get.put(di.sl<UberMapController>());

  @override
  void initState() {
    super.initState();
    _updateCameraPosition();
  }

  void _updateCameraPosition() async {
    try {
      // Check if location permission is granted
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Request location permission if not granted
        permission = await Geolocator.requestPermission();
        if (permission != LocationPermission.whileInUse &&
            permission != LocationPermission.always) {
          // Handle case where permission is still not granted
          return;
        }
      }

      // Get the current user location
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Update the camera position with the user's location
      final newCameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14.0,
      );

      final controller = await _uberMapController.controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
    } catch (e) {
      print('Error getting user location: $e');
      // Handle any errors that occur while retrieving the location
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const UberHomePage());
        _uberMapController.subscription.cancel();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Obx(
                    () => Column(
                  children: [
                    Expanded(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: widget.defaultCameraPosition,
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        markers: _uberMapController.markers.value.toSet(),
                        polylines: {
                          Polyline(
                            polylineId: const PolylineId("polyLine"),
                            color: Colors.black,
                            width: 6,
                            jointType: JointType.round,
                            startCap: Cap.roundCap,
                            endCap: Cap.roundCap,
                            geodesic: true,
                            points: _uberMapController.polylineCoordinates.value,
                          ),
                          Polyline(
                            polylineId: const PolylineId("polyLineForAcptDriver"),
                            color: Colors.black,
                            width: 6,
                            jointType: JointType.round,
                            startCap: Cap.roundCap,
                            endCap: Cap.roundCap,
                            geodesic: true,
                            points: _uberMapController.polylineCoordinatesforacptDriver.value,
                          ),
                        },
                        zoomControlsEnabled: false,
                        zoomGesturesEnabled: true,
                        onMapCreated: (GoogleMapController controller) {
                          _uberMapController.controller.complete(controller);
                          controller.animateCamera(
                            CameraUpdate.newCameraPosition(widget.newCameraPosition),
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: _uberMapController.isReadyToDisplayAvlDriver.value,
                      child: const SizedBox(
                        height: 250,
                        child: MapConfirmationBottomSheet(),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Obx(
                        () => Visibility(
                      visible: !_uberMapController.isPoliLineDraw.value,
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        color: Colors.grey[300],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.offAll(() => const UberHomePage());
                                  _uberMapController.subscription.cancel();
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.arrowLeft,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                              child: TextField(
                                onChanged: (val) {
                                  _uberMapController.getPredictions(val, 'source');
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter Source Place",
                                ),
                                controller: sourcePlaceController
                                  ..text = _uberMapController.sourcePlaceName.value,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 15),
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                              ),
                              child: TextField(
                                onChanged: (val) {
                                  _uberMapController.getPredictions(val, 'destination');
                                },
                                decoration: const InputDecoration(
                                  hintText: "Enter Destination Place",
                                  border: InputBorder.none,
                                ),
                                controller: destinationController
                                  ..text = _uberMapController.destinationPlaceName.value,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                          () => Visibility(
                        visible: _uberMapController.uberMapPredictionData.isNotEmpty,
                        child: Container(
                          color: Colors.white,
                          child: ListView.builder(
                            itemCount: _uberMapController.uberMapPredictionData.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  if (_uberMapController.predictionListType.value == 'source') {
                                    _uberMapController.setPlaceAndGetLocationDeatailsAndDirection(
                                      sourcePlace: _uberMapController.uberMapPredictionData[index].mainText.toString(),
                                      destinationPlace: "",
                                    );
                                  } else {
                                    _uberMapController.setPlaceAndGetLocationDeatailsAndDirection(
                                      sourcePlace: "",
                                      destinationPlace: _uberMapController.uberMapPredictionData[index].mainText.toString(),
                                    );
                                  }
                                },
                                title: Text(_uberMapController.uberMapPredictionData[index].mainText.toString()),
                                subtitle: Text(_uberMapController.uberMapPredictionData[index].secondaryText.toString()),
                                trailing: const Icon(Icons.check),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: _uberMapController.isDriverLoading.value,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                          color: Colors.black,
                        ),
                        Text(
                          "  Loading Rides....",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
