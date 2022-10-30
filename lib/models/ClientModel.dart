import 'dart:convert';
import 'package:anc_bus_service/models/ClientTripModel.dart';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

class Client {
  Client({
    required this.clientId,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.password,
    required this.lat,
    required this.lon,
    required this.mobileNo,
    required this.deviceId,
    required this.status,
    required this.trips,
  });

  int clientId;
  String firstName;
  String lastName;
  String username;
  String password;
  double lat;
  double lon;
  String mobileNo;
  String deviceId;
  String status;
  List<ClientTrip> trips;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        clientId: json["clientId"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        password: json["password"] ?? "",
        lat: json["lat"],
        lon: json["lon"],
        mobileNo: json["mobileNo"],
        deviceId: json["deviceId"] ?? "",
        status: json["status"],
        trips: parseTrip(json["trips"]),
      );

  static List<ClientTrip> parseTrip(jsonObj) {
    List<ClientTrip> tripList;
    tripList =
        (jsonObj as List).map((job) => ClientTrip.fromJson(job)).toList();
    return tripList;
  }
}
