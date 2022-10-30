import 'package:anc_bus_service/routes/app_pages.dart';
import 'package:anc_bus_service/utils/common_network.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapController extends GetxController {
  final test = "Hi";
  double lat = 6.878939;
  double long = 79.921858;
  double currentLat = 6.878939;
  double currentLong = 79.921858;
  String locationName = "Colombo";
  CommonNetwork api = CommonNetwork();
  int driverId = 0;

  loadDriverLocation(context) async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457
    currentLat = position.latitude;
    currentLong = position.longitude;
  }


  onStartJourney(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var req = {
      "tripType": "UP",
      "startLat": currentLat,
      "startLon": currentLong
    };
    print(req);
    var response = await api.postApi(
        context, '/dtrip/start/' + prefs.getInt("driverId").toString(), req);
    print(response);
    if (response.data != null) {
      print(response.data);
      // if (response.data['payload'] != null) {
      //   Get.offAndToNamed(Routes.MAP);
      // }
    }
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.success,
          title: "Journey Started",
          text: "The journey has started.\nTime: "),
    );
  }

  onEndJourney(context) async {
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.success,
          title: "Journey Ended",
          text: "The journey has ended.\nTime: "),
    );
  }
}
