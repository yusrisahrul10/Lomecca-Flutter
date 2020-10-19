import 'package:flutter/material.dart';
import 'package:pos_flutter/Widget/custom_text.dart';
import 'package:pos_flutter/routing_constant.dart';
import 'package:pos_flutter/utils/colors.dart';
import 'package:pos_flutter/utils/utils.dart';

import 'Widget/custom_icon_button.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  Widget _headerText() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Text( "Welcome Back",
        style: AppTextStyles.subHeaderTextStyle,
      ),
    );
  }

  final _descriptionText = CustomText(
    text: "USER",
    color: CustomColors.headerTextColor,
    size: 32.0,
    weight: FontWeight.w800,
  );

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
            CircleAvatar(
              backgroundImage:
              NetworkImage("https://source.unsplash.com/200x200/?man"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _orderButton() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 16),
      // padding: EdgeInsets.all(20),
      width: size.width * 0.8,
      height: 75,
      // it will cover 80% of total width
      decoration: BoxDecoration(
        color: Color(0xFFFFC61F),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routing.RESTO);
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Order Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _statusTransaction() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(Icons.access_time),
              SizedBox(height: 8.0),
              Text(
                "Status",
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.access_time),
              SizedBox(height: 8.0),
              Text(
                "Status",
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.access_time),
              SizedBox(height: 8.0),
              Text(
                "Status",
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.access_time),
              SizedBox(height: 8.0),
              Text(
                "Status",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _discountCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Offers & Discounts",
            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF50505D)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            height: 166,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://image.freepik.com/free-vector/sale-banner-template-mega-deal-discount-offer_23-2148240353.jpg"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            height: 166,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://www.sheilds.org/wp-content/uploads/2020/03/AdobeStock_249019085-1-Converted.jpg"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            height: 166,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://previews.123rf.com/images/belozersky/belozersky1903/belozersky190300027/122054740-tags-set-with-discount-offer-low-cost-icon-promo-icon-in-flat-style-vector-promotion-red-labels-.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }





  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildHeader(),
                _headerText(),
                _descriptionText,
                _orderButton(),
                _statusTransaction(),
                _discountCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

}