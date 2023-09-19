import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 160.0, bottom: 5),
                child: Text("Profile",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 160.0),
                child: Stack(children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage("assets/images/login_person.jpg"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 45),
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.greenAccent,
                      child: Icon(
                        Icons.edit,
                        size: 8,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140.0, top: 5),
                child: Text(
                  "Chikku Rajan",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90.0),
                child: Text(
                  "chikkurajcochin@gmail.com",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 150.0, bottom: 20),
                child: Text(
                  "9037316412",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                width: 300,
                height: 1,
                color: Colors.black12,
              ),
              Container(
                height: 80,
                width: 300,
                child: Center(
                  child: ListTile(
                    leading: const Icon(
                      Icons.add_box_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                    title: const Text(
                      "My Schedules",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 1,
                color: Colors.black12,
              ),
              Container(
                height: 80,
                width: 300,
                child: Center(
                  child: ListTile(
                    leading: const Icon(
                      Icons.person_search,
                      size: 25,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Finder",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 1,
                color: Colors.black12,
              ),
              Container(
                height: 80,
                width: 300,
                child: Center(
                  child: ListTile(
                    leading: const Icon(
                      Icons.favorite,
                      size: 25,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Favourites",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 1,
                color: Colors.black12,
              ),
              Container(
                height: 80,
                width: 300,
                child: Center(
                  child: ListTile(
                    leading: const Icon(
                      Icons.message,
                      size: 25,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Customer Support",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 1,
                color: Colors.black12,
              ),
              Container(
                height: 80,
                width: 300,
                child: Center(
                  child: ListTile(
                    leading: const Icon(
                      Icons.logout,
                      size: 25,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Logout",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {},
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
