// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageableModel _$PageableModelFromJson(Map<String, dynamic> json) =>
    PageableModel(
      pageable: PageableInformationModel.fromJson(
          json['pageable'] as Map<String, dynamic>),
      totalElements: json['totalElements'] as int,
      totalPages: json['totalPages'] as int,
      last: json['last'] as bool,
      size: json['size'] as int,
      number: json['number'] as int,
      sort: SortPageableModel.fromJson(json['sort'] as Map<String, dynamic>),
      first: json['first'] as bool,
      numberOfElements: json['numberOfElements'] as int,
      empty: json['empty'] as bool,
    );

Map<String, dynamic> _$PageableModelToJson(PageableModel instance) =>
    <String, dynamic>{
      'pageable': instance.pageable,
      'totalElements': instance.totalElements,
      'totalPages': instance.totalPages,
      'last': instance.last,
      'size': instance.size,
      'number': instance.number,
      'sort': instance.sort,
      'first': instance.first,
      'numberOfElements': instance.numberOfElements,
      'empty': instance.empty,
    };

PageableInformationModel _$PageableInformationModelFromJson(
        Map<String, dynamic> json) =>
    PageableInformationModel(
      pageNumber: json['pageNumber'] as int,
      pageSize: json['pageSize'] as int,
      sort: SortPageableModel.fromJson(json['sort'] as Map<String, dynamic>),
      offset: json['offset'] as int,
      paged: json['paged'] as bool,
      unpaged: json['unpaged'] as bool,
    );

Map<String, dynamic> _$PageableInformationModelToJson(
        PageableInformationModel instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'sort': instance.sort,
      'offset': instance.offset,
      'paged': instance.paged,
      'unpaged': instance.unpaged,
    };

SortPageableModel _$SortPageableModelFromJson(Map<String, dynamic> json) =>
    SortPageableModel(
      json['sorted'] as bool,
      json['unsorted'] as bool,
      json['empty'] as bool,
    );

Map<String, dynamic> _$SortPageableModelToJson(SortPageableModel instance) =>
    <String, dynamic>{
      'sorted': instance.sorted,
      'unsorted': instance.unsorted,
      'empty': instance.empty,
    };
