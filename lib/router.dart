import 'package:flutter/material.dart';
import 'package:mobile_stock_opname/features/about_us/about_us_screen.dart';
import 'package:mobile_stock_opname/features/additional_request/additional_request_screen.dart';
import 'package:mobile_stock_opname/features/additional_request_detail/additional_request_detail_screen.dart';
import 'package:mobile_stock_opname/features/additional_request_detail_form/additional_request_detail_form_screen.dart';
import 'package:mobile_stock_opname/features/additional_request_list/additional_request_list_screen.dart';
import 'package:mobile_stock_opname/features/asset_opname/asset_opname_screen.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail/asset_opname_detail_screen.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail_form/asset_opname_detail_form_screen.dart';
import 'package:mobile_stock_opname/features/asset_opname_detail_form/drop_down_screen.dart';
import 'package:mobile_stock_opname/features/asset_opname_list/asset_opname_list_screen.dart';
import 'package:mobile_stock_opname/features/change_password/change_password_screen.dart';
import 'package:mobile_stock_opname/features/daily_detail/daily_detail_screen.dart';
import 'package:mobile_stock_opname/features/dashboard/dashboard_screen.dart';
import 'package:mobile_stock_opname/features/dashboard_detail/dashboard_detail_screen.dart';
import 'package:mobile_stock_opname/features/login/login_screen.dart';
import 'package:mobile_stock_opname/features/navbar/navbar_screen.dart';
import 'package:mobile_stock_opname/features/notification/notification_screen.dart';
import 'package:mobile_stock_opname/features/otp/otp_screen.dart';
import 'package:mobile_stock_opname/features/profile/profile_screen.dart';
import 'package:mobile_stock_opname/features/scanner/scanner_screen.dart';
import 'package:mobile_stock_opname/features/splash/splash_screen.dart';
import 'package:mobile_stock_opname/utility/string_router_util.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case StringRouterUtil.splashScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const SplashScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.loginScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const LoginScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.aboutUsScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const AboutUsScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.addRequestScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const AdditionalRequestScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.addRequestListScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const AdditionalRequestListScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.addRequestDetailScreenRoute:
        final bool isInput = settings.arguments as bool;
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) =>
                AdditionalRequestDetailScreen(isInput: isInput),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.assetOpnameScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const AssetOpnameScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.assetOpnameListScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const AssetOpnameListScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.assetOpnameDetailScreenRoute:
        final bool isInput = settings.arguments as bool;
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) =>
                AssetOpnameDetailScreen(isInput: isInput),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.dashboardScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const DashboardScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.dashboardDetailScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const DashboardDetailScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.navbarScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const NavbarScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.notificationScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const NotificationScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.otpScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const OtpScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.profileScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const ProfileScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.scannerScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const ScannerScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.changePwdScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const ChangePasswordScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.dailyDetailScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const DailyDetailScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.assetOpnameDetailFormScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => const AssetOpnameDetailFormScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.addRequesteDetailFormScreenRoute:
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) =>
                const AdditionalRequestDetailFormScreen(),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      case StringRouterUtil.dropDownScreenRoute:
        final String title = settings.arguments as String;
        return PageRouteBuilder<dynamic>(
            pageBuilder: (_, __, ___) => DropDownScreen(title: title),
            settings: RouteSettings(name: settings.name),
            transitionsBuilder: (_, Animation<double> a, __, Widget c) =>
                FadeTransition(opacity: a, child: c));

      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
