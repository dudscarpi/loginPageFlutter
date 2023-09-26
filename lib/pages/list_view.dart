import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/widgets/app_images.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPage();
}

class _ListViewPage extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user1),
          title: Text("Amor"),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Te amo"),
              Text("08:59"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
              if (menu == "opcao2") {}
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(value: "opcao1", child: Text("Responder")),
                PopupMenuItem(value: "opcao2", child: Text("Marcar como Lida")),
                PopupMenuItem(value: "opcao3", child: Text("Excluir"))
              ];
            },
          ),
        ),
        ListTile(
          leading: Image.asset(AppImages.user4),
          title: Text("Tranqueira"),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Já lavou o arroz???"),
              Text("08:00"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
              if (menu == "opcao2") {}
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(value: "opcao1", child: Text("Responder")),
                PopupMenuItem(value: "opcao2", child: Text("Marcar como Lida")),
                PopupMenuItem(value: "opcao3", child: Text("Excluir"))
              ];
            },
          ),
        ),
        ListTile(
          leading: Image.asset(AppImages.user3),
          title: Text("Sara"),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hoje é dia de lixo?"),
              Text("07:05"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
              if (menu == "opcao2") {}
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(value: "opcao1", child: Text("Responder")),
                PopupMenuItem(value: "opcao2", child: Text("Marcar como Lida")),
                PopupMenuItem(value: "opcao3", child: Text("Excluir"))
              ];
            },
          ),
        ),
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: Text("Renatha"),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pode jantar tô longe"),
              Text("21:59"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              print(menu);
              if (menu == "opcao2") {}
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem(value: "opcao1", child: Text("Responder")),
                PopupMenuItem(value: "opcao2", child: Text("Marcar como Lida")),
                PopupMenuItem(value: "opcao3", child: Text("Excluir"))
              ];
            },
          ),
        ),
      ],
    );
  }
}
