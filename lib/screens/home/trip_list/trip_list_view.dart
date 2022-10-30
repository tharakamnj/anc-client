import 'package:anc_bus_service/models/ClientModel.dart';
import 'package:anc_bus_service/models/ClientTripModel.dart';
import 'package:anc_bus_service/screens/home/trip_list/trip_list_controller.dart';
import 'package:anc_bus_service/utils/app_utils.dart';
import 'package:anc_bus_service/utils/common_network.dart';
import 'package:anc_bus_service/widgets/custom_app_bar.dart';
import 'package:anc_bus_service/widgets/custom_drawer.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class TripListScreen extends StatefulWidget {
  const TripListScreen({Key? key}) : super(key: key);
  @override
  _TripListScreenState createState() => _TripListScreenState();
}

@immutable
class _TripListScreenState extends State<TripListScreen> {
  final TripListController tripListController = new TripListController();
  final AppUtils utils = new AppUtils();
  bool loading = true;
  final CommonNetwork api = CommonNetwork();
  late List<Client> clientDetails;
  late List<ClientTrip> tripList = [];

  loadTripList(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await api.getApi(
        context, '/client/' + prefs.getInt('clientId').toString());
    print(response.data['payload'].toString());
    if (response.data['payload'] != null) {
      List jsonResponseClient = response.data['payload'];
      List jsonResponseTrips = response.data['payload'][0]['trips'];
      clientDetails =
          jsonResponseClient.map((job) => Client.fromJson(job)).toList();
      tripList =
          jsonResponseTrips.map((job) => ClientTrip.fromJson(job)).toList();
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    loadTripList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom("Trip List"),
      drawer: const CustomDrawer('students'),
      body: SingleChildScrollView(
        child:
            //tripListController.tripList == null
            //     ? tripListController.tripList.isEmpty
            //         ? Center(
            //             child: Padding(
            //             padding: const EdgeInsets.all(12),
            //             child: CircularProgressIndicator(),
            //           ))
            //         : Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               ListView.builder(
            //                 shrinkWrap: true,
            //                 // ignore: unnecessary_null_comparison
            //                 itemCount: tripListController.tripList.length,
            //                 itemBuilder: (BuildContext context, int index) {
            //                   return renderListViewCard(
            //                       tripListController.tripList[index]);
            //                 },
            //               ),
            //             ],
            //           )
            //     : Center(
            //         child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text('No data Found'),
            //       )),
            loading
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: CircularProgressIndicator(),
                  ))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        // ignore: unnecessary_null_comparison
                        itemCount: tripList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return renderListViewCard(tripList[index]);
                        },
                      ),
                    ],
                  ),
      ),
    );
  }
}

Widget renderListViewCard(data) {
  // ignore: unnecessary_new
  var pickupTime = DateTime.tryParse(data.pickUp);
  var dropOutTime = DateTime.tryParse(data.dropOut);
  return Card(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              // ignore: prefer_interpolation_to_compose_strings
              child: Text(pickupTime == null
                  ? 'Pickup time: '
                  : 'Pickup time: ' + pickupTime.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              // ignore: prefer_interpolation_to_compose_strings
              child: Text('Drop off time: ' + dropOutTime.toString()),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                padding: EdgeInsets.all(0),
                backgroundColor: Color.fromARGB(255, 66, 98, 122),
                label: Text(
                  data.tripType,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
