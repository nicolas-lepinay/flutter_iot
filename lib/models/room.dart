import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room {
  @JsonKey(name: r'$id')
  final String id;
  final String name;
  @JsonKey(name: 'house_id')
  final String houseId;

  Room(this.id, this.name, this.houseId);

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
