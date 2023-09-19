import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:yuslih_project/login_page.dart';

class PersonalPage1 extends StatefulWidget {
  const PersonalPage1({Key? key}) : super(key: key);

  @override
  State<PersonalPage1> createState() => _PersonalPage1State();
}

class _PersonalPage1State extends State<PersonalPage1> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: 700,
            color: Colors.grey.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //color: Colors.cyanAccent,
                  height: 230,
                  width: 390,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 180.0),
                    child: Stack(children: [
                      Icon(
                        Icons.circle,
                        color: Colors.grey.shade100,
                        size: 220,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Icon(
                          Icons.circle,
                          color: Colors.grey.shade50,
                          size: 200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 180.0),
                        child: Text("1/3"),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 10),
                  child: Text("Personal Information",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF000000),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 10),
                  child: Text("Let’s know each other better",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 5, top: 0),
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
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.person, color: Colors.black12),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 2)),
                        border: OutlineInputBorder(),
                        labelText: 'Your name',
                        hintText: 'Enter user name as you wish'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 5, bottom: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Phone";
                      } else if (!RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$')
                          .hasMatch(value)) {
                        return "Please Enter Valid Phone with country code";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.black12,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 2)),
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        hintText: 'Enter phone with country code'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 50),
                  child: SizedBox(
                    height: 40,
                    width: 340,
                    child: OutlinedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // _formKey.currentState!.save();
                          print(username.text);
                          // print(password.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PersonalPage2()));
                          // use the email provided here
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF3F54D1),
                          foregroundColor: Color(0xFFFFFFFF)),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PersonalPage2 extends StatefulWidget {
  const PersonalPage2({Key? key}) : super(key: key);

  @override
  State<PersonalPage2> createState() => _PersonalPage2State();
}

class _PersonalPage2State extends State<PersonalPage2> {
  String dropdownvalue = ' select';

  var items = [
    ' select',
    '0-3',
    '0-6',
    '12-24',
    '24-48',
    '48 and above',
  ];
  String choose_button_name = "Choose Categories";
  final _formKey2 = GlobalKey<FormState>();
  List<bool> values_checkbox = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  String selected = "";
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Expert Painter",
    },
    {
      "id": 1,
      "value": false,
      "title": "Carpenter",
    },
    {
      "id": 2,
      "value": false,
      "title": "Plumber",
    },
    {
      "id": 3,
      "value": false,
      "title": "Cleaner",
    },
    {
      "id": 4,
      "value": false,
      "title": "House keeping",
    },
    {
      "id": 5,
      "value": false,
      "title": "Mechanic",
    },
    {
      "id": 6,
      "value": false,
      "title": "Ac Mechanic",
    },
  ];

  List checkbox_items = [
    "Expert Painter",
    "Carpenter",
    "Plumber",
    "Cleaner",
    "Gardener",
    "House Keeping",
    "Helper",
    "Welder",
    "House Mechanic",
    "AC Mechanic"
  ];
  TextEditingController dropdown = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey2,
          child: Container(
            height: 700,
            color: Colors.grey.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //color: Colors.cyanAccent,
                  height: 200,
                  width: 390,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 150.0),
                    child: Stack(children: [
                      Icon(
                        Icons.circle,
                        color: Colors.grey.shade100,
                        size: 240,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Icon(
                          Icons.circle,
                          color: Colors.grey.shade50,
                          size: 220,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200.0),
                        child: Text("2/3"),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, bottom: 10),
                  child: Text("Choose your field(s)",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF000000),
                      )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, bottom: 10, top: 5),
                  child: Text("Help us to fix",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 5, bottom: 5),
                  child: Text("You are qualified for"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 5, bottom: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0x08000000),
                        border:
                            Border.all(color: Colors.blue.shade50, width: 0)),
                    height: 50,
                    width: 360,
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("List of Categories"),
                                actions: [
                                  SizedBox(
                                    height: 40,
                                    width: 150,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        setState(() {});
                                      },
                                      style: OutlinedButton.styleFrom(
                                          backgroundColor: Color(0xFF3F54D1),
                                          foregroundColor: Color(0xFFFFFFFF)),
                                      child: const Text(
                                        'Done',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                                content: StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return Container(
                                    height: 600,
                                    width: 390,
                                    // color: Colors.cyanAccent,
                                    child: ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            Divider(
                                              color: Colors.black,
                                            ),
                                        itemCount: checkListItems.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Row(
                                            children: [
                                              Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Color(0xFF3F54D1),
                                                value: checkListItems[index]
                                                    ["value"],
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    for (var element
                                                        in checkListItems) {
                                                      element["value"] = false;
                                                    }
                                                    checkListItems[index]
                                                        ["value"] = value;
                                                    selected =
                                                        "${checkListItems[index]["id"]},${checkListItems[index]["title"]},${checkListItems[index]["value"]}";
                                                    choose_button_name =
                                                        checkListItems[index]
                                                            ["title"];
                                                  });
                                                },
                                              ),
                                              Text(
                                                checkListItems[index]["title"],
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ],
                                          );
                                        }),
                                  );
                                }),
                              );
                            });
                      },
                      child: Text(
                        choose_button_name,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, top: 15, bottom: 10),
                  child: Text("How many years of experience you got?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF252528),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 13.0, bottom: 15, top: 0, right: 15),
                  child: TextFormField(
                    controller: dropdown,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2)),
                      suffixIcon: DropdownButtonFormField(
                        value: dropdownvalue,
                        onChanged: (newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15),
                  child: Text("What’s your pricing in an hourly basis ?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF252528),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 5, top: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: price,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter amount';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2)),
                      border: OutlineInputBorder(),
                      labelText: ' Enter amount in INR',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 30),
                  child: SizedBox(
                    height: 40,
                    width: 350,
                    child: OutlinedButton(
                      onPressed: () {
                        if (_formKey2.currentState!.validate()) {
                          // _formKey.currentState!.save();
                          //print(username.text);
                          // print(password.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PersonalPage3()));
                          // use the email provided here
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF3F54D1),
                          foregroundColor: Color(0xFFFFFFFF)),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PersonalPage3 extends StatefulWidget {
  const PersonalPage3({Key? key}) : super(key: key);

  @override
  State<PersonalPage3> createState() => _PersonalPage3State();
}

class _PersonalPage3State extends State<PersonalPage3> {
  final _formKey3 = GlobalKey<FormState>();
  TextEditingController adhar1 = TextEditingController();
  TextEditingController adhar2 = TextEditingController();
  TextEditingController adhar3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey3,
          child: Container(
            height: 700,
            color: Colors.grey.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //color: Colors.cyanAccent,
                  height: 200,
                  width: 390,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 80.0),
                        child: Icon(
                          Icons.circle,
                          color: Colors.grey.shade100,
                          size: 240,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Icon(
                          Icons.circle,
                          color: Colors.grey.shade50,
                          size: 220,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 320.0),
                        child: Text("3/3"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 100.0,
                        ),
                        child: Text("Almost there",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 130.0,
                        ),
                        child: Text("Lets finish registration",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF000000),
                            )),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160.0, top: 10),
                  child: Stack(children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      radius: 40,
                      child: Icon(
                        Icons.camera_alt,
                        size: 30,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 65.0, left: 55),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0xFF3F54D1),
                      ),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 40),
                  child: Text("Aadhar Verification",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF000000),
                      )),
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18.0, right: 5, top: 30),
                      child: Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: adhar1,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter first 4 digit of aadhar";
                            } else if (!RegExp(r'^(?:[+0][1-9])?[0-9]{4}$')
                                .hasMatch(value)) {
                              return "Please Enter 4 digit";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            // contentPadding:
                            //     EdgeInsets.symmetric(vertical: 20.0),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2)),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18.0, right: 5, top: 30),
                      child: Container(
                        width: 100,
                        height: 60,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: adhar2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter 2nd 4 digit of aadhar";
                            } else if (!RegExp(r'^(?:[+0][1-9])?[0-9]{4}$')
                                .hasMatch(value)) {
                              return "Please Enter 4 digit";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            // contentPadding:
                            //     EdgeInsets.symmetric(vertical: 10.0),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2)),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18.0, right: 4, top: 30),
                      child: Container(
                        width: 100,
                        height: 60,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: adhar3,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter last 4 digit of aadhar";
                            } else if (!RegExp(r'^(?:[+0][1-9])?[0-9]{4}$')
                                .hasMatch(value)) {
                              return "Please Enter 4 digit";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            // contentPadding:
                            //     EdgeInsets.symmetric(vertical: 10.0),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.transparent, width: 2)),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 40),
                  child: SizedBox(
                    height: 40,
                    width: 350,
                    child: OutlinedButton(
                      onPressed: () {
                        if (_formKey3.currentState!.validate()) {
                          // _formKey.currentState!.save();
                          //print(username.text);
                          // print(password.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnimatedSplashScreen(
                                      duration: 1600,
                                      splash: 'assets/gif/success.gif',
                                      splashIconSize: 200,
                                      nextScreen: LoginPage(),
                                      splashTransition:
                                          SplashTransition.fadeTransition,
                                      //pageTransitionType: PageTransitionType.scale,
                                      backgroundColor: Colors.white)));
                          // use the email provided here
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF3F54D1),
                          foregroundColor: Color(0xFFFFFFFF)),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
