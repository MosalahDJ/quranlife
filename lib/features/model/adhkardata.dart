class Adkar {
  int? sectionId;
  String? content;
  int? count;
  String? description;
  String? reference;

  Adkar(
      {this.sectionId,
      this.content,
      this.count,
      this.description,
      this.reference});

  Adkar.fromJson(Map<String, dynamic> json) {
    sectionId = json['section_id'];
    content = json['content'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['section_id'] = sectionId;
    data['content'] = content;
    data['count'] = count;
    data['description'] = description;
    data['reference'] = reference;
    return data;
  }
}
