import 'package:flutter/material.dart';

class sliderWidget extends StatelessWidget {
  sliderWidget({Key? key}) : super(key: key);
  List<String> list = [
    'Assets/Images/Saigon.jpg',
    'Assets/Images/download.jpg',
    'Assets/Images/dssd.jpg',
    'Assets/Images/1.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 250,
        child: Row(
          children: [
            // for(int i = 0; i < list.length; i++)
            //   Image.asset(list[i]),
            ...list.map((e) { //TODO:...

              return Container(
                margin: EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(e),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(5)
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
