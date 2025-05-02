import 'Metadata.dart';
import 'Occasions.dart';

class OccasionResponse {
  String? message;
  Metadata? metadata;
  String? error;
  List<Occasions>? occasions;
  OccasionResponse({
      this.message, 
      this.metadata, 
      this.occasions,});

  OccasionResponse.fromJson(dynamic json) {
    error=json["error"];
    message = json['message'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['occasions'] != null) {
      occasions = [];
      json['occasions'].forEach((v) {
        occasions?.add(Occasions.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (occasions != null) {
      map['occasions'] = occasions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}