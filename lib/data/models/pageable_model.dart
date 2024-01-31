import 'package:json_annotation/json_annotation.dart';

part 'pageable_model.g.dart';

@JsonSerializable()
class PageableModel {
  PageableModel({
    required this.pageable,
    required this.totalElements,
    required this.totalPages,
    required this.last,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });

  final PageableInformationModel? pageable;
  final int? totalElements;
  final int? totalPages;
  final bool? last;
  final int? size;
  final int? number;
  final SortPageableModel? sort;
  final bool? first;
  final int? numberOfElements;
  final bool? empty;

  factory PageableModel.fromJson(Map<String, dynamic> json) =>
      _$PageableModelFromJson(json);
  Map<String, dynamic> toJson() => _$PageableModelToJson(this);
}

@JsonSerializable()
class PageableInformationModel {
  PageableInformationModel({
    required this.pageNumber,
    required this.pageSize,
    required this.sort,
    required this.offset,
    required this.paged,
    required this.unpaged,
  });

  final int pageNumber;
  final int pageSize;
  final SortPageableModel sort;
  final int offset;
  final bool paged;
  final bool unpaged;

  factory PageableInformationModel.fromJson(Map<String, dynamic> json) =>
      _$PageableInformationModelFromJson(json);
  Map<String, dynamic> toJson() => _$PageableInformationModelToJson(this);
}

@JsonSerializable()
class SortPageableModel {
  SortPageableModel(
    this.sorted,
    this.unsorted,
    this.empty,
  );

  final bool sorted;
  final bool unsorted;
  final bool empty;

  factory SortPageableModel.fromJson(Map<String, dynamic> json) =>
      _$SortPageableModelFromJson(json);
  Map<String, dynamic> toJson() => _$SortPageableModelToJson(this);
}
