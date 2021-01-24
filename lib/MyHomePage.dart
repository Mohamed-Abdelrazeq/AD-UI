import 'package:flutter/material.dart';
import 'Component/Constants.dart';

import 'MainScreens/FirstPage.dart';
import 'MainScreens/SecondPage.dart';
import 'MainScreens/ThirdPage.dart';
import 'MainScreens/ForthPage.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double pageNumber = 0;
  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<Widget> pages = [FirstPage(height: height,width: width,), SecondPage(), ThirdPage(),ForthPage()];

    return Scaffold(
      body: Stack(
        children: [
          //bottomNavigationBar
          Positioned(
            top: .84 * height,
            child: Container(
              padding: EdgeInsets.only(top: height * .06),
              height: .16 * height,
              width: width,
              color: kMain,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  navigationItem(
                      height: height,
                      width: width,
                      myIndex: 0,
                      mainColor: Colors.orange,
                      secColor: Colors.white70,
                      myIcon: Icons.home_outlined),
                  navigationItem(
                      height: height,
                      width: width,
                      myIndex: 1,
                      mainColor: Colors.orange,
                      secColor: Colors.white70,
                      myIcon: Icons.search),
                  navigationItem(
                      height: height,
                      width: width,
                      myIndex: 2,
                      mainColor: Colors.orange,
                      secColor: Colors.white,
                      myIcon: Icons.notifications_none_outlined),
                  navigationItem(
                      height: height,
                      width: width,
                      myIndex: 3,
                      mainColor: Colors.orange,
                      secColor: Colors.white70,
                      myIcon: Icons.account_circle_outlined),
                ],
              ),
            ),
          ),
          // Slider
          Positioned(
            top: 0,
            child: Container(
              height: .9 * height,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(height * .05),
                      bottomRight: Radius.circular(height * .05))),
              child: PageView(
                controller: _controller,
                children: pages,
                onPageChanged: (index) {
                  setState(() {
                    pageNumber = index.toDouble();
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  //ItemMethod
  GestureDetector navigationItem({double height, double width, int myIndex, Color mainColor, Color secColor, IconData myIcon}) {
    return GestureDetector(
      onTap: () {
        _controller.animateToPage(myIndex,
            duration: Duration(milliseconds: 20), curve: Curves.easeIn);
        setState(() {
          pageNumber = myIndex.toDouble();
        });
      },
      child: pageNumber == myIndex
          ? Container(
        decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(height * .02)),
        padding: EdgeInsets.all(height * .01),
        child: Icon(
          myIcon,
          size: height * .040,
          color: mainColor,
        ),
      )
          : Icon(
        myIcon,
        size: height * .035,
        color: secColor,
      ),
    );
  }
}