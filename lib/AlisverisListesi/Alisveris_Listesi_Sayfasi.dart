import 'package:alisverisliste/hakkinda.dart';
import 'package:alisverisliste/item.dart';
import 'package:flutter/material.dart';
import 'package:alisverisliste/AlisverisListesi/Alisveris_Listesi_Urun_Sayfasi.dart';
import 'package:alisverisliste/AlisverisListesi/dialog/item_dialog.dart';
import 'package:alisverisliste/HTTP/Urun_Servis.dart';

class AlisverisListesiSayfasi extends StatefulWidget {
  @override
  _AlisverisListesiSayfasiState createState() =>
      _AlisverisListesiSayfasiState();
}

class _AlisverisListesiSayfasiState extends State<AlisverisListesiSayfasi> {
  int _secilisayfa = 1;
  final _scaffoldState = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  UrunServis _itemService;

  @override
  void initState() {
    _itemService = UrunServis();
    _pageController.addListener(() {
      int currentIndex = _pageController.page.round();
      if (currentIndex != _secilisayfa) {
        _secilisayfa = currentIndex;

        setState(() {});
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Alışveriş Listesi"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String itemName = await showDialog(
              context: context,
              builder: (BuildContext context) => ItemDialog());
          if (itemName.isNotEmpty) {
            var item =
            Item(name: itemName, isCompleted: false, isArchived: false);

            try {
              await _itemService.addItem(item.toJson());

              setState(() {});
            } catch (ex) {
              _scaffoldState.currentState
                  .showSnackBar(SnackBar(content: Text(ex.toString())));
            }
          }
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text(
                "Giriş",
                style: TextStyle(color: Colors.red),
              ),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text(
                "Alışveriş Listesi",
                style: TextStyle(color: Colors.red),
              ),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text(
                "Geçmiş",
                style: TextStyle(color: Colors.red),
              ),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(
                "Hakkinda",
                style: TextStyle(color: Colors.red),
              ),
              backgroundColor: Colors.black),
        ],
        currentIndex: _secilisayfa,
        onTap: _onTap,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Container(
            color: Colors.green,
          ),
          AlisverisListesiUrunSayfasi(),
          Container(
            color: Colors.yellow,
          ),
          Hakkinda(),
        ],
      ),
    );
  }

  void _onTap(int value) {
    setState(() {
      _secilisayfa = value;
    });
    _pageController.jumpToPage(value);
  }
}
