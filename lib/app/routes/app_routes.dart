// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const NAV_BAR = _Paths.NAV_BAR;

  static const LOGIN = _Paths.LOGIN;
  static const SPLASH = _Paths.SPLASH;
  static const OTP = _Paths.OTP;
  static const LANGUAGE = _Paths.LANGUAGE;
  static const SHOW_VIEW = _Paths.SHOW_VIEW;
  static const SCANNER = _Paths.SCANNER;
  static const TICKETS = _Paths.TICKETS;
  static const HISTORY = _Paths.HISTORY;
  static const BHAKTIDHAM = _Paths.BHAKTIDHAM;
  static const PRATAPHISTORY = _Paths.PRATAPHISTORY;
  static const ABOUTPGK = _Paths.ABOUTPGK;
  static const BOOKING = _Paths.BOOKING;
  static const PAYMENT = _Paths.PAYMENT;
  static const PROFILE = _Paths.PROFILE;
  static const BLUETOOTH = _Paths.BLUETOOTH;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const NAV_BAR = '/nav-bar';

  static const LOGIN = '/login';

  static const SPLASH = '/splash';
  static const OTP = '/otp';
  static const LANGUAGE = '/language';
  static const SHOW_VIEW = '/show-view';
  static const SCANNER = '/scanner';
  static const TICKETS = '/tickets';
  static const HISTORY = '/history';
  static const BHAKTIDHAM = '/bhaktidham';
  static const PRATAPHISTORY = '/prataphistory';
  static const ABOUTPGK = '/aboutPGK';
  static const BOOKING = '/booking';
  static const PAYMENT = '/payment';
  static const PROFILE = '/profile';
  static const BLUETOOTH = '/bluetooth';
}
