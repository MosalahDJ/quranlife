class Adkar {
  final int? id;
  final int? sectionId;
  final String? content;
  final String? description;
  int? count;
  int? originalCount; // Add this field

  Adkar({
    this.id,
    this.sectionId,
    this.content,
    this.description,
    this.count,
  }) {
    originalCount = count; // Store original count when creating instance
  }

  factory Adkar.fromJson(Map<String, dynamic> json) {
    return Adkar(
      id: json['id'],
      sectionId: json['section_id'],
      content: json['content'],
      description: json['description'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['section_id'] = sectionId;
    data['content'] = content;
    data['count'] = count;
    data['description'] = description;
    return data;
  }
}
