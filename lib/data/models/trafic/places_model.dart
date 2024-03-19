// To parse this JSON data, do
//
//     final placeModel = placeModelFromMap(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

class PlaceModel {
  PlaceModel({
    required this.type,
    required this.features,
    required this.attribution,
  });

  final String type;
  final List<Feature> features;
  final String attribution;

  factory PlaceModel.fromJson(String str) =>
      PlaceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlaceModel.fromMap(Map<String, dynamic> json) => PlaceModel(
        type: json["type"],
        features:
            List<Feature>.from(json["features"].map((x) => Feature.fromMap(x))),
        attribution: json["attribution"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "features": List<dynamic>.from(features.map((x) => x.toMap())),
        "attribution": attribution,
      };
}

class Feature {
  Feature({
    required this.id,
    required this.type,
    required this.placeType,
    required this.relevance,
    required this.properties,
    required this.textEs,
    required this.placeNameEs,
    required this.text,
    required this.placeName,
    required this.matchingPlaceName,
    required this.center,
    required this.geometry,
    required this.context,
  });

  final String id;
  final String type;
  final List<String> placeType;
  final double relevance;
  final Properties properties;
  final String? textEs;
  final String? placeNameEs;
  final String text;
  final String? placeName;
  final String? matchingPlaceName;
  final List<double> center;
  final Geometry geometry;
  final List<Context>? context;

  factory Feature.fromJson(String str) => Feature.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Feature.fromMap(Map<String, dynamic> json) => Feature(
        id: json["id"],
        type: json["type"],
        placeType: List<String>.from(json["place_type"].map((x) => x)),
        relevance: json["relevance"].toDouble(),
        properties: Properties.fromMap(json["properties"]),
        textEs: json["text_es"],
        placeNameEs: json["place_name_es"],
        text: json["text"],
        placeName: json["place_name"],
        matchingPlaceName: json["matching_place_name"],
        center: List<double>.from(json["center"].map((x) => x.toDouble())),
        geometry: Geometry.fromMap(json["geometry"]),
        context: json["context"] == null
            ? null
            : List<Context>.from(
                json["context"].map((x) => Context.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        "relevance": relevance,
        "properties": properties.toMap(),
        "text_es": textEs,
        "place_name_es": placeNameEs,
        "text": text,
        "place_name": placeName,
        "matching_place_name": matchingPlaceName,
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toMap(),
        "context": List<dynamic>.from(context!.map((x) => x.toMap())),
      };
}

class Context {
  Context({
    required this.id,
    required this.textEs,
    required this.text,
    required this.wikidata,
    required this.languageEs,
    required this.language,
    required this.shortCode,
  });

  final String id;
  final String? textEs;
  final String text;
  final Wikidata? wikidata;
  final Language? languageEs;
  final Language? language;
  final ShortCode? shortCode;

  factory Context.fromJson(String str) => Context.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Context.fromMap(Map<String, dynamic> json) => Context(
        id: json["id"],
        textEs: json["text_es"],
        text: json["text"],
        wikidata: json["wikidata"] == null
            ? null
            : wikidataValues.map[json["wikidata"]],
        languageEs: json["language_es"] == null
            ? null
            : languageValues.map[json["language_es"]],
        language: json["language"] == null
            ? null
            : languageValues.map[json["language"]],
        shortCode: json["short_code"] == null
            ? null
            : shortCodeValues.map[json["short_code"]],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "text_es": textEs,
        "text": text,
        "wikidata": wikidataValues.reverse[wikidata],
        "language_es": languageValues.reverse[languageEs],
        "language": languageValues.reverse[language],
        "short_code": shortCodeValues.reverse[shortCode],
      };
}

enum Language { ES }

final languageValues = EnumValues({"es": Language.ES});

enum ShortCode { CO_MET, CO, CO_DC }

final shortCodeValues = EnumValues(
    {"co": ShortCode.CO, "CO-DC": ShortCode.CO_DC, "CO-MET": ShortCode.CO_MET});

enum Wikidata { Q749224, Q238629, Q739, Q2841 }

final wikidataValues = EnumValues({
  "Q238629": Wikidata.Q238629,
  "Q2841": Wikidata.Q2841,
  "Q739": Wikidata.Q739,
  "Q749224": Wikidata.Q749224
});

class Geometry {
  Geometry({
    required this.coordinates,
    required this.type,
  });

  final List<double> coordinates;
  final String type;

  factory Geometry.fromJson(String str) => Geometry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Geometry.fromMap(Map<String, dynamic> json) => Geometry(
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
      };
}

class Properties {
  Properties({
    required this.foursquare,
    required this.landmark,
    required this.address,
    required this.category,
    required this.maki,
  });

  final String? foursquare;
  final bool? landmark;
  final String? address;
  final String? category;
  final String? maki;

  factory Properties.fromJson(String str) =>
      Properties.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Properties.fromMap(Map<String, dynamic> json) => Properties(
        foursquare: json["foursquare"],
        landmark: json["landmark"],
        address: json["address"],
        category: json["category"],
        maki: json["maki"],
      );

  Map<String, dynamic> toMap() => {
        "foursquare": foursquare,
        "landmark": landmark,
        "address": address,
        "category": category,
        "maki": maki,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
