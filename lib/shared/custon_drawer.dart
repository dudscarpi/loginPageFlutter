import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/configuracoes/configuracoes_page.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/login_page.dart';
import 'package:trilhaapp/pages/numeros_aleatorios/numeros_aleatorios_hive_page.dart';
import 'package:trilhaapp/pages/numeros_aleatorios/numeros_aleatorios_shared_preferences_page.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text("Câmera"),
                          leading: Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: Text("Galeria"),
                          leading: Icon(Icons.photo),
                        ),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                ),
                accountName: Text("Danilo Perez"),
                accountEmail: Text("email@email.com")),
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Dados Cadastrais"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DadosCadastraisPage()));
            },
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Termos de uso e privacidade"),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Column(
                        children: [
                          Text("Termos de uso e privacidade",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                              "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker. Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  });
            },
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (bc) => const ConfiguracoesPage()));
            },
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.numbers),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Gerador de Números"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (bc) =>
                          const NumerosAleatoriosSharedPreferencesPage()));
            },
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.numbers),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Hive"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (bc) => const NumerosAleatoriosHivePage()));
            },
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Sair"),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: Text("Meu App",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      content: Wrap(children: [
                        Text("Deseja realmente sair do aplicativo?"),
                      ]),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Não")),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text("Sim"))
                      ],
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
