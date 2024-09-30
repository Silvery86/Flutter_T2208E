
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/destination.dart';

class ApiService {
  Future<List<Destination>> getAllDestinations() async {
    final String response = await rootBundle.loadString('assets/destinations.json');
    List<dynamic> jsonData = json.decode(response);
    return jsonData.map((json) => Destination.fromJson(json)).toList();
  }
}
