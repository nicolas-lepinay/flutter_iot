import 'package:arduino_iot_app/models/room.dart';
import 'package:json_annotation/json_annotation.dart';

part 'equipment.g.dart';

@JsonSerializable(explicitToJson: true) // pour inclure les sous-objets.
class Equipment {
  @JsonKey(name: r'$id')
  final String id;
  final String name;
  final bool state;
  final String? value;

  @JsonKey(name: r'$updatedAt')
  final String updatedAt;
  final String? icon;

  @JsonKey(name: 'house_id')
  final String houseId;

  @JsonKey(name: 'room_id')
  final String? roomId;

  Equipment(
    this.id,
    this.name,
    this.state,
    this.value,
    this.updatedAt,
    this.icon,
    this.houseId,
    this.roomId,
  );

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
}
