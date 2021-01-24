import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Component/Adv.dart';
import '../Component/Constants.dart';

bool state = true;
bool adState = true;

class FirstPage extends StatefulWidget {

  FirstPage({@required this.height,@required this.width});

  final double height;
  final double width;

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:[
        Positioned(
          top: 0,
          child: Column(
            children: [
              Container(
                width: widget.width,
                height: .15*widget.height,
                color: kMain,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: widget.height * .04
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      if (state){
                        setState(() {
                          state = false;
                        });
                      }
                      else{
                        setState(() {
                          state = true;
                        });
                      }
                    },
                    child: state == true ? Container(
                      width: .5*widget.width,
                      height: .1*widget.height,
                      decoration: BoxDecoration(
                          color: kMain,
                          borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(widget.height*.05)
                        )
                      ),
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: kSec,
                            fontWeight: FontWeight.w600,
                            fontSize: widget.height*.03

                          ),
                        ),
                      ),
                    ) : Container(
                      width: .5*widget.width,
                      height: .1*widget.height,
                      decoration: BoxDecoration(
                        color: kSec,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(widget.height*.05)
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              color: kMain,
                              fontWeight: FontWeight.w600,
                              fontSize: widget.height*.025

                          ),
                        ),
                      ),

                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if (state){
                        setState(() {
                          state = false;
                        });
                      }
                      else{
                        setState(() {
                          state = true;
                        });
                      }
                    },
                    child: state == false ? Container(
                      width: .5*widget.width,
                      height: .1*widget.height,
                      decoration: BoxDecoration(
                          color: kMain,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(widget.height*.05)
                          )
                      ),
                      child: Center(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              color: kSec,
                              fontWeight: FontWeight.w600,
                              fontSize: widget.height*.03

                          ),
                        ),
                      ),
                    ) : Container(
                      width: .5*widget.width,
                      height: .1*widget.height,
                      decoration: BoxDecoration(
                        color: kSec,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(widget.height*.05)
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              color: kMain,
                              fontWeight: FontWeight.w600,
                              fontSize: widget.height*.025

                          ),
                        ),
                      ),

                    ),
                  ),
                ],
              ),
              SizedBox(height: widget.height*.05,),
              Container(
                height: widget.height*.8,
                // color: Colors.green,
                child: state == true ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: widget.height*.1,
                        width: .8*widget.width,
                        color: kMain,
                      ),
                      SizedBox(height: 50,),
                      Container(
                        height: widget.height*.1,
                        width: .8*widget.width,
                        color: kMain,
                      ),
                      SizedBox(height: 50,),
                      Container(
                        height: widget.height*.1,
                        width: .8*widget.width,
                        color: kMain,
                      ),
                      SizedBox(height: 50,),
                      Container(
                        height: widget.height*.1,
                        width: .8*widget.width,
                        color: kMain,
                      ),
                      SizedBox(height: 50,),
                      Container(
                        height: widget.height*.1,
                        width: .8*widget.width,
                        color: kMain,
                      ),
                      SizedBox(height: 50,),
                      Container(
                        height: widget.height*.1,
                        width: .8*widget.width,
                        color: kMain,
                      ),

                    ],
                  ),
                ) : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: widget.height*.1,
                        width: .8*widget.width,
                        color: Colors.green,
                      ),
                      SizedBox(height: 50,),
                      Container(
                        height: widget.height*.1,
                        width: .8*widget.width,
                        color: Colors.green,
                      ),
                      SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        //ADV
        Positioned(
          child: adState == true ? AdvPage(height: widget.height,width: widget.width,) : Container(),
        ),
        Positioned(
          top: .1*widget.height,
          left: widget.width*.78,
          child: adState == true ? GestureDetector(
            onTap: (){
              setState(() {
                adState = false;
              });
            },
            child: Container(
              width: widget.width*.15,
              height: widget.width*.15,
              decoration: BoxDecoration(
                  color: kSec,
                  borderRadius: BorderRadius.circular(widget.height)
              ),
              child: Icon(
                Icons.play_arrow_outlined,
                color: kMain,
                size: widget.height*.04,
              ),
            ),
          ) : Container()
        )
      ],
    );
  }
}

