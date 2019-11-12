import 'package:json_annotation/json_annotation.dart';

part 'room_detail_data.g.dart';

@JsonSerializable()
class RoomDetailData {
  @JsonKey(name: 'houseCode')
  String id;

  String title;
  String community;

  @JsonKey(name: 'description')
  String subTitle;
  int size;
  String floor;
  int price;
  String roomType;

  @JsonKey(name: 'houseImg')
  List<String> houseImgs;
  List<String> tags;
  List<String> oriented;

  @JsonKey(name: 'supporting')
  List<String> applicances;

  RoomDetailData({
    this.id,
    this.title,
    this.community,
    this.subTitle,
    this.size,
    this.roomType,
    this.houseImgs,
    this.tags,
    this.price,
    this.floor,
    this.oriented,
    this.applicances,
  });

  factory RoomDetailData.fromJson(Map<String, dynamic> json) =>
      _$RoomDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$RoomDetailDataToJson(this);
}
