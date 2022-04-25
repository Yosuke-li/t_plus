enum SearchType {
  Day,
  Date,
}

extension SearchTypeEnum on SearchType {
  String get enumToString {
    switch (this) {
      case SearchType.Date:
        return '查询日期';
      case SearchType.Day:
        return '查询日';
    }
  }
}

extension StringEnum on String {
  SearchType get stringToSearchType {
    switch (this) {
      case '查询日期':
        return SearchType.Date;
      case '查询日':
        return SearchType.Day;
      default:
        return SearchType.Day;
    }
  }
}