import 'package:flutter/material.dart';
import 'package:hello/pages/kumpulan_app/shoe/src/pages/mainPage.dart';
import 'package:hello/pages/kumpulan_app/shoe/src/pages/product_detail.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => MainPage(),
      // '/detail': (_) => ProductDetailPage()
    };
  }
}
