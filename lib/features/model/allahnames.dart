class AllhaNames {
  int? id;
  int? count;
  String? name;
  String? text;

  AllhaNames({this.id, this.name, this.text, this.count});

  AllhaNames.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    name = json['name'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['count'] = count;
    data['name'] = name;
    data['text'] = text;
    return data;
  }
}
