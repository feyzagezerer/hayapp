class Yardim{

  String _sehirAdi;
  String _sehirBilgiler;


  Yardim(this._sehirAdi, this._sehirBilgiler);


  String get sehirBilgiler => _sehirBilgiler;

  set sehirBilgiler(String value) {
    _sehirBilgiler = value;
  }


  String get sehirAdi => _sehirAdi;

  set sehirAdi(String value) {
    _sehirAdi = value;
  }


}