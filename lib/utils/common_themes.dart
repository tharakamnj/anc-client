import 'package:anc_bus_service/widgets/hexcolor.dart';
import 'package:flutter/material.dart';

class CustomThemes {
  final primaryBtn = HexColor('#005DFF');
  final appBar = Colors.transparent;
  final updateBtn = Colors.blue;
  final createBtn = HexColor('#FFBD00');
  final viewBtn = HexColor('#FFBD00');
  final signoutBtn = HexColor('#FFEAEA');

  final notiTodayCard = HexColor('#F0F5FF');
  final notiTomorrowCard = HexColor('#FFFEF3');
  final notiOlderCard = HexColor('#F6F6F6');
  final notiTodayCardHeader = HexColor('#BDD6FF');
  final notiTomorrowCardHeader = HexColor('#FAF5D2');
  final notiOlderCardHeader = HexColor('#DFDFDF');

  final salesOrderCardClr = HexColor('#D4EEFF');
  final salesReturnsCardClr = HexColor('#FFD4D4');

  Widget btntxtsm(text) {
    return Text(
      text,
      style: TextStyle(fontSize: 12),
    );
  }

  Widget btntxtmd(text) {
    return Text(
      text,
      style: TextStyle(fontSize: 15),
    );
  }

  Widget btntxtboldmd(text) {
    return Text(
      text,
      style: TextStyle(fontSize: 15),
    );
  }
}
