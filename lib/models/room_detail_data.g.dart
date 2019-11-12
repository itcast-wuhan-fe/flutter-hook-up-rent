// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomDetailData _$RoomDetailDataFromJson(Map<String, dynamic> json) {
  return RoomDetailData(
    id: json['houseCode'] as String,
    title: json['title'] as String,
    community: json['community'] as String,
    subTitle: json['description'] as String,
    size: json['size'] as int,
    roomType: json['roomType'] as String,
    houseImgs: (json['houseImg'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    price: json['price'] as int,
    floor: json['floor'] as String,
    oriented: (json['oriented'] as List)?.map((e) => e as String)?.toList(),
    applicances:
        (json['supporting'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RoomDetailDataToJson(RoomDetailData instance) =>
    <String, dynamic>{
      'houseCode': instance.id,
      'title': instance.title,
      'community': instance.community,
      'description': instance.subTitle,
      'size': instance.size,
      'floor': instance.floor,
      'price': instance.price,
      'roomType': instance.roomType,
      'houseImg': instance.houseImgs,
      'tags': instance.tags,
      'oriented': instance.oriented,
      'supporting': instance.applicances,
    };
