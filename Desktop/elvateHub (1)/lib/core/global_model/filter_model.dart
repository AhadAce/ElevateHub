enum FilterType {
  equals,
  greaterThanOrEquals,
  lessThanOrEquals,
}

class FilterModel {
  final String field;
  final dynamic value;
  final FilterType type;

  FilterModel({
    required this.field,
    required this.value,
    required this.type,
  });
}
