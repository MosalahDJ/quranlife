class IslamicTeachingModel {
  int? id;
  int? step;
  String? titleen;
  String? titlear;
  String? titlefr;
  String? descriptionen;
  String? descriptionar;
  String? descriptionfr;
  String? sourceen;
  String? sourcear;
  String? sourcefr;

  IslamicTeachingModel(
      {this.id,
      this.step,
      this.titleen,
      this.titlear,
      this.titlefr,
      this.descriptionen,
      this.descriptionar,
      this.descriptionfr,
      this.sourceen,
      this.sourcear,
      this.sourcefr});

  IslamicTeachingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    step = json['step'];
    titleen = json['titleen'];
    titlear = json['titlear'];
    titlefr = json['titlefr'];
    descriptionen = json['descriptionen'];
    descriptionar = json['descriptionar'];
    descriptionfr = json['descriptionfr'];
    sourceen = json['sourceen'];
    sourcear = json['sourcear'];
    sourcefr = json['sourcefr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['step'] = step;
    data['titleen'] = titleen;
    data['titlear'] = titlear;
    data['titlefr'] = titlefr;
    data['descriptionen'] = descriptionen;
    data['descriptionar'] = descriptionar;
    data['descriptionfr'] = descriptionfr;
    data['sourceen'] = sourceen;
    data['sourcear'] = sourcear;
    data['sourcefr'] = sourcefr;
    return data;
  }
}
