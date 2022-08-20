import 'package:burclar/burc_item.dart';
import 'package:burclar/data/strings.dart';
import 'package:burclar/model/burc.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;

   BurcListesi(){
    tumBurclar=veriKaynaginiHazirla();
    print(tumBurclar);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Burç Listesi"),),
      body:
      Center(child: 
      ListView.builder(itemBuilder:(context, index){
        return BurcItem(listelenenBurc: tumBurclar[index]);
      },
      itemCount: tumBurclar.length, 
      ),
      ), 
    );
  }
  
  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici =[];
    for(int i = 0 ; i<12;i++){
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetayi = Strings.BURC_GENEL_OZELLIKLERI[i];
      // koc1.png degerini oluşturmak için Koc --> koc --> koc1.png
      var burcKucukResim = Strings.BURC_ADLARI[i].toLowerCase() + '${i+1}.png';

      // koc_buyuk1.png degerini oluşturmak için Koc --> koc_buyuk --> koc_buyuk1.png
      var burcBuyukResim = Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk' + '${i+1}.png';
      Burc eklenecekBurc = Burc(burcAdi, burcTarihi, burcDetayi, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}