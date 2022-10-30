import 'package:anc_bus_service/screens/authentication/login/login_view.dart';
import 'package:anc_bus_service/screens/authentication/register/register_view.dart';
import 'package:anc_bus_service/screens/home/map/map_view.dart';
import 'package:anc_bus_service/screens/home/trip_list/trip_list_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.MAP,
      page: () => const MapScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.STUDENTLIST,
      page: () => const TripListScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterScreen(),
      transition: Transition.leftToRight,
    )
  ];
}
