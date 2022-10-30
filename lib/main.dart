import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:anc_bus_service/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
        title: 'Flutter Application | Template',
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.orange,
          accentColor: Colors.orangeAccent,
          fontFamily: 'Montserrat',
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
        ),
      ),
  );
}