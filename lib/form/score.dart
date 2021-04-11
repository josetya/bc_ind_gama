class score {
  double umurscore;
  double bmiscore;
  double alkoholscore;

  double riwayatKeluargascore;
  double alatKontrasepsiscore;
  double terapiHormonalscore;
  double haidscore;
  double menopausescore;
  double asiEksklusifscore;
  double merokokscore;

  double beratBadanscore;
  double olahragascore;
  double totalscore;
  score({
    this.umurscore,
    this.bmiscore,
    this.alkoholscore,
    this.riwayatKeluargascore,
    this.alatKontrasepsiscore,
    this.terapiHormonalscore,
    this.haidscore,
    this.menopausescore,
    this.asiEksklusifscore,
    this.merokokscore,
    this.beratBadanscore,
    this.olahragascore,
    this.totalscore,
  });
  Map<String, dynamic> toJson() => {
        'umur': umurscore,
        'bmi': bmiscore,
        'Riwayat Keluarga': riwayatKeluargascore,
        'Alat Kontrasepsi': alatKontrasepsiscore,
        'TerapiHormonal': terapiHormonalscore,
        'Haid': haidscore,
        'Menopause': menopausescore,
        'AsiEksklusif': asiEksklusifscore,
        'BeratBadan': beratBadanscore,
        'Olahraga': olahragascore,
        'Alkohol': alkoholscore,
        'Merokok': merokokscore,
        'Total Score': totalscore,
      };
}
