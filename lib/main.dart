import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/router.dart';
import 'package:pos_flutter/routing_constant.dart';
import 'package:pos_flutter/src/bloc/lomecca_bloc_observer.dart';
import 'package:pos_flutter/src/bloc/restaurant/restaurant_bloc.dart';
import 'package:pos_flutter/src/network/repository/lomecca_repository.dart';
import 'package:pos_flutter/welcome_page.dart';
import 'package:bloc/bloc.dart';


void main() async {
  Bloc.observer = LomeccaBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RestaurantBloc(repository: LomeccaRepository()),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,

            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: Router.generateRoute,
          initialRoute: Routing.ROOT,
        )
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //
    //     visualDensity: VisualDensity.adaptivePlatformDensity,
    //   ),
    //   onGenerateRoute: Router.generateRoute,
    //   initialRoute: Routing.ROOT,
    // );
  }
}
