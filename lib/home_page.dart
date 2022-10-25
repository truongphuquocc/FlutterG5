import 'package:flutter/material.dart ';

class homePage extends StatelessWidget {
   homePage({Key? key}) : super(key: key);
   String urlImage = "https://images.unsplash.com/photo-1661961111184-11317b40adb2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mobile App",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "hello",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30
                ),
              ),
              Text(
                "Chao mung",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  Text(
                    "50 rate",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Image.network(urlImage),
              Image.asset("Assets/images/dssd.jpg"),
              Image.asset("Assets/images/dssd.jpg"),
            ],
          ),
        ),
      ) ,
    );
  }
}