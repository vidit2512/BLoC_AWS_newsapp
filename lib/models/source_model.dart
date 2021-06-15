
import 'dart:convert';

class Source {
  String? id=" ";
  String? name=" ";
  Source(this.id, this.name);

  Map<String, dynamic> tojson() {
    return {
      "id": id == null ? null : id,
      "name": name == null ? null : name,
    };
  }

  factory Source.fromjson(Map<String, dynamic> json) {
    return Source(json['id'] == null ? null : json['id'],
        json['name'] == null ? null : json['name']);
  }
  factory Source.rawjson(String s) {
    return Source.fromjson(jsonDecode(s));
  }

  torawjson() {
    return jsonEncode(tojson());
  }
}
