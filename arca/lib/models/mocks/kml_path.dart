import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class KMLPath {
  static String argentineCa1 = "assets/kml/Argentine/Cafayate/Cafayate1.kml";
  static String argentineCa2 = "assets/kml/Argentine/Cafayate/Cafayate2.kml";
  static String argentineCa3 = "assets/kml/Argentine/Cafayate/Cafayate3.kml";
  static String argentineCa4 = "assets/kml/Argentine/Cafayate/Cafayate4.kml";
  static String argentineCa5 = "assets/kml/Argentine/Cafayate/Cafayate5.kml";

  static String argentineCc1 =
      "assets/kml/Argentine/Colonia_Caroya/Colonia_Caroya1.kml";
  static String argentineCc2 =
      "assets/kml/Argentine/Colonia_Caroya/Colonia_Caroya2.kml";
  static String argentineCc3 =
      "assets/kml/Argentine/Colonia_Caroya/Colonia_Caroya3.kml";
  static String argentineCc4 =
      "assets/kml/Argentine/Colonia_Caroya/Colonia_Caroya4.kml";
  static String argentineCc5 =
      "assets/kml/Argentine/Colonia_Caroya/Colonia_Caroya5.kml";

  static String argentineSc1 =
      "assets/kml/Argentine/San_Carlos/San_Carlos1.kml";
  static String argentineSc2 =
      "assets/kml/Argentine/San_Carlos/San_Carlos2.kml";
  static String argentineSc3 =
      "assets/kml/Argentine/San_Carlos/San_Carlos3.kml";
  static String argentineSc4 =
      "assets/kml/Argentine/San_Carlos/San_Carlos4.kml";
  static String argentineSc5 =
      "assets/kml/Argentine/San_Carlos/San_Carlos5.kml";

  static String argentineSr1 = "assets/kml/Argentine/SanRafael/San_Rafael1.kml";
  static String argentineSr2 = "assets/kml/Argentine/SanRafael/San_Rafael2.kml";
  static String argentineSr3 = "assets/kml/Argentine/SanRafael/San_Rafael3.kml";
  static String argentineSr4 = "assets/kml/Argentine/SanRafael/San_Rafael4.kml";
  static String argentineSr5 = "assets/kml/Argentine/SanRafael/San_Rafael5.kml";

  static String argentineTu1 = "assets/kml/Argentine/Tunuyan/Tunuyan1.kml";
  static String argentineTu2 = "assets/kml/Argentine/Tunuyan/Tunuyan2.kml";
  static String argentineTu3 = "assets/kml/Argentine/Tunuyan/Tunuyan3.kml";
  static String argentineTu4 = "assets/kml/Argentine/Tunuyan/Tunuyan4.kml";
  static String argentineTu5 = "assets/kml/Argentine/Tunuyan/Tunuyan5.kml";

  static String chinaCa1 = "assets/kml/China/Cangzhou/Cangzhou1.kml";
  static String chinaCa2 = "assets/kml/China/Cangzhou/Cangzhou2.kml";
  static String chinaCa3 = "assets/kml/China/Cangzhou/Cangzhou3.kml";
  static String chinaCa4 = "assets/kml/China/Cangzhou/Cangzhou4.kml";
  static String chinaCa5 = "assets/kml/China/Cangzhou/Cangzhou5.kml";

  static String chinaDe1 = "assets/kml/China/Dezhou/Dezhou1.kml";
  static String chinaDe2 = "assets/kml/China/Dezhou/Dezhou2.kml";
  static String chinaDe3 = "assets/kml/China/Dezhou/Dezhou3.kml";
  static String chinaDe4 = "assets/kml/China/Dezhou/Dezhou4.kml";
  static String chinaDe5 = "assets/kml/China/Dezhou/Dezhou5.kml";

  static String chinaLi1 = "assets/kml/China/Liaocheng/Liaocheng1.kml";
  static String chinaLi2 = "assets/kml/China/Liaocheng/Liaocheng2.kml";
  static String chinaLi3 = "assets/kml/China/Liaocheng/Liaocheng3.kml";
  static String chinaLi4 = "assets/kml/China/Liaocheng/Liaocheng4.kml";
  static String chinaLi5 = "assets/kml/China/Liaocheng/Liaocheng5.kml";

  static String chinaSh1 = "assets/kml/China/Shijiazhuang/Shijiazhuang1.kml";
  static String chinaSh2 = "assets/kml/China/Shijiazhuang/Shijiazhuang2.kml";
  static String chinaSh3 = "assets/kml/China/Shijiazhuang/Shijiazhuang3.kml";
  static String chinaSh4 = "assets/kml/China/Shijiazhuang/Shijiazhuang4.kml";
  static String chinaSh5 = "assets/kml/China/Shijiazhuang/Shijiazhuang5.kml";

  static String chinaZe1 = "assets/kml/China/Zengcun/Zengcun1.kml";
  static String chinaZe2 = "assets/kml/China/Zengcun/Zengcun2.kml";
  static String chinaZe3 = "assets/kml/China/Zengcun/Zengcun3.kml";
  static String chinaZe4 = "assets/kml/China/Zengcun/Zengcun4.kml";
  static String chinaZe5 = "assets/kml/China/Zengcun/Zengcun5.kml";

  static String EEUUCa1 = "assets/kml/EEUU/California/California1.kml";
  static String EEUUCa2 = "assets/kml/EEUU/California/California2.kml";
  static String EEUUCa3 = "assets/kml/EEUU/California/California3.kml";
  static String EEUUCa4 = "assets/kml/EEUU/California/California4.kml";
  static String EEUUCa5 = "assets/kml/EEUU/California/California5.kml";

  static String EEUUCs1 = "assets/kml/EEUU/Carolina_Sur/Carolina1.kml";
  static String EEUUCs2 = "assets/kml/EEUU/Carolina_Sur/Carolina2.kml";
  static String EEUUCs3 = "assets/kml/EEUU/Carolina_Sur/Carolina3.kml";
  static String EEUUCs4 = "assets/kml/EEUU/Carolina_Sur/Carolina4.kml";
  static String EEUUCs5 = "assets/kml/EEUU/Carolina_Sur/Carolina5.kml";

  static String EEUUFl1 = "assets/kml/EEUU/Florida/Florida1.kml";
  static String EEUUFl2 = "assets/kml/EEUU/Florida/Florida2.kml";
  static String EEUUFl3 = "assets/kml/EEUU/Florida/Florida3.kml";
  static String EEUUFl4 = "assets/kml/EEUU/Florida/Florida4.kml";
  static String EEUUFl5 = "assets/kml/EEUU/Florida/Florida5.kml";

  static String EEUUOr1 = "assets/kml/EEUU/Oregon/Oregon1.kml";
  static String EEUUOr2 = "assets/kml/EEUU/Oregon/Oregon2.kml";
  static String EEUUOr3 = "assets/kml/EEUU/Oregon/Oregon3.kml";
  static String EEUUOr4 = "assets/kml/EEUU/Oregon/Oregon4.kml";
  static String EEUUOr5 = "assets/kml/EEUU/Oregon/Oregon5.kml";

  static String EEUUWa1 = "assets/kml/EEUU/Washington/Washington1.kml";
  static String EEUUWa2 = "assets/kml/EEUU/Washington/Washington2.kml";
  static String EEUUWa3 = "assets/kml/EEUU/Washington/Washington3.kml";
  static String EEUUWa4 = "assets/kml/EEUU/Washington/Washington4.kml";
  static String EEUUWa5 = "assets/kml/EEUU/Washington/Washington5.kml";

  static String italyEmi1 = "assets/kml/Italy/Emilia/Emilia1.kml";
  static String italyEmi2 = "assets/kml/Italy/Emilia/Emilia2.kml";
  static String italyEmi3 = "assets/kml/Italy/Emilia/Emilia3.kml";
  static String italyEmi4 = "assets/kml/Italy/Emilia/Emilia4.kml";
  static String italyEmi5 = "assets/kml/Italy/Emilia/Emilia5.kml";

  static String italyEmp1 = "assets/kml/Italy/Empoli/Empoli1.kml";
  static String italyEmp2 = "assets/kml/Italy/Empoli/Empoli2.kml";
  static String italyEmp3 = "assets/kml/Italy/Empoli/Empoli3.kml";
  static String italyEmp4 = "assets/kml/Italy/Empoli/Empoli4.kml";
  static String italyEmp5 = "assets/kml/Italy/Empoli/Empoli5.kml";

  static String italyFl1 = "assets/kml/Italy/Florencia/Florencia1.kml";
  static String italyFl2 = "assets/kml/Italy/Florencia/Florencia2.kml";
  static String italyFl3 = "assets/kml/Italy/Florencia/Florencia3.kml";
  static String italyFl4 = "assets/kml/Italy/Florencia/Florencia4.kml";
  static String italyFl5 = "assets/kml/Italy/Florencia/Florencia5.kml";

  static String italyRo1 = "assets/kml/Italy/Roma/Roma1.kml";
  static String italyRo2 = "assets/kml/Italy/Roma/Roma2.kml";
  static String italyRo3 = "assets/kml/Italy/Roma/Roma3.kml";
  static String italyRo4 = "assets/kml/Italy/Roma/Roma4.kml";
  static String italyRo5 = "assets/kml/Italy/Roma/Roma5.kml";

  static String italyVe1 = "assets/kml/Italy/Verona/Verona1.kml";
  static String italyVe2 = "assets/kml/Italy/Verona/Verona2.kml";
  static String italyVe3 = "assets/kml/Italy/Verona/Verona3.kml";
  static String italyVe4 = "assets/kml/Italy/Verona/Verona4.kml";
  static String italyVe5 = "assets/kml/Italy/Verona/Verona5.kml";

  static String spainHa1 = "assets/kml/Spain/Haro/Haro1.kml";
  static String spainHa2 = "assets/kml/Spain/Haro/Haro2.kml";
  static String spainHa3 = "assets/kml/Spain/Haro/Haro3.kml";
  static String spainHa4 = "assets/kml/Spain/Haro/Haro4.kml";
  static String spainHa5 = "assets/kml/Spain/Haro/Haro5.kml";

  static String spainLa1 = "assets/kml/Spain/Laguardia/Laguardia1.kml";
  static String spainLa2 = "assets/kml/Spain/Laguardia/Laguardia2.kml";
  static String spainLa3 = "assets/kml/Spain/Laguardia/Laguardia3.kml";
  static String spainLa4 = "assets/kml/Spain/Laguardia/Laguardia4.kml";
  static String spainLa5 = "assets/kml/Spain/Laguardia/Laguardia5.kml";

  static String spainLl1 = "assets/kml/Spain/Lleida/Lleida1.kml";
  static String spainLl2 = "assets/kml/Spain/Lleida/Lleida2.kml";
  static String spainLl3 = "assets/kml/Spain/Lleida/Lleida3.kml";
  static String spainLl4 = "assets/kml/Spain/Lleida/Lleida4.kml";
  static String spainLl5 = "assets/kml/Spain/Lleida/Lleida5.kml";

  static String spainPe1 = "assets/kml/Spain/Penafiel/Penafiel1.kml";
  static String spainPe2 = "assets/kml/Spain/Penafiel/Penafiel2.kml";
  static String spainPe3 = "assets/kml/Spain/Penafiel/Penafiel3.kml";
  static String spainPe4 = "assets/kml/Spain/Penafiel/Penafiel4.kml";
  static String spainPe5 = "assets/kml/Spain/Penafiel/Penafiel5.kml";

  static String spainVp1 =
      "assets/kml/Spain/VilafrancaPenedes/VilafrancaPenedes1.kml";
  static String spainVp2 =
      "assets/kml/Spain/VilafrancaPenedes/VilafrancaPenedes2.kml";
  static String spainVp3 =
      "assets/kml/Spain/VilafrancaPenedes/VilafrancaPenedes3.kml";
  static String spainVp4 =
      "assets/kml/Spain/VilafrancaPenedes/VilafrancaPenedes4.kml";
  static String spainVp5 =
      "assets/kml/Spain/VilafrancaPenedes/VilafrancaPenedes5.kml";

  static List<String> _getKMLPaths() {
    return [
      argentineCa1,
      argentineCa2,
      argentineCa3,
      argentineCa4,
      argentineCa5,
      argentineCc1,
      argentineCc2,
      argentineCc3,
      argentineCc4,
      argentineCc5,
      argentineSc1,
      argentineSc2,
      argentineSc3,
      argentineSc4,
      argentineSc5,
      argentineSr1,
      argentineSr2,
      argentineSr3,
      argentineSr4,
      argentineSr5,
      argentineTu1,
      argentineTu2,
      argentineTu3,
      argentineTu4,
      argentineTu5,
      chinaCa1,
      chinaCa2,
      chinaCa3,
      chinaCa4,
      chinaCa5,
      chinaDe1,
      chinaDe2,
      chinaDe3,
      chinaDe4,
      chinaDe5,
      chinaLi1,
      chinaLi2,
      chinaLi3,
      chinaLi4,
      chinaLi5,
      chinaSh1,
      chinaSh2,
      chinaSh3,
      chinaSh4,
      chinaSh5,
      chinaZe1,
      chinaZe2,
      chinaZe3,
      chinaZe4,
      chinaZe5,
      EEUUCa1,
      EEUUCa2,
      EEUUCa3,
      EEUUCa4,
      EEUUCa5,
      EEUUCs1,
      EEUUCs2,
      EEUUCs3,
      EEUUCs4,
      EEUUCs5,
      EEUUFl1,
      EEUUFl2,
      EEUUFl3,
      EEUUFl4,
      EEUUFl5,
      EEUUOr1,
      EEUUOr2,
      EEUUOr3,
      EEUUOr4,
      EEUUOr5,
      EEUUWa1,
      EEUUWa2,
      EEUUWa3,
      EEUUWa4,
      EEUUWa5,
      italyEmi1,
      italyEmi2,
      italyEmi3,
      italyEmi4,
      italyEmi5,
      italyEmp1,
      italyEmp2,
      italyEmp3,
      italyEmp4,
      italyEmp5,
      italyFl1,
      italyFl2,
      italyFl3,
      italyFl4,
      italyFl5,
      italyRo1,
      italyRo2,
      italyRo3,
      italyRo4,
      italyRo5,
      italyVe1,
      italyVe2,
      italyVe3,
      italyVe4,
      italyVe5,
      spainHa1,
      spainHa2,
      spainHa3,
      spainHa4,
      spainHa5,
      spainLa1,
      spainLa2,
      spainLa3,
      spainLa4,
      spainLa5,
      spainLl1,
      spainLl2,
      spainLl3,
      spainLl4,
      spainLl5,
      spainPe1,
      spainPe2,
      spainPe3,
      spainPe4,
      spainPe5,
      spainPe5,
      spainVp1,
      spainVp2,
      spainVp3,
      spainVp4,
      spainVp5,
    ];
  }

  static Future<List<File>> getKMLFiles() async{
    List<File> files = [];
    for (String path in _getKMLPaths()) {
      final appDir = await getFileFromAssets(path);
      files.add(File(appDir.path));
    }
    return files;
  }

  static Future<File> getFileFromAssets(String path) async {

    File? file = await existFile(path);
    file ??= await createFile(path);

    return file;
  }

  static Future<File> createFile(String path) async{
    final byteData = await rootBundle.load(path);
    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }

  static Future<File?> existFile(String path)async{
    final file = File('${(await getTemporaryDirectory()).path}/$path');
    if(await file.exists()){
      return file;
    } else{
      return null;
    }
  }
}
