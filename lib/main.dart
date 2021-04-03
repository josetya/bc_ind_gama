import 'package:bc_ind_gama/formField/myMultiselectionFormField.dart';
import 'package:bc_ind_gama/formField/myToggleButtonsFormField.dart';
import 'package:bc_ind_gama/widgets/myToggleButtons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' “Ind_BCA” (INDONESIAN BREAST CANCER ASSESSMENT)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: ' Ind_BCA'),
    );
  }
}

enum TempatTinggal { Desa, Kota } //2

enum StatusNikah { Menikah, Pernah_Menikah, Belum_Menikah } //3

enum RiwayatKeluarga { Ya, Tidak } //4

enum AlatKontrasepsi {
  Tidak_ada,
  Pil_KB,
  Suntik_KB,
  Implan_Susuk,
  IUD,
  lainnya
} //5 ***

enum TerapiHormonal { Ya, Tidak } //6

enum Haid { Ya, Tidak } //7

enum Menopause { Ya, Tidak } //8

enum Infertil { Ya, Tidak, Belum_Tahu } //9

enum MakanLemak { Ya, Tidak } //10

enum BeratBadan { Ya, Tidak } //11

enum Olahraga { Ya, Tidak } //12

class Assessment {
  String name;
  String umur;
  TempatTinggal tempattinggal;
  StatusNikah statusNikah;
  RiwayatKeluarga riwayatKeluarga;
  List<AlatKontrasepsi> alatKontrasepsi;
  TerapiHormonal terapiHormonal;
  Haid haid;
  Menopause menopause;
  Infertil infertil;
  MakanLemak makanLemak;
  BeratBadan beratBadan;
  Olahraga olahraga;

  Assessment({
    this.name,
    this.tempattinggal,
    this.statusNikah,
    this.riwayatKeluarga,
    List<AlatKontrasepsi> alatKontrasepsi,
    this.terapiHormonal,
    this.haid,
    this.menopause,
    this.infertil,
    this.makanLemak,
    this.beratBadan,
    this.olahraga,
  }) {
    this.alatKontrasepsi = alatKontrasepsi ?? [];
  }
  Map<String, dynamic> toJson() => {  
        'name': name,
        'umur': umur,
        'tempat tinggal': tempattinggal.toString(),
        'status Nikah': statusNikah.toString(),
        'Riwayat Keluarga': riwayatKeluarga.toString(),
        'Alat Kontrasepsi': alatKontrasepsi.toString(),
        'TerapiHormonal': terapiHormonal.toString(),
        'Haid': haid.toString(),
        'Menopause': menopause.toString(),
        'Infertil': infertil.toString(),
        'MakanLemak': makanLemak.toString(),
        'BeratBadan': beratBadan.toString(),
        'Olahraga': olahraga.toString(),
      };
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _formResult = Assessment();
  final nameFocusNode = FocusNode();
  final umurFocusNode = FocusNode();
  final tempattinggalFocusNodes = [FocusNode(), FocusNode(), FocusNode()];
  final statusNikahFocusNodes = [FocusNode(), FocusNode(), FocusNode()];
  final riwayatKeluargaFocusnodes = [FocusNode(), FocusNode()];
  final alatKontrasepsiFocusNodes = FocusNode();
  final terapiHormonalFocusnodes = [FocusNode(), FocusNode()];
  final haidFocusnodes = [FocusNode(), FocusNode()];
  final menopauseFocusnodes = [FocusNode(), FocusNode()];
  final infertilFocusnodes = [FocusNode(), FocusNode(), FocusNode()];
  final makanLemakFocusnodes = [FocusNode(), FocusNode()];
  final beratBadanFocusnodes = [FocusNode(), FocusNode()];
  final olahragaFocusnodes = [FocusNode(), FocusNode()];

  //Object get tempattinggalItem => null;

  //get tempattinggal => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Form(
          key: _formKey,
          autovalidate: false,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              MyTextFormField(
                decoration: const InputDecoration(
                  hintText: 'masukan nama anda',
                  labelText: 'Nama',
                ),
                inputFormatters: [LengthLimitingTextInputFormatter(30)],
                initialValue: _formResult.name,
                validator: (name) => name == null ? 'wajib diisi' : null,
                onSaved: (userName) {
                  _formResult.name = userName;
                },
                autofocus: true,
                focusNode: nameFocusNode,
                textInputAction: TextInputAction.next,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusScope.of(context).requestFocus(nameFocusNode);
                },
              ),
              SizedBox(height: 8.0),
              //2. umur
              MyTextFormField(
                decoration: new InputDecoration(labelText: "Umur"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                initialValue: _formResult.umur,
                validator: (umur) {
                  if (umur.isEmpty) {
                    return 'Umur Diperlukan';
                  }
                  //if (userName.length < 3) {
                  //  return 'Nama ';
                  //}
                  return null;
                },

                onSaved: (umur) {
                  _formResult.umur = umur;
                },
                autofocus: true,
                focusNode: umurFocusNode,
                textInputAction: TextInputAction.next,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusScope.of(context).requestFocus(umurFocusNode);
                },

              ),


              SizedBox(height: 8.0),
              // 3. tempat tinggal
               Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(
                          "Dimanakah daerah yang saudari tinggali saat ini?"))
                ],
              )),
              MyToggleButtonsFormField<TempatTinggal>(
                //decoration: InputDecoration(
                //  labelText: 'Daerah saudari tinggal saat ini?',
                //),
                initialValue: _formResult.tempattinggal,
                items: TempatTinggal.values,
                itemBuilder:
                    (BuildContext context, TempatTinggal tempattinggalItem) =>
                        Text(describeEnum(tempattinggalItem)),
                selectedItemBuilder:
                    (BuildContext context, TempatTinggal tempattinggalItem) =>
                        Text(describeEnum(tempattinggalItem)),
                validator: (tempattinggal) =>
                    tempattinggal == null ? 'wajib diisi' : null,
                onSaved: (tempattinggal) {
                  _formResult.tempattinggal = tempattinggal;
                },
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                focusNodes: tempattinggalFocusNodes,
                onChanged: (tempattinggal) {
                  final tempattinggalIndex =
                      TempatTinggal.values.indexOf(tempattinggal);
                  if (tempattinggalIndex >= 0) {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context).requestFocus(
                        tempattinggalFocusNodes[tempattinggalIndex]);
                  }
                },
              ),
              SizedBox(height: 8.0),
              //4. status pernikahan
               Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(
                          "Apakah Status pernikahan saudari ?"))
                ],
              )),
              MyToggleButtonsFormField<StatusNikah>(
                //decoration: InputDecoration(
                //  labelText: 'Apakah Status pernikahan saudari ?',
                //),
                initialValue: _formResult.statusNikah,
                items: StatusNikah.values,
                itemBuilder:
                    (BuildContext context, StatusNikah statusNikahItem) =>
                        Text(describeEnum(statusNikahItem)),
                selectedItemBuilder:
                    (BuildContext context, StatusNikah statusNikahItem) =>
                        Text(describeEnum(statusNikahItem)),
                validator: (statusNikah) =>
                    statusNikah == null ? 'wajib diisi' : null,
                onSaved: (statusNikah) {
                  _formResult.statusNikah = statusNikah;
                },
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                focusNodes: statusNikahFocusNodes,
                onChanged: (statusNikah) {
                  final statusNikahIndex =
                      StatusNikah.values.indexOf(statusNikah);
                  if (statusNikahIndex >= 0) {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context)
                        .requestFocus(statusNikahFocusNodes[statusNikahIndex]);
                  }
                },
              ),
              SizedBox(height: 8.0),
              // 5. riwayat keluarga
              //
              Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(
                          "Apakah Saudari mempunyai riwayat keluarga yang menderita kanker ?"))
                ],
              )),
              //
              MyToggleButtonsFormField<RiwayatKeluarga>(
                initialValue: _formResult.riwayatKeluarga,
                items: RiwayatKeluarga.values,
                itemBuilder: (BuildContext context,
                        RiwayatKeluarga riwayatKeluargaItem) =>
                    Text(describeEnum(riwayatKeluargaItem)),
                selectedItemBuilder: (BuildContext context,
                        RiwayatKeluarga riwayatKeluargaItem) =>
                    Text(describeEnum(riwayatKeluargaItem)),
                validator: (riwayatKeluarga) =>
                    riwayatKeluarga == null ? 'wajib diisi' : null,
                onSaved: (riwayatKeluarga) {
                  _formResult.riwayatKeluarga = riwayatKeluarga;
                },
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                focusNodes: riwayatKeluargaFocusnodes,
                onChanged: (riwayatKeluarga) {
                  final riwayatKeluargaIndex =
                      RiwayatKeluarga.values.indexOf(riwayatKeluarga);
                  if (riwayatKeluargaIndex >= 0) {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context).requestFocus(
                        riwayatKeluargaFocusnodes[riwayatKeluargaIndex]);
                  }
                },
              ),

              SizedBox(height: 8.0),

              //6. alat kontrasepsi
               Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(
                          "Alat kontrasepsi yang Anda pernah saudari digunakan?"))
                ],
              )),
              MyMultiSelectionFormField<AlatKontrasepsi>(
               // decoration: InputDecoration(
               //   labelText:
               //       'Alat kontrasepsi yang Anda pernah saudari digunakan?',
               // ),
                hint: Text('pilih Alat Kontrasepsi'),
                isDense: true,
                focusNode: alatKontrasepsiFocusNodes,
                //focusNode: alatKontrasepsiFocusNode,
                options: AlatKontrasepsi.values,
                titleBuilder: (interest) => Text(describeEnum(interest)),
                chipLabelBuilder: (interest) => Text(describeEnum(interest)),
                initialValues: _formResult.alatKontrasepsi,
                validator: (alatKontrasepsi) => alatKontrasepsi.length < 1
                    ? 'Pilih satu alat kontrasepsi yang sering digunakan'
                    : null,
                onSaved: (alatKontrasepsi) {
                  _formResult.alatKontrasepsi = alatKontrasepsi;
                },
                onChanged: (_) {
                  FocusScope.of(context).unfocus();
                  FocusScope.of(context)
                      .requestFocus(alatKontrasepsiFocusNodes);
                },
              ),

              SizedBox(height: 8.0),
              //7. terapi hormonal
               Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(
                          "Apakah anda pernah menggunakan terapi hormonal?"))
                ],
              )),
              MyToggleButtonsFormField<TerapiHormonal>(
                //decoration: InputDecoration(
                //  labelText: 'Apakah anda pernah menggunakan terapi hormonal?',
                //),
                initialValue: _formResult.terapiHormonal,
                items: TerapiHormonal.values,
                itemBuilder:
                    (BuildContext context, TerapiHormonal terapiHormonalItem) =>
                        Text(describeEnum(terapiHormonalItem)),
                selectedItemBuilder:
                    (BuildContext context, TerapiHormonal terapiHormonalItem) =>
                        Text(describeEnum(terapiHormonalItem)),
                validator: (terapiHormonal) =>
                    terapiHormonal == null ? 'wajib diisi' : null,
                onSaved: (terapiHormonal) {
                  _formResult.terapiHormonal = terapiHormonal;
                },
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                focusNodes: terapiHormonalFocusnodes,
                onChanged: (terapiHormonal) {
                  final terapiHormonalIndex =
                      TerapiHormonal.values.indexOf(terapiHormonal);
                  if (terapiHormonalIndex >= 0) {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context).requestFocus(
                        terapiHormonalFocusnodes[terapiHormonalIndex]);
                  }
                },
              ),
              SizedBox(height: 8.0),
              //.8 menstruasi
               Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(
                          "Apakah saat mestruasi/haid pertama kali berumur kurang dari  berumur 12 tahun?"))
                ],
              )),
              MyToggleButtonsFormField<Haid>(
                //decoration: InputDecoration(
                //  labelText:
                //      'Apakah saat mestruasi/haid pertama kali berumur kurang dari  berumur 12 tahun?',
                //),
                initialValue: _formResult.haid,
                items: Haid.values,
                itemBuilder: (BuildContext context, Haid haidItem) =>
                    Text(describeEnum(haidItem)),
                selectedItemBuilder: (BuildContext context, Haid haidItem) =>
                    Text(describeEnum(haidItem)),
                validator: (haid) => haid == null ? 'wajib diisi' : null,
                onSaved: (haid) {
                  _formResult.haid = haid;
                },
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                focusNodes: haidFocusnodes,
                onChanged: (haid) {
                  final haidIndex = Haid.values.indexOf(haid);
                  if (haidIndex >= 0) {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context)
                        .requestFocus(haidFocusnodes[haidIndex]);
                  }
                },
              ),
              SizedBox(height: 8.0),
              // 9. menopause
               Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(
                          "Apakah Anda mengalami menopause sebelum umur 55 tahun?"))
                ],
              )),
              MyToggleButtonsFormField<Menopause>(
                //decoration: InputDecoration(
                //  labelText:
                //      'Apakah Anda mengalami menopause sebelum umur 55 tahun?',
                //),
                initialValue: _formResult.menopause,
                items: Menopause.values,
                itemBuilder: (BuildContext context, Menopause menopauseItem) =>
                    Text(describeEnum(menopauseItem)),
                selectedItemBuilder:
                    (BuildContext context, Menopause menopauseItem) =>
                        Text(describeEnum(menopauseItem)),
                validator: (menopause) =>
                    menopause == null ? 'wajib diisi' : null,
                onSaved: (menopause) {
                  _formResult.menopause = menopause;
                },
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                focusNodes: menopauseFocusnodes,
                onChanged: (menopause) {
                  final menopauseIndex = Menopause.values.indexOf(menopause);
                  if (menopauseIndex >= 0) {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context)
                        .requestFocus(menopauseFocusnodes[menopauseIndex]);
                  }
                },
              ),
              SizedBox(height: 8.0),
              // 10. infertil
               Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(
                          "Apakah Anda infertil (tidak bisa mempunyai keturunan)?"))
                ],
              )),
              MyToggleButtonsFormField<Infertil>(
                //decoration: InputDecoration(
                //  labelText:
                //      'Apakah Anda infertil (tidak bisa mempunyai keturunan)?',
                //),
                initialValue: _formResult.infertil,
                items: Infertil.values,
                itemBuilder: (BuildContext context, Infertil infertilItem) =>
                    Text(describeEnum(infertilItem)),
                selectedItemBuilder:
                    (BuildContext context, Infertil infertilItem) =>
                        Text(describeEnum(infertilItem)),
                validator: (infertil) =>
                    infertil == null ? 'wajib diisi' : null,
                onSaved: (infertil) {
                  _formResult.infertil = infertil;
                },
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                focusNodes: infertilFocusnodes,
                onChanged: (infertil) {
                  final infertilIndex = Infertil.values.indexOf(infertil);
                  if (infertilIndex >= 0) {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context)
                        .requestFocus(infertilFocusnodes[infertilIndex]);
                  }
                },
              ),
              SizedBox(height: 8.0),
              // 11. makanan berlemak
               Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(
                          "Apakah Anda sering makan makanan berlemak?"))
                ],
              )),
              MyToggleButtonsFormField<MakanLemak>(
                //decoration: InputDecoration(
                //  labelText: 'Apakah Anda sering makan makanan berlemak?',
                //),
                initialValue: _formResult.makanLemak,
                items: MakanLemak.values,
                itemBuilder:
                    (BuildContext context, MakanLemak makanLemakItem) =>
                        Text(describeEnum(makanLemakItem)),
                selectedItemBuilder:
                    (BuildContext context, MakanLemak makanLemakItem) =>
                        Text(describeEnum(makanLemakItem)),
                validator: (makanLemak) =>
                    makanLemak == null ? 'wajib diisi' : null,
                onSaved: (makanLemak) {
                  _formResult.makanLemak = makanLemak;
                },
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                focusNodes: makanLemakFocusnodes,
                onChanged: (makanLemak) {
                  final makanLemakIndex = MakanLemak.values.indexOf(makanLemak);
                  if (makanLemakIndex >= 0) {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context)
                        .requestFocus(makanLemakFocusnodes[makanLemakIndex]);
                  }
                },
              ),
              SizedBox(height: 8.0),
              // 12. berat badan
               Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(
                          "Apakah Anda mempunyai berat badan berlebih?"))
                ],
              )),
              MyToggleButtonsFormField<BeratBadan>(
                //decoration: InputDecoration(
                //  labelText: 'Apakah Anda mempunyai berat badan berlebih?',
                //),
                initialValue: _formResult.beratBadan,
                items: BeratBadan.values,
                itemBuilder:
                    (BuildContext context, BeratBadan beratBadanItem) =>
                        Text(describeEnum(beratBadanItem)),
                selectedItemBuilder:
                    (BuildContext context, BeratBadan beratBadanItem) =>
                        Text(describeEnum(beratBadanItem)),
                validator: (beratBadan) =>
                    beratBadan == null ? 'wajib diisi' : null,
                onSaved: (beratBadan) {
                  _formResult.beratBadan = beratBadan;
                },
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                focusNodes: beratBadanFocusnodes,
                onChanged: (beratBadan) {
                  final beratBadanIndex = BeratBadan.values.indexOf(beratBadan);
                  if (beratBadanIndex >= 0) {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context)
                        .requestFocus(beratBadanFocusnodes[beratBadanIndex]);
                  }
                },
              ),
              SizedBox(height: 8.0),
              // 13. olah raga
              Container(
                  child: Row(
                children: <Widget>[
                  Flexible(
                      child: new Text(
                          "Apakah Anda sering olahraga teratur dan rutin?"))
                ],
              )),
              MyToggleButtonsFormField<Olahraga>(
                //decoration: InputDecoration(
                //  labelText: 'Apakah Anda sering olahraga teratur dan rutin?',
                //),
                initialValue: _formResult.olahraga,
                items: Olahraga.values,
                itemBuilder: (BuildContext context, Olahraga olahragaItem) =>
                    Text(describeEnum(olahragaItem)),
                selectedItemBuilder:
                    (BuildContext context, Olahraga olahragaItem) =>
                        Text(describeEnum(olahragaItem)),
                validator: (olahraga) =>
                    olahraga == null ? 'wajib diisi' : null,
                onSaved: (olahraga) {
                  _formResult.olahraga = olahraga;
                },
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                focusNodes: olahragaFocusnodes,
                onChanged: (olahraga) {
                  final olahragaIndex = Olahraga.values.indexOf(olahraga);
                  if (olahragaIndex >= 0) {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context)
                        .requestFocus(olahragaFocusnodes[olahragaIndex]);
                  }
                },
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitForm,
        tooltip: 'Save',
        child: Icon(
          Icons.check,
          size: 36.0,
        ),
      ),
    );
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      print('Assessmen IND BCA :\n');
      print(_formResult.toJson());
    }
  }

  // coba hitung disini
  //
  //
  //
  //
  //
  //
}
