import 'package:flutter/material.dart';

import 'Squara.dart';

class ClassRoom extends StatelessWidget {
  ClassRoom ({Key? key}) : super(key: key);

  final _posts =[
    '[2021-2022.2] - Thực Tập Viết Niên Luận - Nhóm 3',
    '[2021-2022.2] - Công Nghệ XML - Nhóm 1',
    '[2021-2022.2] - Lập Trình Front-End - Nhóm 12',
    '[2021-2022.2] - Lập Trình Front-End - Nhóm 11',
    '[2021-2022.2] - Lập Trình Front-End - Nhóm 12',
  ];

  final _des =[
    '2021-2022.2.TIN3412.003',
    '2021-2022.2.TIN3412.003',
    '2021-2022.2.TIN3412.003',
    '2021-2022.2.TIN3412.003',
    '2021-2022.2.TIN3412.003',
  ];

  final _sal =[
    '7 học viên',
    '10 học viên',
    '12 học viên',
    '36 học viên',
    '50 học viên'
  ];

  final  _img = [
    'Assets/Images/img_sl1.jpg',
    'Assets/Images/cl1.jpg',
    'Assets/Images/cl2.jpg',
    'Assets/Images/img_sl1.jpg',
    'Assets/Images/cl2.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index){
              return MySquare(
                child: _posts[index],
                child2: _des[index],
                child3: _sal[index],
                child4: _img[index],
              );
            })
    );
  }
}
