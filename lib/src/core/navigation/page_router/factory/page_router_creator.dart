import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/core/navigation/constants/imports_constants.dart';
import 'package:full_ecommerce_app/src/core/navigation/helper/Interfaces/helper_imports.dart';

abstract class PageRouterCreator {
  Route<T> create<T>(
    Widget page, {
    RouteSettings? settings,
    TransitionType? transition,
    AnimationOption? animationOptions,
  });
}
