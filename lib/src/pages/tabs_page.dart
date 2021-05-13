import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tab1_page.dart';
import 'package:newsapp/src/pages/tab2_page.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>new _NavegacionModel(),
          child: Scaffold(
        body:_Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
 final navegacionModel=Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i)=>navegacionModel.paginaActual=i,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.person_outline,),label:Text('Para ti').toStringShort()),
       BottomNavigationBarItem(icon: Icon(Icons.public,),label:Text('Encabezado').toStringShort())
    ],);
  }
}

class _Paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final navegacionModel=Provider.of<_NavegacionModel>(context);
    return PageView(
    controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
       Tab1Page(),
      Tab2Page(),
      ]
    );
  }
}
class _NavegacionModel with ChangeNotifier{
  int _paginaActual=0;
  PageController _pageController=new PageController(initialPage: 0);
  int get paginaActual=>this._paginaActual;

  set paginaActual(int valor){
    this._paginaActual=valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds:250), curve: Curves.easeInOut);
    notifyListeners();
    //df9df54392c84aeba0a641ea8f9308cb
  }
  PageController get pageController=>this._pageController;
}