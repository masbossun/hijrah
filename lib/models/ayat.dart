import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hijrah/utils/fetch.dart';

class Ayat {
  String ar;
  String id;
  String nomor;
  String tr;

  Ayat({this.ar, this.id, this.nomor, this.tr});

  Ayat.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    id = json['id'];
    nomor = json['nomor'];
    tr = json['tr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['id'] = this.id;
    data['nomor'] = this.nomor;
    data['tr'] = this.tr;
    return data;
  }

  static Resource<List<Ayat>> get(int surahNumber) {
    final String url = DotEnv().env['BASE_URL'];
    return Resource(
      url: "$url/surat/$surahNumber.json",
      parse: (response) {
        final result = json.decode(response.body) as List;

        return result
            .map(
              (model) => Ayat.fromJson(model),
            )
            .toList();
      },
    );
  }
}
