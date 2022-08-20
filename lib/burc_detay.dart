import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:palette_generator/palette_generator.dart';

import 'model/burc.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
 Color appBarRengi = Colors.transparent;
 late PaletteGenerator _generator; 

 @override
  void initState() {
    super.initState();
    //gelen veriyi çalıştırır sonra rengini alır 
    WidgetsBinding.instance!.addPostFrameCallback((_)=>appBarRenginiBul()) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: appBarRengi,
            flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
                centerTitle: true,
                background: Image.asset(
                  "images/" + widget.secilenBurc.burcBuyukResim,
                  fit: BoxFit.cover,
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              child:  SingleChildScrollView(
                  child: Text(
                    widget.secilenBurc.burcDetayi,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
            ),
          ),
        ]
      ),
    );
  }
  
  void appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(AssetImage("images/${widget.secilenBurc.burcBuyukResim}"));
    appBarRengi = _generator.vibrantColor!.color;
    setState(() {
      
    });
  }
}
