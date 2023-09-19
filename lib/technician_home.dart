import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:yuslih_project/home_user.dart';
import 'package:yuslih_project/login_page.dart';

late SharedPreferences logindatas;
late String usernames;

class TechnicianHomePage extends StatefulWidget {
  const TechnicianHomePage({Key? key}) : super(key: key);

  @override
  State<TechnicianHomePage> createState() => _TechnicianHomePageState();
}

class _TechnicianHomePageState extends State<TechnicianHomePage> {
  static List<Widget> _pages = <Widget>[
    HomeBodyTechnician(),
    HomeBodyTechnician(),
    HomeBodyTechnician(),
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
    // TODO: implement initState
    initial();
    super.initState();
  }

  void initial() async {
    logindatas = await SharedPreferences.getInstance();
    setState(() {
      usernames = logindata.getString("username")!;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey2 = new GlobalKey<ScaffoldState>();

  @override
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      key: _scaffoldKey2,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                logindatas.setBool("logins", true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              icon: Icon(Icons.logout))
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
        buttonBackgroundColor: Colors.transparent,
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
              Icons.calendar_today_outlined,
              color:
                  _selectedIndex == 1 ? Color(0xFF4FE0B5) : Color(0xFF7282E2),
            ),
            labelStyle: TextStyle(
              color:
                  _selectedIndex == 1 ? Color(0xFF4FE0B5) : Color(0xFF7282E2),
            ),
            label: 'My Works',
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.edit_calendar_outlined,
              color:
                  _selectedIndex == 2 ? Color(0xFF4FE0B5) : Color(0xFF7282E2),
            ),
            label: 'Upcoming',
            labelStyle: TextStyle(
              color:
                  _selectedIndex == 2 ? Color(0xFF4FE0B5) : Color(0xFF7282E2),
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

class HomeBodyTechnician extends StatefulWidget {
  const HomeBodyTechnician({Key? key}) : super(key: key);

  @override
  State<HomeBodyTechnician> createState() => _HomeBodyTechnicianState();
}

class _HomeBodyTechnicianState extends State<HomeBodyTechnician> {
  final List<ChartData> chartData = [
    ChartData('Skip', 30, Colors.orange),
    ChartData('Commit', 45, Color(0xFF3F54D1)),
    ChartData('Completed', 25, Color(0xFF4FE0B5)),
  ];
  final List<ChartDatas> chartDatas = [
    ChartDatas('MN', 9),
    ChartDatas('TU', 10),
    ChartDatas('WE', 15),
    ChartDatas('TH', 20),
    ChartDatas('FR', 0),
    ChartDatas('SA', 15),
    ChartDatas('SU', 10),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 390,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
            .25,
            .5,
            .75,
            1
          ],
              colors: [
            Color(0xFFE2E6FF),
            Color(0xFFE2E6FF),
            Colors.white,
            Color(0xFFE2E6FF),
          ])),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 10),
              child: Text(
                "Dashboard",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Center(
              child: Container(
                  height: 150,
                  width: 370,
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Container(
                          width: 100,
                          height: 100,
                          child: SfCircularChart(
                              // title: ChartTitle(
                              //     text: "Statistics",
                              //     textStyle: TextStyle(fontSize: 5)),

                              series: <CircularSeries>[
                                DoughnutSeries<ChartData, String>(
                                    dataSource: chartData,
                                    pointColorMapper: (ChartData data, _) =>
                                        data.color,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    // Radius of doughnut
                                    radius: '100%',
                                    innerRadius: '70%')
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 43.0, left: 43),
                          child: Text(
                            "95",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 95.0),
                          child: Row(
                            children: [
                              Container(
                                child: Center(
                                  child: Text(
                                    "SKIP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                height: 20,
                                width: 30,
                                color: Colors.orange,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  child: Center(
                                    child: Text(
                                      "COMMIT",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  height: 20,
                                  width: 45,
                                  color: Color(0xFF3F54D1)),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  child: Center(
                                    child: Text(
                                      "COMPLETED",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  height: 20,
                                  width: 60,
                                  color: Color(0xFF4FE0B5)),
                            ],
                          ),
                        )
                      ]),
                      Expanded(
                          child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(),
                              primaryYAxis: NumericAxis(
                                isVisible: false,
                                majorGridLines: MajorGridLines(width: 0),
                              ),
                              series: <ColumnSeries<ChartDatas, String>>[
                            ColumnSeries<ChartDatas, String>(
                                color: Colors.blue,
                                dataSource: chartDatas,
                                xValueMapper: (ChartDatas data, _) => data.x,
                                yValueMapper: (ChartDatas data, _) => data.y,

                                // Width of the bars
                                width: .2,
                                // Spacing between the bars
                                spacing: 0.3)
                          ]))
                    ],
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [
                          .01,
                          .2,
                          .5,
                          .75,
                          1
                        ],
                        colors: [
                          Colors.white,
                          Color(0xFFE2E6FF),
                          Color(0xFFE2E6FF),
                          Color(0xFFE2E6FF),
                          Color(0xFFE2E6FF),
                        ]),
                    // color: Color(0xFFE2E6FF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 8),
              child: Text("Latest Jobs",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF252528),
                  )),
            ),
            Center(
              child: Card(
                child: Container(
                  height: 140,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Gate Painting",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("30/8/2023")
                          ],
                        ),
                        Center(
                          child: Text(
                            "The best product to apply to wrought iron gates is a high-gloss alkyd paint. Opt for a colour that complements your home's facade and landscaping. For this step, it's better to use a roller than a spray gun",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "3 min ago",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              "Skip",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Color(0x384FE0B5)),
                                color: Color(0x384FE0B5),
                              ),
                              height: 30,
                              width: 100,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 17.0, top: 3),
                                child: Text(
                                  "Commit",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: Card(
                child: Container(
                  height: 140,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hose Painting",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("25/8/2023")
                          ],
                        ),
                        Center(
                          child: Text(
                            "Opt for a colour that complements your home's facade and landscaping. For this step, it's better to use a roller than a spray gun, as it'll apply a thicker coat",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "18 min ago",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Text(
                              "Skip",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Color(0x384FE0B5)),
                                color: Color(0x384FE0B5),
                              ),
                              height: 30,
                              width: 100,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 17.0, top: 3),
                                child: Text(
                                  "Commit",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartDatas {
  ChartDatas(this.x, this.y);

  final String x;
  final double y;
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
