// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralType _$GeneralTypeFromJson(Map<String, dynamic> json) {
  return GeneralType(
    json['label'] as String,
    json['value'] as String,
  );
}

Map<String, dynamic> _$GeneralTypeToJson(GeneralType instance) =>
    <String, dynamic>{
      'label': instance.name,
      'value': instance.id,
    };
