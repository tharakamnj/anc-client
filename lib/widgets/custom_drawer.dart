import 'package:anc_bus_service/routes/app_pages.dart';
import 'package:anc_bus_service/utils/app_utils.dart';
import 'package:anc_bus_service/widgets/hexcolor.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ConfirmAction { CANCEL, ACCEPT }

@immutable
class CustomDrawer extends StatefulWidget {
  final title;
  const CustomDrawer(this.title, {Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  AppUtils appUtils = AppUtils();
  bool showUserDetails = false;
  String _loggedUser = "Welcome, ";
  bool journeyStatus = false;
  String displayName = "";

  var homeSelected = false;
  var profileSelected = false;
  var studentListSelected = false;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<Null> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (journeyStatus != 1.0) {
      ArtDialogResponse response = await ArtSweetAlert.show(
          barrierDismissible: false,
          context: context,
          artDialogArgs: ArtDialogArgs(
              denyButtonText: "No",
              title: "Logout Confirmation!",
              text: "Are you sure  you want to log out?",
              confirmButtonText: "Yes",
              type: ArtSweetAlertType.warning));

      if (response == null) {
        return;
      }

      if (response.isTapConfirmButton) {
        ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.success, title: "Logging out . . ."),
        );
        Get.toNamed(Routes.LOGIN);
        return;
      }
    } else {}
  }

  Future<Null> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      displayName = prefs.getString("firstName").toString() +
          " " +
          prefs.getString("lastName").toString();
    });
  }

  navigateToProfile() {
    // Get.offAndToNamed(Routes.PROFILE);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title == 'home') {
      homeSelected = true;
    } else if (widget.title == 'profile') {
      profileSelected = true;
    } else if (widget.title == 'students') {
      studentListSelected = true;
    }
    return Drawer(
      child: Column(children: [
        UserAccountsDrawerHeader(
          onDetailsPressed: () {
            setState(() {
              showUserDetails = !showUserDetails;
            });
          },
          accountName: Text(
            _loggedUser + displayName,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          accountEmail: Text(""),
          currentAccountPicture: const CircleAvatar(
            backgroundColor: Color.fromRGBO(6, 103, 128, 1),
            child: Text(
              "U",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        // UserAccountsDrawerHeader(
        //   accountName: Text("Cleudice Santos"),
        //   accountEmail: Text("cleudice.ms@gmail.com"),
        //   onDetailsPressed: () {
        //     setState(() {
        //       showUserDetails = !showUserDetails;
        //     });
        //   },
        // ),
        Expanded(
            child: showUserDetails ? _buildUserDetail() : _buildDrawerList()),
        Align(
          alignment: FractionalOffset.bottomCenter,
          // This container holds all the children that will be aligned
          // on the bottom and should not scroll with the above ListView
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Version ${appUtils.version}',
                style: const TextStyle(fontSize: 12, color: Colors.orange),
              ),
            ),
          ]),
        ),
      ]),
    );
  }

  Widget _buildDrawerList() {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.home,
            color: homeSelected == true ? HexColor('#026F9F') : Colors.grey,
            size: 30.0,
          ),
          title: const Text(
            'Home',
          ),
          onTap: () {
            Get.offAndToNamed(Routes.MAP);
          },
          selected: homeSelected,
        ),
        ListTile(
          leading: Icon(
            Icons.list,
            color:
                studentListSelected == true ? HexColor('#026F9F') : Colors.grey,
            size: 30.0,
          ),
          title: const Text(
            'Trip List',
          ),
          onTap: () {
            Get.offAndToNamed(Routes.STUDENTLIST);
          },
          selected: studentListSelected,
        ),
      ],
    );
  }

  Widget _buildUserDetail() {
    return Container(
      child: ListView(
        children: [
          // ListTile(
          //   leading: Icon(
          //     Icons.account_circle,
          //     color:
          //         profileSelected == true ? HexColor('#026F9F') : Colors.grey,
          //     size: 30.0,
          //   ),
          //   title: const Text(
          //     'Profile',
          //   ),
          //   onTap: () {
          //     // Get.offAndToNamed(Routes.PROFILE);
          //   },
          //   selected: profileSelected,
          // ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app,
              color: Colors.grey,
              size: 30.0,
            ),
            title: const Text(
              'Log out',
            ),
            onTap: () {
              // Navigator.pop(context);
              logout();
            },
            // selected: false,
          ),
        ],
      ),
    );
  }
}
