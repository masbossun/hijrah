import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hijrah/utils/fetch.dart';

class Chapter {
  int id;
  int chapterNumber;
  bool bismillahPre;
  int revelationOrder;
  String revelationPlace;
  String nameComplex;
  String nameArabic;
  String nameSimple;
  int versesCount;
  List<int> pages;
  TranslatedName translatedName;

  Chapter(
      {this.id,
      this.chapterNumber,
      this.bismillahPre,
      this.revelationOrder,
      this.revelationPlace,
      this.nameComplex,
      this.nameArabic,
      this.nameSimple,
      this.versesCount,
      this.pages,
      this.translatedName});

  Chapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chapterNumber = json['chapter_number'];
    bismillahPre = json['bismillah_pre'];
    revelationOrder = json['revelation_order'];
    revelationPlace = json['revelation_place'];
    nameComplex = json['name_complex'];
    nameArabic = json['name_arabic'];
    nameSimple = json['name_simple'];
    versesCount = json['verses_count'];
    pages = json['pages'].cast<int>();
    translatedName = json['translated_name'] != null
        ? new TranslatedName.fromJson(json['translated_name'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chapter_number'] = this.chapterNumber;
    data['bismillah_pre'] = this.bismillahPre;
    data['revelation_order'] = this.revelationOrder;
    data['revelation_place'] = this.revelationPlace;
    data['name_complex'] = this.nameComplex;
    data['name_arabic'] = this.nameArabic;
    data['name_simple'] = this.nameSimple;
    data['verses_count'] = this.versesCount;
    data['pages'] = this.pages;
    if (this.translatedName != null) {
      data['translated_name'] = this.translatedName.toJson();
    }
    return data;
  }

  static Resource<List<Chapter>> get all {
    final String url = DotEnv().env['BASE_URL'];
    return Resource(
      url: "$url/chapters?language=id",
      parse: (response) {
        final result = json.decode(response.body);
        final list = result['chapters'] as List;

        return list
            .map(
              (model) => Chapter.fromJson(model),
            )
            .toList();
      },
    );
  }
}

class TranslatedName {
  String languageName;
  String name;

  TranslatedName({this.languageName, this.name});

  TranslatedName.fromJson(Map<String, dynamic> json) {
    languageName = json['language_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language_name'] = this.languageName;
    data['name'] = this.name;
    return data;
  }
}
