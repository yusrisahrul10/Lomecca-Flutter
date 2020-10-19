import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_flutter/Restaurant.dart';
import 'package:pos_flutter/routing_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/src/bloc/restaurant/restaurant_bloc.dart';
import 'package:pos_flutter/src/bloc/restaurant/restaurant_event.dart';
import 'package:pos_flutter/src/bloc/restaurant/restaurant_state.dart';
import 'package:pos_flutter/src/model/restaurant.dart';
import 'package:pos_flutter/utils/utils.dart';


import 'Widget/error_widget.dart';
import 'Widget/no_internet_widget.dart';
import 'Widget/search_item.dart';
import 'Widget/shimmer_list.dart';

class RestoPage extends StatefulWidget {

  @override
  _RestoPageState createState() => _RestoPageState();

}

class _RestoPageState extends State<RestoPage> {

  var searchController = TextEditingController();

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
        title: _appBar(),
      ),
      body: HomeBody(),
    );
  }

  Widget _appBar() {
    return Builder(
      builder: (context) {
        return SearchItem(
          controller: searchController,
          readOnly: true,
        );
      },
    );
  }

  @override
  void initState() {
    context.bloc<RestaurantBloc>().add(LoadRestaurant());
  }
}

class HomeBody extends StatelessWidget {
  Completer<void> _refreshCompleter;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.all(20),
        child: BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantHasData) {
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.restaurants.restaurants.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        RestaurantElement restaurant = state.restaurants.restaurants[index];
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 9,
                                    spreadRadius: 1,
                                    color: Colors.black12.withOpacity(0.1)
                                )
                              ]
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routing.MENU);
                            },
                            // onLongPress: () => onLongPress(),
                            // onLongPressEnd: (val) => onLongPressEnd(),
                            child: Column(
                              children: <Widget>[
                                _imageCover(restaurant),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      _title(restaurant),
                                      SizedBox(height: 5),
                                      _distance(restaurant),
                                      SizedBox(height: 5),
                                      _location(restaurant)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ],
              );
            }
            else if (state is RestaurantLoading) {
              return ShimmerList();
            } else if (state is RestaurantError) {
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
              return CustomErrorWidget(message: state.errorMessage);
            } else if (state is RestaurantNoData) {
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
              return CustomErrorWidget(message: state.message);
            } else if (state is RestaurantNoInternetConnection) {
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
              return NoInternetWidget(
                message: AppConstants.noInternetConnection,
                onPressed: () {
                  context
                      .bloc<RestaurantBloc>()
                      .add(LoadRestaurant());
                },
              );
            } else {
              return Center(child: Text(""));
            }
          },
        )
      ),
    );

  }

  Widget _imageCover(RestaurantElement restaurantElement) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              image: NetworkImage(
                  restaurantElement.restaurant.featuredImage),
              fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8)
          )
      ),
    );
  }

  Widget _title(RestaurantElement restaurantElement) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        restaurantElement.restaurant.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),
      ),
    );
  }

  Widget _distance(RestaurantElement restaurantElement) {
    return Text(
      "20 km",
      style: TextStyle(
          color: Colors.black45,
          fontSize: 12
      ),
    );
  }

  Widget _location(RestaurantElement restaurantElement) {
    return Text(
      restaurantElement.restaurant.location.address,
      style: TextStyle(
          color: Colors.green,
          fontSize: 14,
          fontWeight: FontWeight.bold
      ),
    );
  }

}

class restoranList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 9,
                spreadRadius: 1,
                color: Colors.black12.withOpacity(0.1)
            )
          ]
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routing.MENU);
        },
        // onLongPress: () => onLongPress(),
        // onLongPressEnd: (val) => onLongPressEnd(),
        child: Column(
          children: <Widget>[
            _imageCover(),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _title(),
                  SizedBox(height: 5),
                  _distance(),
                  SizedBox(height: 5),
                  _location()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageCover() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              image: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Barbieri_-_ViaSophia25668.jpg/1200px-Barbieri_-_ViaSophia25668.jpg"),
              fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8)
          )
      ),
    );
  }

  Widget _title() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "restaurant 1",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16
        ),
      ),
    );
  }

  Widget _distance() {
    return Text(
      "Distance 1",
      style: TextStyle(
          color: Colors.black45,
          fontSize: 12
      ),
    );
  }

  Widget _location() {
    return Text(
      "location 1",
      style: TextStyle(
          color: Colors.green,
          fontSize: 14,
          fontWeight: FontWeight.bold
      ),
    );
  }
}

// var restaurantList = [
//     Restaurant(
//         name: 'Restaurant 1',
//         location: 'location 1',
//         distance: 'distance 1',
//         image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Barbieri_-_ViaSophia25668.jpg/1200px-Barbieri_-_ViaSophia25668.jpg'),
//   Restaurant(
//       name: 'Restaurant 2',
//       location: 'location 2',
//       distance: 'distance 2',
//       image: 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F9%2F2020%2F04%2F24%2Fppp-why-wont-anyone-rescue-restaurants-FT-BLOG0420.jpg'),
//   Restaurant(
//       name: 'Restaurant 3',
//       location: 'location 3',
//       distance: 'distance 3',
//       image: 'https://static.standard.co.uk/s3fs-public/thumbnails/image/2019/11/25/16/caractere-2511.jpg?w968'),
//   Restaurant(
//       name: 'Restaurant 4',
//       location: 'location 4',
//       distance: 'distance 4',
//       image: 'https://www.elitetraveler.com/wp-content/uploads/2007/02/Alain-Ducasse-scaled.jpg'),
//   Restaurant(
//       name: 'Restaurant 5',
//       location: 'location 5',
//       distance: 'distance 5',
//       image: 'https://media.cntraveler.com/photos/5b22bfdff04a775484b99dfc/master/pass/Alo-Restaurant__2018_Raffi-Photo-2.jpg'),
// ];