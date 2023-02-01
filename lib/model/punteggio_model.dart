class PunteggioModel {
  String? idPunteggio;
  int? punteggio;
  String? idUser;
  String? idCat;

  PunteggioModel({
    this.idPunteggio = '',
    this.punteggio = 0,
    this.idUser = '',
    this.idCat = '',
  });

  PunteggioModel.fromJson(Map<String, dynamic> json) {
    idPunteggio = json['idPunteggio'];
    punteggio = json['punteggio'];
    idUser = json['idUser'];
    idCat = json['idCat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idPunteggio'] = idPunteggio;
    data['punteggio'] = punteggio;
    data['idUser'] = idUser;
    data['idCat'] = idCat;
    return data;
  }
}