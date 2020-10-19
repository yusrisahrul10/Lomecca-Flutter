import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_flutter/Widget/search_item.dart';
import 'package:pos_flutter/restaurant.dart';
import 'package:pos_flutter/utils/colors.dart';

import 'Widget/category_list.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Menu',
          style: const TextStyle(
              color: Color.fromARGB(255, 38, 54, 70), fontSize: 20.0),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            CategoryList(),
            Expanded(
             child: ListView(
                 children: restaurantList.map((place) {
                   return AnimatedContainer(
                     duration: Duration(milliseconds: 100),
                     width: MediaQuery.of(context).size.width,
                     margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(8),
                         boxShadow: [
                           BoxShadow(
                               offset: Offset(0, 4),
                               blurRadius: 9,
                               spreadRadius: 1,
                               color: Colors.black12.withOpacity(0.1))
                         ]),
                     child: GestureDetector(
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Image.network(
                             place.image,
                             width: 80.0,
                             height: 80.0,
                             fit: BoxFit.cover,
                           ),
                           SizedBox(height: 5),
                           Column(
                             children: <Widget>[
                               Text(
                                 place.name,
                                 overflow: TextOverflow.ellipsis,
                                 style: const TextStyle(
                                     color: Color.fromARGB(255, 38, 54, 70),
                                     fontSize: 18.0),
                               ),
                               Text(
                                 '\$ 200',
                                 textAlign: TextAlign.left,
                                 style: const TextStyle(
                                     color: Color.fromARGB(255, 38, 54, 70),
                                     fontSize: 14.0,
                                     fontWeight: FontWeight.bold),
                               ),
                             ],
                           ),
                           Row(
                             children: <Widget>[
                               IconButton(
                                 icon: Icon(
                                   Icons.remove,
                                   size: 16.0,
                                   color: Color.fromARGB(180, 38, 54, 70),
                                 ),
                                 onPressed: () {
                                   // setState(() {
                                   //   widget.table.subFood(food);
                                   // });
                                 },
                               ),
                               Container(
                                   decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(20.0),
                                       color: Color.fromARGB(255, 38, 54, 70)),
                                   child: Padding(
                                     padding: const EdgeInsets.only(
                                         top: 1.0, bottom: 1.0, left: 4.0, right: 4.0),
                                     child: Text("2",
                                         style: TextStyle(
                                           color: Colors.white,
                                           fontSize: 16.0,
                                         ),
                                         textAlign: TextAlign.center),
                                   )),
                               IconButton(
                                 icon: Icon(
                                   Icons.add,
                                   size: 16.0,
                                   color: Color.fromARGB(180, 38, 54, 70),
                                 ),
                                 onPressed: () {
                                   // setState(() {
                                   //   widget.table.addFood(food);
                                   // });
                                 },
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                   );
                 }).toList()),
            ),
            Align(
              child: buildPriceInfo(),
              alignment: Alignment.bottomCenter,
            ),
          ],
        )
      ),
    );
  }

  Widget buildPriceInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Price", style: TextStyle(color: Colors.grey, fontSize: 14)),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "\$ 200", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold).copyWith(color: Theme.of(context).primaryColor)),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          RaisedButton(
            onPressed: () {},
            shape: StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            color: Theme.of(context).primaryColor,
            child: Text(
              "Order",
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold).copyWith(color: Colors.white, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}



var restaurantList = [
  Restaurant(
      name: 'Food 1',
      location: 'location 1',
      distance: 'distance 1',
      image:
      'https://www.wegmans.com/wp-content/uploads/3961327_full-width-meals-kids-health-2-mobile.jpg'),
  Restaurant(
      name: 'Food 2',
      location: 'location 2',
      distance: 'distance 2',
      image:
      'https://dynaimage.cdn.cnn.com/cnn/q_auto,w_380,c_fill,g_auto,h_214,ar_16:9/http%3A%2F%2Fcdn.cnn.com%2Fcnnnext%2Fdam%2Fassets%2F140430115517-06-comfort-foods.jpg'),
  Restaurant(
      name: 'Food 3',
      location: 'location 3',
      distance: 'distance 3',
      image:
      'https://cdn-a.william-reed.com/var/wrbm_gb_food_pharma/storage/images/publications/food-beverage-nutrition/foodnavigator.com/article/2020/04/22/coronavirus-and-obesity-doctors-take-aim-at-food-industry-over-poor-diets/10933380-3-eng-GB/Coronavirus-and-obesity-Doctors-take-aim-at-food-industry-over-poor-diets_wrbm_large.jpg'),
  Restaurant(
      name: 'Food 4',
      location: 'location 4',
      distance: 'distance 4',
      image:
      'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/2KL6JYQYH4I6REYMIWBYVUGXPI.jpg&w=1200'),
  Restaurant(
      name: 'Food 5',
      location: 'location 5',
      distance: 'distance 5',
      image:
      'https://images2.minutemediacdn.com/image/upload/c_crop,h_1126,w_2000,x_0,y_181/f_auto,q_auto,w_1100/v1554932288/shape/mentalfloss/12531-istock-637790866.jpg'),
];
