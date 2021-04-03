
class Language {
  int id;
  bool en;

  Language({this.id, this.en});

  void fromJson(dynamic json) {
    id = json['id'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['en'] = this.en;
    return data;
  }
}