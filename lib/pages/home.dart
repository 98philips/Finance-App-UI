import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  PageController pageController;
  List<IconData> icons = [
    Icons.airplanemode_active,
    Icons.restaurant_menu,
    Icons.subscriptions,
    Icons.local_hospital,
  ];
  List<Color> colors = [
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.pinkAccent,
    Colors.redAccent,
  ];
  List<String> names = ["2 tickets", "Street Café", "App store", "Pharmacy"];
  List<double> prices = [
    550.00,
    450.50,
    500.50,
    400.00,
  ];
  List<Color> cardColors = [
    Colors.deepPurple,
    Colors.green,
    Colors.deepOrange,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xfff2f2f0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xfff2f2f0),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My cards",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                height: 282,
                child: Center(
                    child: PageView.builder(
                  controller: pageController,
                  itemCount: 3,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return card(index);
                  },
                ))),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 7,
                dotWidth: 7,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Recent transactions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(top: 24),
                      child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return listItem(index);
                          }),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listItem(int index) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 2.0, color: const Color(0xfff2f2f0)))),
      margin: EdgeInsets.only(right: 16, bottom: 8),
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned.fill(
                  child:Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        icons.elementAt(index),
                        color: colors.elementAt(index),
                      ),
                    ),
                  ),
              ),


              Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    value: prices[index]/867,
                    strokeWidth: 2,
                    backgroundColor: const Color(0xfff2f2f0),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(colors.elementAt(index)),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    names.elementAt(index),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "23 Mar",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
          Text(
            "\$"+prices.elementAt(index).toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget card(int index) {
    return Container(
        padding: EdgeInsets.only(bottom: 32),
        child: Card(
          color: cardColors.elementAt(index),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          elevation: 16,
          child: Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      "* * * * 1237",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Image(height: 15, image: AssetImage('graphics/visa.png'))
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Balance",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$7,582",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
