// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_list_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomListItemData _$RoomListItemDataFromJson(Map<String, dynamic> json) {
  return RoomListItemData(
    title: json['title'] as String,
    subTitle: json['desc'] as String,
    imageUri: json['houseImg'] as String,
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    price: json['price'] as int,
    id: json['houseCode'] as String,
  );
}

Map<String, dynamic> _$RoomListItemDataToJson(RoomListItemData instance) =>
    <String, dynamic>{
      'houseCode': instance.id,
      'title': instance.title,
      'desc': instance.subTitle,
      'houseImg': instance.imageUri,
      'tags': instance.tags,
      'price': instance.price,
    };
