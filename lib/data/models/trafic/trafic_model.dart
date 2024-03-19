// To parse this JSON data, do
//
//     final trafficModel = trafficModelFromMap(jsonString);

import 'dart:convert';

class TrafficModel {
  TrafficModel({
    required this.routes,
    required this.code,
  });

  final List<Route> routes;
  final String code;

  factory TrafficModel.fromJson(String str) =>
      TrafficModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TrafficModel.fromMap(Map<String, dynamic> json) => TrafficModel(
        routes: List<Route>.from(json["routes"].map((x) => Route.fromMap(x))),
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "routes": List<dynamic>.from(routes.map((x) => x.toMap())),
        "code": code,
      };
}

class Route {
  Route({
    required this.weight,
    required this.duration,
    required this.distance,
    required this.geometry,
  });


  final double weight;
  final double duration;
  final double distance;
  final String geometry;

  factory Route.fromJson(String str) => Route.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Route.fromMap(Map<String, dynamic> json) => Route(
        weight: json["weight"].toDouble(),
        duration: json["duration"].toDouble(),
        distance: json["distance"].toDouble(),
        geometry: json["geometry"],
      );

  Map<String, dynamic> toMap() => {
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "geometry": geometry,
      };
}

class Leg {
  Leg({
    required this.viaWaypoints,
    required this.admins,
    required this.weight,
    required this.duration,
    required this.steps,
    required this.distance,
    required this.summary,
  });

  final List<dynamic> viaWaypoints;
  final List<Admin> admins;
  final double weight;
  final double duration;
  final List<dynamic> steps;
  final double distance;
  final String summary;

  factory Leg.fromJson(String str) => Leg.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Leg.fromMap(Map<String, dynamic> json) => Leg(
        viaWaypoints: List<dynamic>.from(json["via_waypoints"].map((x) => x)),
        admins: List<Admin>.from(json["admins"].map((x) => Admin.fromMap(x))),
        weight: json["weight"].toDouble(),
        duration: json["duration"].toDouble(),
        steps: List<dynamic>.from(json["steps"].map((x) => x)),
        distance: json["distance"].toDouble(),
        summary: json["summary"],
      );

  Map<String, dynamic> toMap() => {
        "via_waypoints": List<dynamic>.from(viaWaypoints.map((x) => x)),
        "admins": List<dynamic>.from(admins.map((x) => x.toMap())),
        "weight": weight,
        "duration": duration,
        "steps": List<dynamic>.from(steps.map((x) => x)),
        "distance": distance,
        "summary": summary,
      };
}

class Admin {
  Admin({
    required this.iso31661Alpha3,
    required this.iso31661,
  });

  final String iso31661Alpha3;
  final String iso31661;

  factory Admin.fromJson(String str) => Admin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Admin.fromMap(Map<String, dynamic> json) => Admin(
        iso31661Alpha3: json["iso_3166_1_alpha3"],
        iso31661: json["iso_3166_1"],
      );

  Map<String, dynamic> toMap() => {
        "iso_3166_1_alpha3": iso31661Alpha3,
        "iso_3166_1": iso31661,
      };
}

class Waypoint {
  Waypoint({
    required this.distance,
    required this.name,
    required this.location,
  });

  final double distance;
  final String name;
  final List<double> location;

  factory Waypoint.fromJson(String str) => Waypoint.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Waypoint.fromMap(Map<String, dynamic> json) => Waypoint(
        distance: json["distance"].toDouble(),
        name: json["name"],
        location: List<double>.from(json["location"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "distance": distance,
        "name": name,
        "location": List<dynamic>.from(location.map((x) => x)),
      };
}
