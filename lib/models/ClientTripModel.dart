import 'dart:convert';

ClientTrip clientTripFromJson(String str) =>
    ClientTrip.fromJson(json.decode(str));

class ClientTrip {
  ClientTrip({
    required this.tripId,
    required this.tripType,
    required this.pickUp,
    required this.dropOut,
    required this.pickLat,
    required this.pickLon,
    required this.dropLat,
    required this.dropLon,
    required this.driverTripId,
  });

  int tripId;
  String tripType;
  String pickUp;
  String dropOut;
  double pickLat;
  double pickLon;
  double dropLat;
  double dropLon;
  int driverTripId;

  factory ClientTrip.fromJson(Map<String, dynamic> json) => ClientTrip(
        tripId: json["tripId"],
        tripType: json["tripType"],
        pickUp: json["pickUp"] ?? "",
        dropOut: json["dropOut"],
        pickLat: json["pickLat"],
        pickLon: json["pickLon"],
        dropLat: json["dropLat"],
        dropLon: json["dropLon"],
        driverTripId: json["driverTripId"],
      );

  Map<String, dynamic> toJson() => {
        "tripId": tripId,
        "tripType": tripType,
        "pickUp": pickUp,
        "dropOut": dropOut,
        "pickLat": pickLat,
        "pickLon": pickLon,
        "dropLat": dropLat,
        "dropLon": dropLon,
        "driverTripId": driverTripId,
      };
}
