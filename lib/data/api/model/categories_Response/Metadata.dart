class Metadata {
  num? currentPage;
  num? limit;
  num? totalPages;
  num? totalItems;

  Metadata({
      this.currentPage, 
      this.limit, 
      this.totalPages, 
      this.totalItems,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['limit'] = limit;
    map['totalPages'] = totalPages;
    map['totalItems'] = totalItems;
    return map;
  }

}