// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Community _$CommunityFromJson(Map<String, dynamic> json) {
  return Community(
    json['community'] as String,
    json['communityName'] as String,
  );
}

Map<String, dynamic> _$CommunityToJson(Community instance) => <String, dynamic>{
      'community': instance.id,
      'communityName': instance.name,
    };
