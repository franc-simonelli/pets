// ignore_for_file: prefer_collection_literals

class CaratteristicheModel {
  int? punteggio;
  String? descrizione;

  CaratteristicheModel({
    this.punteggio = 0,
    this.descrizione = "",

  });

  CaratteristicheModel.fromJson(Map<String, dynamic> json) {
    punteggio = json['punteggio'];
    descrizione = json['descrizione'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['punteggio'] = punteggio;
    data['descrizione'] = descrizione;
    return data;
  }
}