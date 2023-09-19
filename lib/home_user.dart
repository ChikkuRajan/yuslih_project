import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:yuslih_project/login_page.dart';
import 'package:yuslih_project/profile.dart';

typedef OnSearchChanged = Future<List<String>> Function(String);

late SharedPreferences logindata;
late String username;

class HomeUserPage extends StatefulWidget {
  const HomeUserPage({Key? key}) : super(key: key);

  @override
  State<HomeUserPage> createState() => _HomeUserPageState();
}

class _HomeUserPageState extends State<HomeUserPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static final List<Widget> _pages = <Widget>[
    HomeBody(),
    SearchPage(),
    SchedulePage(),
    HomeBody(),
  ];

  int _selectedIndex = 0;
  //Color selected_color = Color(0xFF7282E2);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // selected_color = Color(0xFF4FE0B5);
    });
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState

    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString("username")!;
    });
  }

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                logindata.setBool("login", true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.logout, color: Colors.black))
        ],
        //automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 90, child: CommonBody()),
            _pages.elementAt(_selectedIndex),
            //_pagesextra.elementAt(_selectedIndex)
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        //buttonBackgroundColor: Colors.white,
        buttonBackgroundColor: Colors.white,
        //height: 50,
        key: _bottomNavigationKey,
        index: _selectedIndex,
        items: [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.home,
              color:
                  _selectedIndex == 0 ? Color(0xFF4FE0B5) : Color(0xFF7282E2),
            ),
            labelStyle: TextStyle(
              color:
                  _selectedIndex == 0 ? Color(0xFF4FE0B5) : Color(0xFF7282E2),
            ),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.person_search,
              color:
                  _selectedIndex == 1 ? Color(0xFF4FE0B5) : Color(0xFF7282E2),
            ),
            labelStyle: TextStyle(
              color:
                  _selectedIndex == 1 ? Color(0xFF4FE0B5) : Color(0xFF7282E2),
            ),
            label: 'Finder',
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.calendar_today_outlined,
              color:
                  _selectedIndex == 2 ? Color(0xFF4FE0B5) : Color(0xFF7282E2),
            ),
            labelStyle: TextStyle(
              color:
                  _selectedIndex == 2 ? Color(0xFF4FE0B5) : Color(0xFF7282E2),
            ),
            label: 'Schedules',
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.favorite,
              color:
                  _selectedIndex == 3 ? Color(0xFF4FE0B5) : Color(0xFF7282E2),
            ),
            label: 'Favourites',
            labelStyle: TextStyle(
              color:
                  _selectedIndex == 3 ? Color(0xFF4FE0B5) : Color(0xFF7282E2),
            ),
            //Color(0xFF4FE0B5)
          ),
        ],
        color: Color(0xFF3F54D1),
        //buttonBackgroundColor: Color(0xFF4FE0B5),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: _onItemTapped,
        letIndexChange: (index) => true,
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List categories_images = [
    "assets/images/painter.jpg",
    "assets/images/carpenter.jpg",
    "assets/images/electrician.jpg",
    "assets/images/driver.jpg",
  ];
  List categories_names = [
    "Painter",
    "Carpenter",
    "Electrician",
    "Driver",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 400,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.white,
            Colors.white,
            Color(0xFF6175ED),
            Colors.white60,
            Color(0xFF6175ED),
            Colors.white,
            //Colors.blue.shade100,
            Colors.white,
          ])),
      child: Column(
        children: [
          Container(
            height: 100,
            width: 380,
            child: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF6175ED),
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Color(0xFF6175ED),
                        ])),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      //color: Colors.cyan,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Easy to \n" "Find & Fix",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF252528),
                                )),
                            Container(
                              height: 25,
                              width: 90,
                              color: Color(0xFF3F54D1),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeUserPage()));
                                },
                                style: ElevatedButton.styleFrom(
                                    //side: BorderSide(width: 1),
                                    backgroundColor: Color(0xFF3F54D1),
                                    foregroundColor: Color(0xFFFFFFFF)),
                                child: const Text(
                                  'Find Now',
                                  style: TextStyle(
                                      fontSize: 9, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 110.0,
                      ),
                      child: Container(
                        height: 100,
                        width: 130,
                        color: Colors.transparent,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              bottom: 1,
                              top: -62,
                              child: Container(
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/home_person.png",
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 20,
              //color: Colors.cyanAccent,
              child: Text(
                "    Choose Categories",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //categories
          Container(
            height: 120,
            width: 380,
            //color: Colors.cyanAccent,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: categories_images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryDetails()),
                        );
                      },
                      child: Container(
                        height: 150,
                        width: 100,
                        //color: Colors.cyanAccent,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                categories_images[index],
                                height: 65,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(categories_names[index]),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            //color: Colors.cyanAccent,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 20,
              //color: Colors.cyanAccent,
              child: Text(
                "      Our Top Techies",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 200,
            width: 400,
            decoration: BoxDecoration(color: Colors.white24),
            //color: Colors.cyanAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 155,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  //color: Colors.red,
                  child: Column(
                    children: [
                      ClipRRect(
                        //borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          "assets/images/john doe.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("John Doe"),
                      Text("Construction Expert"),
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 155,
                  width: 160,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  //
                  //color: Colors.cyanAccent,
                  child: Column(
                    children: [
                      ClipRRect(
                        //borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          "assets/images/john doe2.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("John Doe"),
                      Text("Expert Electrician"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommonBody extends StatefulWidget {
  const CommonBody({Key? key}) : super(key: key);

  @override
  State<CommonBody> createState() => _CommonBodyState();
}

class _CommonBodyState extends State<CommonBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 100,
        child: Scaffold(
          //appBar: AppBar(),
          body: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Image.asset(
                  "assets/images/splash_image.jpg",
                  width: 50,
                  height: 50,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 250.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset("assets/images/login_person.jpg",
                        height: 50, width: 50),
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

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({Key? key}) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int _selectedIndex = 0;
  Color color_icon = Colors.black12;
  List painter_images = [
    "assets/images/painter_1.jpg",
    "assets/images/painter_2.jpg",
    "assets/images/painter_3.jpg",
    "assets/images/painter_4.jpg",
    "assets/images/painter_5.png",
  ];
  List painter_names = [
    "Ananthu",
    "Aryan",
    "John",
    "Peter",
    "Peter",
  ];
  List painter_level = [
    "Expert Painter",
    "Good Painter",
    "Pro Painter",
    "Expert Painter",
    "Expert Painter",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      //color: Colors.cyanAccent,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
                Padding(
                  padding: const EdgeInsets.only(left: 290.0, bottom: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.cyan,
                      radius: 25,
                      backgroundImage:
                          AssetImage("assets/images/login_person.jpg"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: painter_images.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  iconColor: Colors.teal,
                  textColor: Colors.black,
                  leading: Container(
                    height: 100,
                    width: 70,
                    decoration: BoxDecoration(
                      //color: Colors.cyanAccent,
                      image: DecorationImage(
                          image: AssetImage(
                            painter_images[index],
                          ),
                          fit: BoxFit.contain),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    //color: Colors.cyanAccent,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(painter_names[index]),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        child: Icon(
                          Icons.favorite,
                          color: _selectedIndex == index
                              ? Colors.red
                              : Colors.black12,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(painter_level[index]),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.black12,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("\u{20B9} 53/Hrs"),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xFF4FE0B5)),
                              color: Colors.white,
                            ),
                            height: 30,
                            width: 70,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 17.0, top: 3),
                              child: Text(
                                "Hire",
                                style: TextStyle(
                                    color: Color(0xFF4FE0B5), fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 380,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18),
        child: Scaffold(
          body: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search technician name,categories',
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
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

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  final TextEditingController _eventController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        width: 390,
        child: Scaffold(
          body: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, bottom: 5),
                  child: TableCalendar(
                    focusedDay: selectedDay,
                    firstDay: DateTime(1990),
                    lastDay: DateTime(2050),

                    //changing calendar format
                    calendarFormat: format,
                    onFormatChanged: (CalendarFormat _format) {
                      setState(() {
                        format = _format;
                      });
                    },
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    daysOfWeekVisible: true,

                    //Day Changed on select
                    onDaySelected: (DateTime selectDay, DateTime focusDay) {
                      setState(() {
                        selectedDay = selectDay;
                        focusedDay = focusDay;
                      });
                      print(focusedDay);
                    },
                    selectedDayPredicate: (DateTime date) {
                      return isSameDay(selectedDay, date);
                    },

                    //To style the Calendar
                    calendarStyle: CalendarStyle(
                      isTodayHighlighted: true,
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFF3F54D1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      selectedTextStyle: TextStyle(color: Colors.white),
                      todayDecoration: BoxDecoration(
                        color: Color(0xFF3F54D1),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      weekendDecoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: true,
                      titleCentered: true,
                      formatButtonShowsNext: false,
                      formatButtonDecoration: BoxDecoration(
                        color: Color(0xFF3F54D1),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      formatButtonTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 130,
                        width: 120,
                        decoration: BoxDecoration(
                            // color: Colors.cyanAccent,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/painter_5.png"))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Albert Alex",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Expert Painter"),
                          Padding(
                            padding: const EdgeInsets.only(left: 138.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Color(0xFF4FE0B5)),
                                color: Colors.white,
                              ),
                              height: 35,
                              width: 75,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 5),
                                child: Text(
                                  "Hire",
                                  style: TextStyle(
                                      color: Color(0xFF4FE0B5), fontSize: 15),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ]),
        ));
  }
}
