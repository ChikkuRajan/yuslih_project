import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yuslih_project/Personal.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late SharedPreferences logindata;
  late bool newUser;
  AutovalidateMode validate_mode = AutovalidateMode.onUserInteraction;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final _formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset(
                  "assets/images/splash_image.jpg",
                  width: 100,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                child: Text("No account yet ?",
                    style: TextStyle(
                      //fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("Let's fix that now",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 15.0, bottom: 5, top: 20),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: username,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      filled: true,
                      fillColor: Color(0xF5F5F5F5),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black12,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2)),
                      border: OutlineInputBorder(),
                      labelText: 'Your name',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFBFBFBF))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 15.0, top: 20, bottom: 5),
                child: TextFormField(
                  autovalidateMode: validate_mode,
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Email";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Please Enter a Valid Email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
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
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
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
                      hintText: 'Please Enter valid Password',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFBFBFBF))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 15.0, top: 15, bottom: 20),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: confirmpassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Password again";
                    } else if (value != password.text) {
                      return "Please Enter same Password";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      filled: true,
                      fillColor: Color(0xF5F5F5F5),
                      prefixIcon: Icon(
                        Icons.lock_person,
                        color: Colors.black12,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2)),
                      border: OutlineInputBorder(),
                      labelText: 'Confirm password',
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
                      if (_formKey1.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonalPage1()));
                      }
                    },
                    style:
                        OutlinedButton.styleFrom(foregroundColor: Colors.white),
                    child: const Text(
                      'create account',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF3F54D1),
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
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xFFFFFFFF)),
                    child: const Text(
                      'I am a technician',
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
