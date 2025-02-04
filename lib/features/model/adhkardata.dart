class Adhkardata {
  final List<Class>? morningDikr;
  final List<Class>? eveningDikr;
  final List<Class>? wakeUpDikr;
  final List<Class>? wuduaDikr;
  final List<Element>? sleepingDikr;
  final List<Element>? prayingDikr;
  final List<Element>? adhanDikr;
  final List<Element>? masjidDikr;
  final List<Element>? homeDikr;
  final List<Element>? toiletDikr;
  final List<Element>? foodDikr;
  final List<Element>? travelingDikr;
  final List<Element>? afterPrayingDikr;
  final List<Element>? otherDikr;

  Adhkardata({
    this.morningDikr,
    this.eveningDikr,
    this.wakeUpDikr,
    this.wuduaDikr,
    this.sleepingDikr,
    this.prayingDikr,
    this.adhanDikr,
    this.masjidDikr,
    this.homeDikr,
    this.toiletDikr,
    this.foodDikr,
    this.travelingDikr,
    this.afterPrayingDikr,
    this.otherDikr,
  });
}

class Element {
  final int sectionId;
  final String content;
  final int count;

  Element({
    required this.sectionId,
    required this.content,
    required this.count,
  });
}

class Class {
  final int sectionId;
  final int count;
  final String? description;
  final String? reference;
  final String content;

  Class({
    required this.sectionId,
    required this.count,
    this.description,
    this.reference,
    required this.content,
  });
}
