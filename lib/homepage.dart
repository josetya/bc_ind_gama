import 'dart:math';

import 'package:bc_ind_gama/aboutus.dart';
import 'package:bc_ind_gama/form/score.dart';
import 'package:bc_ind_gama/referensi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'form/assessment.dart';
//import 'formField/myMultiselectionFormField.dart';
import 'formField/myToggleButtonsFormField.dart';
import 'result.dart';
import 'widgets/myToggleButtons.dart';

enum Alkohol { Ya, Tidak } //2

//enum StatusNikah { Menikah, Pernah_Menikah, Belum_Menikah } //3

enum RiwayatKeluarga { Ya, Tidak } //4

enum AlatKontrasepsi { Tidak, Pil, Suntik, Implan, IUD, lainnya } //5 ***

enum TerapiHormonal { Ya, Tidak } //6

enum Haid { _7_sd_11, _12_sd_13, _diatas_13 } //7

enum Menopause { Ya, Tidak }

enum Melahirkan { Ya, Tidak } //8

enum AsiEksklusif { Ya, Tidak } //9

enum Merokok { Ya, Tidak } //10

enum Olahraga { Ya, Tidak } //12

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final _formResult = Assessment();
  final _formscore = score();
  final nameFocusNode = FocusNode();
  final umurFocusNode = FocusNode();
  final beratFocusNode = FocusNode();
  final tinggiFocusNode = FocusNode();
  final alkoholFocusNodes = [FocusNode(), FocusNode(), FocusNode()];
  final statusNikahFocusNodes = [FocusNode(), FocusNode(), FocusNode()];
  final riwayatKeluargaFocusnodes = [FocusNode(), FocusNode()];
  final alatKontrasepsiFocusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode()
  ];
  final terapiHormonalFocusnodes = [FocusNode(), FocusNode()];
  final haidFocusnodes = [FocusNode(), FocusNode(), FocusNode()];
  final menopauseFocusnodes = [FocusNode(), FocusNode()];
  final umurmenopauseFocusNode = FocusNode();
  final asiEksklusifFocusnodes = [FocusNode(), FocusNode(), FocusNode()];
  final melahirkanFocusNodes = [FocusNode(), FocusNode()];
  final merokokFocusnodes = [FocusNode(), FocusNode()];
  final olahragaFocusnodes = [FocusNode(), FocusNode()];

  double totalscore;
  double totalnilai;
  double totalumur;
  bool mustmeno;
  double y;
  double e;
  double power;
  double powplus1;
  double konstanta;
  double nilai;
  //Object get alkoholItem => null;

  //get alkohol => null;

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                // Add TextFormFields and ElevatedButton here.
                //
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
                TextFormField(
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
                //2.1 berat badan
                MyTextFormField(
                  decoration:
                      new InputDecoration(labelText: "Berat Badan dalam kg"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  initialValue: _formResult.berat,
                  validator: (berat) {
                    if (berat.isEmpty) {
                      return 'Berat Badan Diperlukan';
                    }
                    //if (userName.length < 3) {
                    //  return 'Nama ';
                    //}
                    return null;
                  },
                  onSaved: (berat) {
                    _formResult.berat = berat;
                  },
                  autofocus: true,
                  focusNode: beratFocusNode,
                  textInputAction: TextInputAction.next,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context).requestFocus(beratFocusNode);
                  },
                ),

                SizedBox(height: 8.0),
                //2.2 tinggi
                MyTextFormField(
                  decoration:
                      new InputDecoration(labelText: "Tinggi badan dalam cm"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  initialValue: _formResult.tinggi,
                  validator: (tinggi) {
                    if (tinggi.isEmpty) {
                      return 'Tinggi badan Diperlukan';
                    }
                    //if (userName.length < 3) {
                    //  return 'Nama ';
                    //}
                    return null;
                  },
                  onSaved: (tinggi) {
                    _formResult.tinggi = tinggi;
                  },
                  autofocus: true,
                  focusNode: tinggiFocusNode,
                  textInputAction: TextInputAction.next,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context).requestFocus(tinggiFocusNode);
                  },
                ),

                SizedBox(height: 8.0),
                //4. status pernikahan
                Container(
                    child: Row(
                  children: <Widget>[
                    Flexible(
                        child: new Text("Apakah Status pernikahan saudari ?"))
                  ],
                )),

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
                Column(
                  children: [
                    MyToggleButtonsFormField<AlatKontrasepsi>(
                      decoration: InputDecoration(
                        labelText: 'AlatKontrasepsi',
                      ),
                      initialValue: _formResult.alatKontrasepsi,
                      items: AlatKontrasepsi.values,
                      itemBuilder: (BuildContext context,
                              AlatKontrasepsi alatKontrasepsiItem) =>
                          Text(
                        describeEnum(alatKontrasepsiItem),
                        maxLines: 2,
                      ),
                      selectedItemBuilder: (BuildContext context,
                              AlatKontrasepsi alatKontrasepsiItem) =>
                          Text(
                        describeEnum(alatKontrasepsiItem),
                        maxLines: 2,
                      ),
                      validator: (alatKontrasepsi) =>
                          alatKontrasepsi == null ? 'Wajib diisi' : null,
                      onSaved: (alatKontrasepsi) {
                        _formResult.alatKontrasepsi = alatKontrasepsi;
                      },
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      focusNodes: alatKontrasepsiFocusNodes,
                      onChanged: (alatKontrasepsi) {
                        final alatKontrasepsiIndex =
                            AlatKontrasepsi.values.indexOf(alatKontrasepsi);
                        if (alatKontrasepsiIndex >= 0) {
                          FocusScope.of(context).unfocus();
                          FocusScope.of(context).requestFocus(
                              alatKontrasepsiFocusNodes[alatKontrasepsiIndex]);
                        }
                      },
                    ),
                  ],
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
                  itemBuilder: (BuildContext context,
                          TerapiHormonal terapiHormonalItem) =>
                      Text(describeEnum(terapiHormonalItem)),
                  selectedItemBuilder: (BuildContext context,
                          TerapiHormonal terapiHormonalItem) =>
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
                            "Umur berapakah saudari pertama kali mengalami menstruasi / haid ?"))
                  ],
                )),
                MyToggleButtonsFormField<Haid>(
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
                        child:
                            new Text("Apakah anda sudah mengalami menopause?"))
                  ],
                )),
                MyToggleButtonsFormField<Menopause>(
                  //decoration: InputDecoration(
                  //  labelText:
                  //      'Apakah Anda mengalami menopause sebelum umur 55 tahun?',
                  //),
                  initialValue: _formResult.menopause,
                  items: Menopause.values,
                  itemBuilder:
                      (BuildContext context, Menopause menopauseItem) =>
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
                Container(
                    child: Row(
                  children: <Widget>[
                    Flexible(child: new Text("Umur ketika menopause"))
                  ],
                )),
                SizedBox(height: 8.0),
                //9.1 umurmenopause

                MyTextFormField(
                  decoration: new InputDecoration(
                      labelText: "Wajib diisi jika sudah menopause",
                      fillColor: Colors.red),
                  keyboardType: TextInputType.number,

                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  //initialValue: _formResult.umurmenopause,
                  //validator: (menopause) =>
                  //    _formResult.menopause == Menopause.Ya ? 'wajib diisi' : null,

                  //validator: (menopause) {
                  //  if (menopause.isEmpty) {
                  //    return 'Menopause badan Diperlukan';
                  //  }
                  //if (userName.length < 3) {
                  //  return 'Nama ';
                  //}
                  //  return null;
                  //},
                  onSaved: (umurmenopause) {
                    _formResult.umurmenopause = umurmenopause;
                  },
                  autofocus: true,
                  focusNode: umurmenopauseFocusNode,
                  textInputAction: TextInputAction.next,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    FocusScope.of(context).requestFocus(umurmenopauseFocusNode);
                  },
                ),
                SizedBox(height: 8.0),
                // 10. melahirkan
                Container(
                    child: Row(
                  children: <Widget>[
                    Flexible(
                        child: new Text("apakah saudari pernah melahirkan? "))
                  ],
                )),
                MyToggleButtonsFormField<Melahirkan>(
                  decoration: InputDecoration(
                    labelText: 'Melahirkan',
                  ),
                  initialValue: _formResult.melahirkan,
                  items: Melahirkan.values,
                  itemBuilder:
                      (BuildContext context, Melahirkan melahirkanItem) =>
                          Text(describeEnum(melahirkanItem)),
                  selectedItemBuilder:
                      (BuildContext context, Melahirkan melahirkanItem) =>
                          Text(describeEnum(melahirkanItem)),
                  validator: (melahirkan) =>
                      melahirkan == null ? 'Melahirkan is required' : null,
                  onSaved: (melahirkan) {
                    _formResult.melahirkan = melahirkan;
                  },
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  focusNodes: melahirkanFocusNodes,
                  onChanged: (melahirkan) {
                    final melahirkanIndex =
                        Melahirkan.values.indexOf(melahirkan);
                    if (melahirkanIndex >= 0) {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context)
                          .requestFocus(melahirkanFocusNodes[melahirkanIndex]);
                    }
                  },
                ),

                SizedBox(height: 8.0),
                // 10. asiEksklusif
                Container(
                    child: Row(
                  children: <Widget>[
                    Flexible(
                        child: new Text(
                            "Apakah Anda memberi Air Susu Ibu secara eksklusif pada pada putra/putri yang anda lahirkan? "))
                  ],
                )),
                MyToggleButtonsFormField<AsiEksklusif>(
                  //decoration: InputDecoration(
                  //  labelText:
                  //      'Apakah Anda asiEksklusif (tidak bisa mempunyai keturunan)?',
                  //),
                  initialValue: _formResult.asiEksklusif,
                  items: AsiEksklusif.values,
                  itemBuilder:
                      (BuildContext context, AsiEksklusif asiEksklusifItem) =>
                          Text(describeEnum(asiEksklusifItem)),
                  selectedItemBuilder:
                      (BuildContext context, AsiEksklusif asiEksklusifItem) =>
                          Text(describeEnum(asiEksklusifItem)),
                  validator: (asiEksklusif) =>
                      asiEksklusif == null ? 'wajib diisi' : null,
                  onSaved: (asiEksklusif) {
                    _formResult.asiEksklusif = asiEksklusif;
                  },
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  focusNodes: asiEksklusifFocusnodes,
                  onChanged: (asiEksklusif) {
                    final asiEksklusifIndex =
                        AsiEksklusif.values.indexOf(asiEksklusif);
                    if (asiEksklusifIndex >= 0) {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context).requestFocus(
                          asiEksklusifFocusnodes[asiEksklusifIndex]);
                    }
                  },
                ),
                SizedBox(height: 8.0),
                // 11. merokok
                Container(
                    child: Row(
                  children: <Widget>[
                    Flexible(child: new Text("Apakah saudari merokok ?"))
                  ],
                )),
                MyToggleButtonsFormField<Merokok>(
                  initialValue: _formResult.merokok,
                  items: Merokok.values,
                  itemBuilder: (BuildContext context, Merokok merokokItem) =>
                      Text(describeEnum(merokokItem)),
                  selectedItemBuilder:
                      (BuildContext context, Merokok merokokItem) =>
                          Text(describeEnum(merokokItem)),
                  //validator: (merokok) =>
                  //    merokok == null ? 'wajib diisi' : null,
                  onSaved: (merokok) {
                    _formResult.merokok = merokok;
                  },
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  focusNodes: merokokFocusnodes,
                  onChanged: (merokok) {
                    final merokokIndex = Merokok.values.indexOf(merokok);
                    if (merokokIndex >= 0) {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context)
                          .requestFocus(merokokFocusnodes[merokokIndex]);
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

                // 3. alkohol
                Container(
                    child: Row(
                  children: <Widget>[
                    Flexible(
                        child: new Text(
                            "Apakah saudari suka mengkonsumsi Alkohol?"))
                  ],
                )),
                MyToggleButtonsFormField<Alkohol>(
                  initialValue: _formResult.alkohol,
                  items: Alkohol.values,
                  itemBuilder: (BuildContext context, Alkohol alkoholItem) =>
                      Text(describeEnum(alkoholItem)),
                  selectedItemBuilder:
                      (BuildContext context, Alkohol alkoholItem) =>
                          Text(describeEnum(alkoholItem)),
                  //validator: (alkohol) =>
                  //    alkohol == null ? 'wajib diisi' : null,
                  onSaved: (alkohol) {
                    _formResult.alkohol = alkohol;
                  },
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  focusNodes: alkoholFocusNodes,
                  onChanged: (alkohol) {
                    final alkoholIndex = Alkohol.values.indexOf(alkohol);
                    if (alkoholIndex >= 0) {
                      FocusScope.of(context).unfocus();
                      FocusScope.of(context)
                          .requestFocus(alkoholFocusNodes[alkoholIndex]);
                    }
                  },
                ),
                SizedBox(height: 8.0),
                Container(
                  child: FloatingActionButton(
                    onPressed: _submitForm,
                    tooltip: 'Save',
                    child: Icon(
                      Icons.check,
                      size: 36.0,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.green,
                //image: DecorationImage(image: AssetImage(assetName),
                //fit: BoxFit.cover),
              ),
            ),
            ListTile(
              title: Text('Referensi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Referensi()),
                );
              },
            ),
            ListTile(
              title: Text('Tentang kami'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Aboutus()),
                );
              },
            ),
          ],
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
      //print(_formResult.asiEksklusif);

      //print(_formResult.menopause);
      //print(_formResult.name);
      //print(_formResult.alatKontrasepsi);
      //

      _formscore.umurscore = (double.tryParse(_formResult.umur) * -0.51);
      _formscore.bmiscore = (double.tryParse(_formResult.berat) /
          ((double.tryParse(_formResult.tinggi) / 100) *
              (double.tryParse(_formResult.tinggi) / 100)));
      if (_formscore.bmiscore <= 18.5) {
        _formscore.beratBadanscore = 0;
      }
      if ((_formscore.bmiscore > 18.5)&&(_formscore.bmiscore <= 24.99)) {
        _formscore.beratBadanscore = -0.462;
      }
      if ((_formscore.bmiscore > 24.99)&&(_formscore.bmiscore < 30)) {
        _formscore.beratBadanscore = -0.462 * 2;
      }
      if (_formscore.bmiscore >= 30) {
        _formscore.beratBadanscore = -0.462 * 3;
      }

      if ((_formResult.menopause == Menopause.Ya)&&(double.tryParse(_formResult.umurmenopause) < 55)) {
          _formscore.menopausescore = 2.886 * 2;
        }
      if ((_formResult.menopause == Menopause.Ya)&&(double.tryParse(_formResult.umurmenopause) >= 55)) {
          _formscore.menopausescore = 2.886 * 1;
        }
      
      if (_formResult.menopause == Menopause.Tidak) {
        _formscore.menopausescore = 2.886 * 1;
      }

      if (_formResult.alkohol == Alkohol.Ya) {
        _formscore.alkoholscore = 0;
      }
      if (_formResult.alkohol == Alkohol.Tidak) {
        _formscore.alkoholscore = 0;
      }
      //if (_formResult.statusNikah == StatusNikah.Menikah) {
      //  _formscore.statusNikahscore = 0;
      //}
      //if (_formResult.statusNikah == StatusNikah.Pernah_Menikah) {
      //  _formscore.statusNikahscore = 0.90;
      //}
      //if (_formResult.statusNikah == StatusNikah.Belum_Menikah) {
      //  _formscore.statusNikahscore = 1.07;
      //}
      if (_formResult.riwayatKeluarga == RiwayatKeluarga.Ya) {
        _formscore.riwayatKeluargascore = -1.529;
      }
      if (_formResult.riwayatKeluarga == RiwayatKeluarga.Tidak) {
        _formscore.riwayatKeluargascore = 0;
      }
      if (_formResult.terapiHormonal == TerapiHormonal.Ya) {
        _formscore.terapiHormonalscore = -2.168;
      }
      if (_formResult.terapiHormonal == TerapiHormonal.Tidak) {
        _formscore.terapiHormonalscore = 0;
      }
      if (_formResult.alatKontrasepsi == AlatKontrasepsi.Tidak) {
        _formscore.alatKontrasepsiscore = 1.369;
      }
      if (_formResult.alatKontrasepsi == AlatKontrasepsi.lainnya) {
        _formscore.alatKontrasepsiscore = 1.369;
      }
      if (_formResult.alatKontrasepsi == AlatKontrasepsi.IUD) {
        _formscore.alatKontrasepsiscore = 1.369;
      }
      if (_formResult.alatKontrasepsi == AlatKontrasepsi.Implan) {
        _formscore.alatKontrasepsiscore = 1.369 * 2;
      }
      if (_formResult.alatKontrasepsi == AlatKontrasepsi.Pil) {
        _formscore.alatKontrasepsiscore = 1.369 * 2;
      }
      if (_formResult.alatKontrasepsi == AlatKontrasepsi.Suntik) {
        _formscore.alatKontrasepsiscore = 1.369 * 2;
      }

      if (_formResult.haid == Haid._7_sd_11) {
        _formscore.haidscore = 0.477;
      }
      if (_formResult.haid == Haid._12_sd_13) {
        _formscore.haidscore = 0.477 * 2;
      }
      if (_formResult.haid == Haid._diatas_13) {
        _formscore.haidscore = 0.477 * 3;
      }

      if (_formResult.melahirkan == Melahirkan.Ya) {
        if (_formResult.asiEksklusif == AsiEksklusif.Ya) {
          _formscore.asiEksklusifscore = 0.997;
        }
        if (_formResult.asiEksklusif == AsiEksklusif.Tidak) {
          _formscore.asiEksklusifscore = 0.997 * 2;
        }
      }

      if (_formResult.melahirkan == Melahirkan.Tidak) {
        _formscore.asiEksklusifscore = 0;
      }

      if (_formResult.merokok == Merokok.Ya) {
        _formscore.merokokscore = 0;
      }
      if (_formResult.merokok == Merokok.Tidak) {
        _formscore.merokokscore = 0;
      }
      if (_formResult.olahraga == Olahraga.Ya) {
        _formscore.olahragascore = -0.999;
      }
      if (_formResult.olahraga == Olahraga.Tidak) {
        _formscore.olahragascore = -0.999 * 3;
      }
      konstanta = 5.549;
      e = 2.718281828459045235360287471352;
      _formscore.totalscore = (_formscore.umurscore + //1
              _formscore.riwayatKeluargascore + //2
              _formscore.alatKontrasepsiscore + //3
              _formscore.terapiHormonalscore + //4
              _formscore.haidscore + //5
              _formscore.menopausescore + //6
              _formscore.asiEksklusifscore + //7
              _formscore.beratBadanscore + //8
              _formscore.olahragascore // 9
          );
      print(_formscore.umurscore);
      print(_formscore.riwayatKeluargascore);
      print(_formscore.alatKontrasepsiscore);
      print(_formscore.terapiHormonalscore);
      print(_formscore.haidscore);
      print(_formscore.menopausescore);
      print(_formscore.asiEksklusifscore);
      print(_formscore.beratBadanscore);
      print(_formscore.olahragascore);
      print(_formscore.totalscore);

      y = _formscore.totalscore + konstanta;
      totalumur = _formscore.umurscore;
      print(_formscore.toJson());

      power = pow(e, -y);
      print("x = ");
      print(y);

      print(' e pangkat -x');
      print(power);

      powplus1 = power + 1;

      print('plus 1 = ');
      print(powplus1);

      nilai = (1 / (1 + power));
      totalnilai = nilai *100;

      print('y * 100 = ');
      print(nilai);
      print(totalnilai);

      if ((totalnilai) > 0.5) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Resikorendah(totalnilai: totalnilai, totalumur: totalumur, ),
          ),
        );
        print('Resiko Rendah');
      }

      if ((totalnilai) <= 0.5) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Resikotinggi(totalnilai: totalnilai, totalumur: totalumur),
          ),
        );
        print('Resiko Tinggi');
      }
    }
  }
}
