//通用类型

import 'package:json_annotation/json_annotation.dart';

part 'general_type.g.dart';

@JsonSerializable()
class GeneralType {
  @JsonKey(name: 'label')
  final String name;

  @JsonKey(name: 'value')
  final String id;

  GeneralType(this.name, this.id);
  factory GeneralType.fromJson(Map<String, dynamic> json) =>
      _$GeneralTypeFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralTypeToJson(this);
}
