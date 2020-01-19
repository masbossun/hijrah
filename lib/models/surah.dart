import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hijrah/utils/fetch.dart';

class Surah {
  final String arti;
  final String asma;
  final String audio;
  final int ayat;
  final String keterangan;
  final String nama;
  final String nomor;
  final String rukuk;
  final String type;
  final String urut;

  Surah({
    this.arti,
    this.asma,
    this.audio,
    this.ayat,
    this.keterangan,
    this.nama,
    this.nomor,
    this.rukuk,
    this.type,
    this.urut,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      arti: json['arti'],
      asma: json['asma'],
      audio: json['audio'],
      ayat: json['ayat'],
      keterangan: json['keterangan'],
      nama: json['nama'],
      nomor: json['nomor'],
      rukuk: json['rukuk'],
      type: json['type'],
      urut: json['urut'],
    );
  }

  static Resource<List<Surah>> get all {
    final String url = DotEnv().env['BASE_URL'];
    return Resource(
      url: "$url/data.json",
      parse: (response) {
        final result = json.decode(response.body) as List;

        return result
            .map(
              (model) => Surah.fromJson(model),
            )
            .toList();
      },
    );
  }
}
