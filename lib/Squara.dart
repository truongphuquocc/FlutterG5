import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  List<String> list = [
    'assets/images/class.jpg',
    'assets/images/class2.jpg',
    'assets/images/class3.jpg',
  ];

  final String child, child2, child3, child4;
  MySquare({required this.child, required this.child2, required this.child3, required this.child4});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 150,
        margin: EdgeInsets.only(left: 20,right: 20),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(child4),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    padding: EdgeInsets.only(right: 20),
                    child: Stack(
                      children: [
                        Positioned(child:
                        Text(child,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Positioned(
                            left: 0,
                            child:
                            Text(child2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 110),
                          child: Positioned(
                              left: 0,
                              child:
                              Text(child3,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      child: Icon(Icons.more_horiz, color: Colors.white, size: 30,)
                  )
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}