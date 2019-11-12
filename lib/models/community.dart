import 'package:json_annotation/json_annotation.dart';
part 'community.g.dart';

@JsonSerializable()
class Community {
  @JsonKey(name: 'community')
  final String id;

  @JsonKey(name: 'communityName')
  final String name;

  Community(this.id, this.name);
  factory Community.fromJson(Map<String, dynamic> json) =>
      _$CommunityFromJson(json);
  Map<String, dynamic> toJson() => _$CommunityToJson(this);
}

List<Community> list = [
  Community('11', '小区1'),
  Community('22', '小区2'),
  Community('33', '小区3'),
];
