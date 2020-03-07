import 'dart:convert';

import 'package:flutter/services.dart';

class _MenuProviders {
  List<dynamic> options = [];

  _MenuProviders() {
    loadData();
  }

  Future<List<dynamic>> loadData() async {
    final response = await rootBundle.loadString('assets/data/menu_opts.json');
    Map dataMap = json.decode(response);
    return dataMap['rutas'];
  }
}

final menuProvider = new _MenuProviders();
