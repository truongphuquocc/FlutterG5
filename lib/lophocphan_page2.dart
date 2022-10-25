import 'package:flutter/material.dart';

import 'Model/lophocphan_model.dart';

class ClassRooom extends StatelessWidget {
  const ClassRooom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...ls.map((e) {
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(e.hinhNen ?? ""),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e.tenLopHocPhan ?? "",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Text(
                      e.maLopHoc ?? "",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${e.soLuongSinhVien ?? 0} hoc vien",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
