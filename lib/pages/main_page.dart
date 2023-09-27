import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/list_horizontal.dart';
import 'package:trilhaapp/pages/list_view.dart';
import 'package:trilhaapp/pages/tarefa_page.dart';
import 'package:trilhaapp/shared/custon_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int posicaoPagina = 0;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Main Page")),
        drawer: const CustonDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      posicaoPagina = value;
                    });
                  },
                  children: const [
                    CardPage(),
                    ImageAssetsPage(),
                    ListViewPage(),
                    ListViewHorizontal(),
                    TarefaPage()
                  ]),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: [
                  BottomNavigationBarItem(
                      label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "List1", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "Contatos", icon: Icon(Icons.person)),
                  BottomNavigationBarItem(
                      label: "List2", icon: Icon(Icons.abc)),
                  BottomNavigationBarItem(
                      label: "Tarefas", icon: Icon(Icons.task)),
                ])
          ],
        ),
      ),
    );
  }
}
