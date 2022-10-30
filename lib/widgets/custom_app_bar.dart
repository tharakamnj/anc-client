import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final double _prefferedHeight = 80.0;

  String title;

  AppBarCustom(this.title) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _prefferedHeight,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(5, 54, 67, 1),
              Color.fromRGBO(6, 103, 128, 1),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
        ),
      ),
    );
  }

  @override
  // ignore: todo
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}
