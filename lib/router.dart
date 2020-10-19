import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_flutter/forgot_password_page.dart';
import 'package:pos_flutter/home_page.dart';
import 'package:pos_flutter/login_page.dart';
import 'package:pos_flutter/menu_page.dart';
import 'package:pos_flutter/resto_page.dart';
import 'package:pos_flutter/routing_constant.dart';
import 'package:pos_flutter/signup_page.dart';
import 'package:pos_flutter/src/bloc/restaurant/restaurant_bloc.dart';
import 'package:pos_flutter/undefined_view.dart';
import 'package:pos_flutter/welcome_page.dart';
import 'package:provider/provider.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routing.ROOT:
        return MaterialPageRoute(
          // builder: (_) => ProxyProvider<MovieRepository, HomeBloc>(
          //     update: (context, repos, homeBloc) => HomeBloc(repos),
          //     child: HomeScreen()),
          builder: (context) => WelcomePage()
        );

      // case Routing.REGISTER:
      //   // Movie movie = settings.arguments as Movie;
      //   return MaterialPageRoute(
      //       builder: (_) => ProxyProvider<MovieRemoteSource, DetailMovieBloc>(
      //         update: (context, movieRemote, detailBloc) =>
      //             DetailMovieBloc(movieRemote),
      //         child: DetailMovieScreen(movie),
      //       ));
      case Routing.LOGIN:
        return MaterialPageRoute(
          // builder: (_) => ProxyProvider<MovieRepository, HomeBloc>(
          //     update: (context, repos, homeBloc) => HomeBloc(repos),
          //     child: HomeScreen()),
            builder: (context) => LoginPage()
        );

      case Routing.REGISTER:
        return MaterialPageRoute(
          // builder: (_) => ProxyProvider<MovieRepository, HomeBloc>(
          //     update: (context, repos, homeBloc) => HomeBloc(repos),
          //     child: HomeScreen()),
            builder: (context) => SignUpPage()
        );

      case Routing.FORGOT_PASSWORD:
        return MaterialPageRoute(

            builder: (context) => ForgotPasswordPage()
        );

      case Routing.HOME:
        return MaterialPageRoute(

            builder: (context) => HomePage()
        );

      case Routing.RESTO:
        return MaterialPageRoute(

            builder: (context) => RestoPage()
        );

      case Routing.MENU:
        return MaterialPageRoute(

            builder: (context) => MenuPage()
        );

      default:
        return MaterialPageRoute(
            builder: (_) => UndefinedView(
              routeName: settings.name,
            ));
    }
  }
}