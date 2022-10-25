import 'package:flutter/material.dart';
import 'package:g5/Model/lophocphan_model.dart';
import 'package:g5/lophocphan_page.dart';

class LopHocPhanPage extends StatelessWidget {
  const LopHocPhanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //N1 b1
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          //n2 //b2
          children: [
            //b3
            ...ls.map((e) {
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(e.hinhNen ?? ""),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  //boc text
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
                        PopupMenuButton<String>(
                          icon: Icon(
                            Icons.more_horiz,
                            size: 30,
                            color: Colors.white,
                          ),
                          onSelected: showMenuSelection,
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                                value: 'Create another',
                                child: ListTile(
                                    leading: Icon(Icons.add),
                                    title: Text('Create another'))),
                            const PopupMenuItem<String>(
                                value: 'Delete',
                                child: ListTile(
                                    leading: Icon(Icons.delete),
                                    title: Text('Delete'))),
                            const PopupMenuItem<String>(
                                value: 'Delete',
                                child: ListTile(
                                    leading: Icon(Icons.edit),
                                    title: Text('edit')))
                          ],
                        ),
                      ],
                    ),
                    Text(
                      e.maLopHoc ?? "",
                      style: TextStyle(
                          fontSize: 15,
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
                    )
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

void showMenuSelection(String value) {
  print("pressed");
}
