import 'package:flutter/material.dart';

class Hakkinda extends StatefulWidget {
  @override
  _HakkindaState createState() => _HakkindaState();
}
class _HakkindaState extends State<Hakkinda> {
  TextEditingController t1 = TextEditingController();
  List hakkindaListe = [];
  @override
  elemanEkle() {
    setState(() {
      hakkindaListe.add(t1.text);
      t1.clear();
    });
  }

  elemanCikar() {
    setState(() {
      hakkindaListe.remove(t1.text);
      t1.clear();
    });
  }
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen "
              "3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında "
              "193301012 numaralı Hasan ÇETİNKAYA tarafından"
              "30 Nisan 2021 günü yapılmıştır.",style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Alışveriş Listesi Sayfasına Dön'),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: hakkindaListe.length,
              itemBuilder: (context, siraNumarasi) => ListTile(
                subtitle: Text("Hakkında"),
                title: Text(hakkindaListe[siraNumarasi]),
              ),
            ),
          ),
          TextField(
            controller: t1,
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
            cursorColor: Colors.red,
          ),
          ElevatedButton(onPressed: elemanEkle, child: Text("Ekle"),),
          ElevatedButton(onPressed: elemanCikar, child: Text("Çıkar"),),
        ],
      ),
    );
  }
}




