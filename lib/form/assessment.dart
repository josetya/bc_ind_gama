import '../homepage.dart';



class Assessment {
  String name;
  String umur;
  String berat;
  String tinggi;
  String bmi;
  Alkohol alkohol;
  RiwayatKeluarga riwayatKeluarga;
  AlatKontrasepsi alatKontrasepsi;
  TerapiHormonal terapiHormonal;
  Haid haid;
  Menopause menopause;
  String umurmenopause;
  Melahirkan melahirkan;
  AsiEksklusif asiEksklusif;
  Merokok merokok;
  Olahraga olahraga;

  Assessment({
    this.name,
    this.umur,
    this.berat,
    this.tinggi,
    this.bmi,
    this.alkohol,
    this.riwayatKeluarga,
    this.alatKontrasepsi,
    this.terapiHormonal,
    this.haid,
    this.menopause,
    this.umurmenopause,
    this.melahirkan,
    this.asiEksklusif,
    this.merokok,
    this.olahraga,
  });
  Map<String, dynamic> toJson() => {
        'Name': name,
        'Umur': umur,
        'Berat': berat,
        'Tinggi': tinggi,
        'Alkohol': alkohol.toString(),
        'Riwayat Keluarga': riwayatKeluarga.toString(),
        'Alat Kontrasepsi': alatKontrasepsi.toString(),
        'Terapi Hormonal': terapiHormonal.toString(),
        'Haid': haid.toString(),
        'Menopause': menopause.toString(),
        'Umur menopause' : umurmenopause,
        'Melahirkan': melahirkan.toString(),
        'Asi Eksklusif': asiEksklusif.toString(),
        'Merokok': merokok.toString(),
        'Olahraga': olahraga.toString(),
      };
}

