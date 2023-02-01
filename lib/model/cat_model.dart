// ignore_for_file: prefer_collection_literals

import 'dart:convert';

class Cats {
  late String id;
  late String? razza;
  late String? image;
  late String? imageCarousel;
  late String? paese;
  late String? mantello;
  late String? taglia;
  late String? vita;
  late String? punteggioMedio;
  late int? punteggioUser;
  late bool? imageVertical;

  late String? aspettiPrincipali;
  late String? origine;
  late String? descrizione;
  late String? carattere;
  late String? salute;
  late String? alimentazione;
  late String? allevamento;

  Cats({
    this.id = '', 
    this.razza = '',
    this.descrizione = '', 
    this.image = '', 
    this.imageCarousel = '',
    this.origine = '', 
    this.paese = '',
    this.mantello = '',
    this.taglia = '',
    this.vita = '',
    this.carattere = '',
    this.aspettiPrincipali = '',
    this.punteggioMedio = '',
    this.punteggioUser = 0,
    this.imageVertical,
    this.salute = '',
    this.alimentazione = '',
    this.allevamento = ''
  });

  Cats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    razza = json['razza'];
    descrizione = json['descrizione'];
    image = json['image'];
    imageCarousel = json['imageCarousel'];
    origine = json['origine'];
    paese = json['paese'];
    mantello = json['mantello'];
    taglia = json['taglia'];
    vita = json['vita'];
    carattere = json['carattere'];
    aspettiPrincipali = json['aspettiPrincipali'];
    punteggioMedio = json['punteggioMedio'];
    punteggioUser = json['punteggioUser'];
    imageVertical = json['imageVertical'];
    salute = json['salute'];
    alimentazione = json['alimentazione'];
    allevamento = json['allevamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['razza'] = razza;
    data['descrizione'] = descrizione;
    data['image'] = image;
    data['imageCarousel'] = imageCarousel;
    data['origine'] = origine;
    data['paese'] = paese;
    data['mantello'] = mantello;
    data['taglia'] = taglia;
    data['vita'] = vita;
    data['carattere'] = carattere;
    data['aspettiPrincipali'] = aspettiPrincipali;
    data['punteggioMedio'] = punteggioMedio;
    data['punteggioUser'] = punteggioUser;
    data['imageVertical'] = imageVertical;
    data['salute'] = salute;
    data['alimentazione'] = alimentazione;
    data['allevamento'] = allevamento;
    return data;
  }

  static String encode(List<Cats> cat) => json.encode(
    cat
      .map<Map<String, dynamic>>((cat) => Cats.toMap(cat))
      .toList(),
  );

  static List<Cats> decode(String cat) =>
      (json.decode(cat) as List<dynamic>)
          .map<Cats>((item) => Cats.fromJson(item))
          .toList();

  static Map<String, dynamic> toMap(Cats cat) => {
        'id': cat.id,
        'razza': cat.razza,
        'descrizione': cat.descrizione,
        'image': cat.image,
        'imageCarousel': cat.imageCarousel,
        'origine': cat.origine,
        'paese': cat.paese,
        'mantello': cat.mantello,
        'taglia': cat.taglia,
        'vita': cat.vita,
        'carattere': cat.carattere,
        'aspettiPrincipali': cat.aspettiPrincipali,
        'punteggioMedio': cat.punteggioMedio,
        'punteggioUser': cat.punteggioUser,
        'imageVertical': cat.imageVertical,
        'salute': cat.salute,
        'alimentazione': cat.alimentazione,
        'allevamento': cat.allevamento,
      };
}


