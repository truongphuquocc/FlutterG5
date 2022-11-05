import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:g5/Model/product_model.dart';

import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

//class Categories extends StatefulWidget {
//   const Categories({super.key});

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   @override
//   List<String> categories = [
//     "electronics",
//     "jewelery",
//     "men's clothing",
//     "women's clothing"
//   ];
//   int selectedIndex = 0;
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 25,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: categories.length,
//           itemBuilder: (context, index) => buildCategory(index)),
//     );
//   }

//   Widget buildCategory(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               categories[index],
//               style: TextStyle(
//                 fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                   color: selectedIndex == index
//                       ? Color(0xFFee4d2d)
//                       :  Color(0xFF333333)),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 20.0 / 4),
//               height: 2,
//               width: 90,
//               color: selectedIndex == index
//                   ? Color(0xFFee4d2d)
//                   : Colors.transparent,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);
    provider.getProducts();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...provider.list.map((e) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    e.category ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF4C53E5),
                    ),
                  )
                ],
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
