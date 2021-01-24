import 'package:flutter/material.dart';
import 'Constants.dart';
import 'package:dots_indicator/dots_indicator.dart';

///////////////////////Component///////////////////////
class AdvPage extends StatefulWidget {

  AdvPage({@required this.height,@required this.width});

  final double height;
  final double width;

  @override
  _AdvPageState createState() => _AdvPageState();
}

class _AdvPageState extends State<AdvPage> {

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
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomRight:Radius.circular(widget.height*.05) ,
              bottomLeft: Radius.circular(widget.height*.05) ,
            )
        ),
        child: Stack(
          children: [
            Positioned(
              top: widget.height*.1,
              child: Container(
                width: widget.width,
                height: widget.height*.08,
                child: Row(
                  children: [
                    Container(
                      width: widget.width*.4,
                      height: widget.height,
                      decoration: BoxDecoration(
                          color: kSec,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(widget.height*.05),
                              topRight: Radius.circular(widget.height*.05)
                          )
                      ),
                      child: Center(
                        child: Text(
                          'Top Rated',
                          style: TextStyle(
                              color: kMain,
                              fontSize: widget.height*.025,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: widget.width*.4,),
                  ],
                ),
              ),
            ),
            Positioned(
              top: .2*widget.height,
              child: Container(
                width: widget.width,
                height: widget.height*.8,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  onPageChanged: (num) {
                    print(num);
                    setState(() {
                      pageNumber = num.toDouble();
                    });
                  },
                  children: [
                    IntroScreen(
                      height: widget.height,
                      width: widget.width,
                      imagePath: 'images/astr.png',
                      mainText: 'Astronomy',
                      secText:
                      'The unknown hidden secrets of time and space',
                      buttonText: 'Next',
                      myFunction: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                        print(_controller.page);
                      },
                    ),
                    IntroScreen(
                      height: widget.height,
                      width: widget.width,
                      imagePath: 'images/astr.png',
                      mainText: 'Astronomy',
                      secText:
                      'The unknown hidden secrets of time and space',
                      buttonText: 'Next',
                      myFunction: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                        print(_controller.page);
                      },
                    ),
                    IntroScreen(
                      height: widget.height,
                      width: widget.width,
                      imagePath: 'images/astr.png',
                      mainText: 'Astronomy',
                      secText:
                      'The unknown hidden secrets of time and space',
                      buttonText: 'Next',
                      myFunction: () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                        print(_controller.page);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: widget.height*.84,
              child: Container(
                width: widget.width,
                child: DotsIndicator(
                  dotsCount: 3,
                  position: pageNumber,
                  decorator: DotsDecorator(
                    activeColor: kMain,
                    size: const Size.square(7.0),
                    activeSize: const Size(10.0, 10.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

class IntroScreen extends StatelessWidget {
  const IntroScreen({
    @required this.height,
    @required this.width,
    @required this.imagePath,
    @required this.mainText,
    @required this.secText,
    @required this.buttonText,
    @required this.myFunction,
  });

  final double height;
  final double width;
  final String imagePath;
  final String mainText;
  final String secText;
  final String buttonText;
  final Function myFunction;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: height * 0.01,
          child: Container(
            height: height * .4,
            width: width,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagePath))),
          ),
        ),
        Positioned(
          top: height * .43,
          left: 0,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: width*.1,right: width*.1),
                width: width,
                child: Text(
                  mainText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height * .04,
                      color: kMain
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: height*.01,),
              Container(
                padding: EdgeInsets.only(left: width*.1,right: width*.1),
                width: width,
                child: Text(
                  secText,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: height * .028,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}