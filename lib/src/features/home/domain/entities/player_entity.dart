part of '../imports/domain_imports.dart';

class PlayerEntity extends Equatable {
  final int id;
  final String firstName;
  final int? heightFeet;
  final int? heightInches;
  final String lastName;
  final String position;
  final Team team;
  final int? weightPounds;

  const PlayerEntity({
    required this.id,
    required this.firstName,
    this.heightFeet,
    this.heightInches,
    required this.lastName,
    required this.position,
    required this.team,
    this.weightPounds,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        heightFeet,
        heightInches,
        lastName,
        position,
        team,
        weightPounds,
      ];
}
