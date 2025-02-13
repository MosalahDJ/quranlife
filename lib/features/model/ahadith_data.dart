class AhadithData {
  int? id;
  String? titleAr;
  String? titleFr;
  String? titleEn;
  String? narratorAr;
  String? narratorFr;
  String? narratorEn;
  String? textAr;
  String? textFr;
  String? textEn;
  String? explanationAr;
  String? explanationFr;
  String? explanationEn;
  String? sourceAr;
  String? sourceFr;
  String? sourceEn;

  AhadithData(
      {this.id,
      this.titleAr,
      this.titleFr,
      this.titleEn,
      this.narratorAr,
      this.narratorFr,
      this.narratorEn,
      this.textAr,
      this.textFr,
      this.textEn,
      this.explanationAr,
      this.explanationFr,
      this.explanationEn,
      this.sourceAr,
      this.sourceFr,
      this.sourceEn});

  AhadithData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['titleAr'];
    titleFr = json['titleFr'];
    titleEn = json['titleEn'];
    narratorAr = json['narratorAr'];
    narratorFr = json['narratorFr'];
    narratorEn = json['narratorEn'];
    textAr = json['textAr'];
    textFr = json['textFr'];
    textEn = json['textEn'];
    explanationAr = json['explanationAr'];
    explanationFr = json['explanationFr'];
    explanationEn = json['explanationEn'];
    sourceAr = json['sourceAr'];
    sourceFr = json['sourceFr'];
    sourceEn = json['sourceEn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['titleAr'] = titleAr;
    data['titleFr'] = titleFr;
    data['titleEn'] = titleEn;
    data['narratorAr'] = narratorAr;
    data['narratorFr'] = narratorFr;
    data['narratorEn'] = narratorEn;
    data['textAr'] = textAr;
    data['textFr'] = textFr;
    data['textEn'] = textEn;
    data['explanationAr'] = explanationAr;
    data['explanationFr'] = explanationFr;
    data['explanationEn'] = explanationEn;
    data['sourceAr'] = sourceAr;
    data['sourceFr'] = sourceFr;
    data['sourceEn'] = sourceEn;
    return data;
  }
}
