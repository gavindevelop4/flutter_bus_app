import 'package:http/http.dart' as http;
import 'dart:convert';

String BASE_URL = 'http://localhost:3000';

List<Bus> busList = [];

Future<List> getList() async {
  final res = await http.get(Uri.parse(BASE_URL + '/bus'));

  if (res.statusCode == 200) {
    busList = List<Bus>.from(jsonDecode(res.body).map((model) => Bus.fromJson(model)));
    return busList;
  } else {
    throw Exception('Failed to Bus List');
  }
}

class Bus {
  final int id;
  final String route;
  final String destination;
  final int timeUntil;

  Bus({
    required this.id,
    required this.route,
    required this.destination,
    required this.timeUntil
  });

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      id: json['id'],
      route: json['route'],
      destination: json['destination'],
      timeUntil: json['timeUntil']
    );
  }
}