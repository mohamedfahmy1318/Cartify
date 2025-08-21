part of '../imports/data_imports.dart';

class PlayerModel extends PlayerEntity {
  const PlayerModel({
    required super.id,
    required super.firstName,
    required super.heightFeet,
    required super.heightInches,
    required super.lastName,
    required super.position,
    required super.team,
    required super.weightPounds,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        id: json["id"],
        firstName: json["first_name"],
        heightFeet: json["height_feet"],
        heightInches: json["height_inches"],
        lastName: json["last_name"],
        position: json["position"],
        team: Team.fromJson(json["team"]),
        weightPounds: json["weight_pounds"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "height_feet": heightFeet,
        "height_inches": heightInches,
        "last_name": lastName,
        "position": position,
        "team": team.toJson(),
        "weight_pounds": weightPounds,
      };
}

class Team {
  final int id;
  final String abbreviation;
  final String city;
  final Conference conference;
  final String division;
  final String fullName;
  final String name;

  Team({
    required this.id,
    required this.abbreviation,
    required this.city,
    required this.conference,
    required this.division,
    required this.fullName,
    required this.name,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        abbreviation: json["abbreviation"],
        city: json["city"],
        conference: conferenceValues.map[json["conference"]]!,
        division: json["division"],
        fullName: json["full_name"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "abbreviation": abbreviation,
        "city": city,
        "conference": conferenceValues.reverse[conference],
        "division": division,
        "full_name": fullName,
        "name": name,
      };
}

enum Conference { east, west }

final conferenceValues =
    PlayerEnumValues({"East": Conference.east, "West": Conference.west});

class PlayerEnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  PlayerEnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
