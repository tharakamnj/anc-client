import 'dart:async';

import 'package:anc_bus_service/screens/home/map/map_controller.dart';
import 'package:anc_bus_service/utils/app_utils.dart';
import 'package:anc_bus_service/utils/common_network.dart';
import 'package:anc_bus_service/widgets/custom_app_bar.dart';
import 'package:anc_bus_service/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@immutable
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
  @override
  _MapScreenState createState() => _MapScreenState();
}

@immutable
class _MapScreenState extends State<MapScreen> {
  final MapController mapController = Get.put(MapController());
  final AppUtils utils = new AppUtils();
  CommonNetwork api = CommonNetwork();

  final CameraPosition _initialLocation = const CameraPosition(
    target: LatLng(6.878939, 79.921858),
  );
  late GoogleMapController _controller;

  double currentLocLat = 0;
  double currentLocLong = 0;
  Set<Marker> _markers = {};
  Timer? timer;

  static const LatLng _center = const LatLng(6.878939, 79.921858);

  getDriverLocation(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await api.getApi(
        context, '/location/' + prefs.getInt('clientId').toString());
    print(response);
    if (response != null) {
      setState(() {
        _markers = {};
        _markers.add(
          Marker(
            markerId: MarkerId(mapController.locationName),
            position: LatLng(response.data['payload'][0]['lat'],
                response.data['payload'][0]['long']),
          ),
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadInitialMarker();
    getDriverLocation(context);
    timer = Timer.periodic(
        Duration(seconds: 15), (Timer t) => getDriverLocation(context));
  }

  loadInitialMarker() async {
    await mapController.loadDriverLocation(context);

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(mapController.locationName),
          position: LatLng(mapController.lat, mapController.long),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(""),
      drawer: const CustomDrawer('home'),
      body: SlidingUpPanel(
        panel: const Center(
          child: Text("This is the sliding Widget"),
        ),
        collapsed: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 73, 90, 99),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Journey status: ',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color.fromARGB(255, 178, 178, 178),
                        ),
                      ),
                      const Text(
                        'Estimated time for pickup: ',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color.fromARGB(255, 178, 178, 178),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Started',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        '5 minutes',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: GoogleMap(
          // ignore: prefer_const_constructors
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          mapType: MapType.normal,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller = controller;
          },
          markers: _markers,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
