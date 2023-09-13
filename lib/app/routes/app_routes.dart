// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const ONBORDING = _Paths.ONBORDING;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTRATION = _Paths.REGISTRATION;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const ONBORDING = '/onbording';
  static const LOGIN = '/login';
  static const REGISTRATION = '/registration';
}
