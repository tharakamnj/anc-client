import 'package:anc_bus_service/screens/authentication/register/register_controller.dart';
import 'package:anc_bus_service/utils/common_themes.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

@immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

@immutable
class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController registerController = Get.put(RegisterController());
  final CustomThemes theme = CustomThemes();

  // Initially password is obscure
  bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(body: GetBuilder<RegisterController>(
      builder: (_) {
        return SingleChildScrollView(
          child: Container(
            height: height,
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 25),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  // Image.asset(
                                  //   'icon.png',
                                  //   width: 200,
                                  // ),
                                  const Text(
                                    'ANC',
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Text(
                                    'School Service',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Form(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          right: 30,
                                          left: 30,
                                          bottom: 10),
                                      child: TextFormField(
                                        controller: registerController
                                            .firstnametextfield,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter First name';
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Firstname",
                                          fillColor: Colors.grey,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          focusColor: Colors.white,
                                          contentPadding:
                                              const EdgeInsets.all(16),
                                        ),
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          right: 30,
                                          left: 30,
                                          bottom: 10),
                                      child: TextFormField(
                                        controller: registerController
                                            .lastnametextfield,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter Lastname';
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Lastname",
                                          fillColor: Colors.grey,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          focusColor: Colors.white,
                                          contentPadding:
                                              const EdgeInsets.all(16),
                                        ),
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          right: 30,
                                          left: 30,
                                          bottom: 10),
                                      child: TextFormField(
                                        controller: registerController
                                            .usernametextfield,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter Username';
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Username",
                                          fillColor: Colors.grey,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          focusColor: Colors.white,
                                          contentPadding:
                                              const EdgeInsets.all(16),
                                        ),
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          right: 30,
                                          left: 30,
                                          bottom: 10),
                                      child: TextFormField(
                                        controller: registerController
                                            .mobileNumbertextfield,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter Mobile number';
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Mobile number",
                                          fillColor: Colors.grey,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          focusColor: Colors.white,
                                          contentPadding:
                                              const EdgeInsets.all(16),
                                        ),
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          right: 30,
                                          left: 30,
                                          bottom: 10),
                                      child: TextFormField(
                                        controller: registerController
                                            .serviceIdtextfield,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter Service ID';
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: "Service ID",
                                          fillColor: Colors.grey,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          focusColor: Colors.white,
                                          contentPadding:
                                              const EdgeInsets.all(16),
                                        ),
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          right: 30,
                                          left: 30,
                                          bottom: 10),
                                      child: TextFormField(
                                        controller: registerController
                                            .passwordtextfield,
                                        // obscureText: true,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter Password';
                                          } else {
                                            return null;
                                          }
                                        },
                                        cursorColor: Colors.white,
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                          hintText: "Password",
                                          fillColor: Colors.red,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.all(16),
                                          suffix: InkWell(
                                            onTap: _toggle,
                                            child: const Icon(Icons.visibility),
                                          ),
                                        ),
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0,
                                          right: 30,
                                          left: 30,
                                          bottom: 10),
                                      child: TextFormField(
                                        controller: registerController
                                            .repasswordtextfield,
                                        // obscureText: true,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please re-enter Password';
                                          } else {
                                            return null;
                                          }
                                        },
                                        cursorColor: Colors.white,
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                          hintText: "Re-enter Password",
                                          fillColor: Colors.red,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.all(16),
                                          suffix: InkWell(
                                            onTap: _toggle,
                                            child: const Icon(Icons.visibility),
                                          ),
                                        ),
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 20, right: 30, left: 30, bottom: 10),
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        // Padding(
                                        //   padding: EdgeInsets.symmetric(horizontal: 50.0),
                                        ElevatedButton(
                                          onPressed: () {
                                            registerController
                                                .onRegister(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Sign up',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            registerController.onLogin(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey,
                                            shape: StadiumBorder(),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Sign in',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Visibility(
                                visible: false,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
