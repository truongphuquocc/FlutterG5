import 'package:flutter/material.dart';
import 'package:g5/hastagwidget.dart';
import 'package:g5/slider_widget.dart';
class DestinationPage extends StatelessWidget {
  DestinationPage({Key? key}) : super(key: key);
  String content ="Thành phố Hồ Chí Minh (thường được gọi là Sài Gòn) là một thành phố ở miền nam Việt Nam nổi tiếng với vai trò nòng cốt trong chiến tranh Việt Nam. Sài Gòn cũng được biết đến với địa danh của thực dân Pháp, trong đó có Nhà thờ Đức Bà được xây dựng hoàn toàn bằng nguyên liệu nhập khẩu từ Pháp và Bưu điện trung tâm được xây dựng vào thế kỷ 19. Quán ăn nằm dọc các đường phố Sài Gòn, nhất là xung quanh chợ Bến Thành nhộn nhịp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image.asset("assets/images/saigon.jpg"),

          // blockImage(context),
          sliderWidget(),
          hastagwidget(),
          blockTitle(context),
          blockButtons(context),
          blockDescription(context),

        ],
      ),
    );
  }

  blockImage(BuildContext context) {
    return Image.asset("assets/images/saigon.jpg");
  }

  blockTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                  "Hồ Chí Minh City",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  )
              ),
              Text(
                "Việt Nam",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                ),
              )
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.red, size: 30,),
              Text(
                "41",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  blockButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        button("Call", Icons.phone),
        button("Route", Icons.near_me),
        button("Share", Icons.share)
      ],
    );
  }

  button(String title, IconData iconData){
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.blueAccent,
          size: 30,
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 15,
          ),
        )
      ],
    );
  }

  blockDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        content,
        textAlign: TextAlign.justify,

      ),
    );
  }
}