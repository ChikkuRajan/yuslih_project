import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yuslih_project/home_user.dart';
import 'package:yuslih_project/registration.dart';
import 'package:yuslih_project/technician_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences loginData;
  late bool newUser;
  late bool newUserTech;
  AutovalidateMode validate_mode = AutovalidateMode.onUserInteraction;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey2 = GlobalKey<FormState>();

  @override
  void initState() {
    check_if_already_login();
    // TODO: implement initState
    super.initState();
  }

  void check_if_already_login() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool("login") ?? true);
    newUserTech = (loginData.getBool("logins") ?? true);

    print(newUser);
    if (newUser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeUserPage()));
    } else if (newUserTech == false) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => TechnicianHomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/login_image.jpg",
                width: 400,
                height: 310,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                child: Text("Broken something ?",
                    style: TextStyle(
                      //fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("Login to fix it",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 15.0, top: 20, bottom: 5),
                child: TextFormField(
                  autovalidateMode: validate_mode,
                  controller: username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                      filled: true,
                      fillColor: Color(0xF5F5F5F5),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black12,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2)),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400, color: Color(0xFFBFBFBF))
                      //hintText: 'Enter username as you wish'
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 15.0, top: 15, bottom: 5),
                child: TextFormField(
                  autovalidateMode: validate_mode,
                  controller: password,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Password";
                    } else if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                        .hasMatch(value)) {
                      return "Please Enter Valid Password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 18.0),
                      filled: true,
                      fillColor: Color(0xF5F5F5F5),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black12,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2)),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFBFBFBF))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF4FE0B5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.transparent,
                          spreadRadius: 3,
                          blurRadius: 10),
                    ],
                  ),
                  width: 350,
                  height: 45,
                  child: TextButton(
                    onPressed: () {
                      if (_formKey2.currentState!.validate()) {
                        if (username.text == "Technician" &&
                            password.text == "Tech@123") {
                          if (username != " " && password != "") {
                            print("successfull");
                            loginData.setBool("logins", false);

                            loginData.setString("usernames", username.text);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TechnicianHomePage()));
                          }
                        } else {
                          if (username != " " && password != "") {
                            print("successfull");
                            loginData.setBool("login", false);

                            loginData.setString("username", username.text);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeUserPage()));
                          }
                        }
                      }
                    },
                    style:
                        OutlinedButton.styleFrom(foregroundColor: Colors.white),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150.0, top: 20),
                child: Text(
                  "New member?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8F8F8F),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFFE7FBF5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.transparent,
                          spreadRadius: 3,
                          blurRadius: 10),
                    ],
                  ),
                  width: 350,
                  height: 45,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()));
                    },
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFF4FE0B5)),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
