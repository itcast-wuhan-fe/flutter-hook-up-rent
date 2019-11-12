import 'package:json_annotation/json_annotation.dart';

part 'room_list_item_data.g.dart';

@JsonSerializable()
class RoomListItemData {
  @JsonKey(name: 'houseCode')
  final String id;

  final String title;

  @JsonKey(name: 'desc')
  final String subTitle;

  @JsonKey(name: 'houseImg')
  final String imageUri;

  final List<String> tags;

  final int price;

  const RoomListItemData(
      {this.title,
      this.subTitle,
      this.imageUri,
      this.tags,
      this.price,
      this.id});

  factory RoomListItemData.fromJson(Map<String, dynamic> json) =>
      _$RoomListItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$RoomListItemDataToJson(this);
}
