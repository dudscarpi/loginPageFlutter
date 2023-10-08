import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/linguagens_reository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/service/app_storage_service.dart';
import 'package:trilhaapp/shared/widgets/text-label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;

  var nivelRepository = NivelRepository();
  var linguegensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  List<String> linguagensSelecionadas = [];
  var nivelSelecionado = "";
  double salarioEscolhido = 0;
  int tempoExpeciencia = 0;
  bool salvando = false;
  AppStorageService storage = AppStorageService();
  final String CHAVE_DADOS_CADASTRAIS_NOME = "CHAVE_DADOS_CADASTRAIS_NOME";
  final String CHAVE_DADOS_CADASTRAIS_NASCIMENTO =
      "CHAVE_DADOS_CADASTRAIS_NASCIMENTO";
  final String CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA =
      "CHAVE_DADOS_CADASTRAIS_NIVEL_EXPERIENCIA";
  final String CHAVE_DADOS_CADASTRAIS_LINGUAGENS =
      "CHAVE_DADOS_CADASTRAIS_LINGUAGENS";
  final String CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA =
      "CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA";
  final String CHAVE_DADOS_CADASTRAIS_SALARIO =
      "CHAVE_DADOS_CADASTRAIS_SALARIO";

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguegensRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    nomeController.text = await storage.getDadosCadastraisNome();
    dataNascimentoController.text =
        await storage.getDadosCadastraisDataNascimento();

    if (dataNascimentoController.text.length > 0) {
      dataNascimento = DateTime.parse(dataNascimentoController.text);
    }
    nivelSelecionado = await storage.getDadosCadastraisNivelExperiencia();
    linguagensSelecionadas = await storage.getDadosCadastraisLinguagens();
    tempoExpeciencia = await storage.getDadosCadastraisTempoExperiencia();
    salarioEscolhido = await storage.getDadosCadastraisSalario();
    setState(() {});
  }

  List<DropdownMenuItem<int>> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem<int>>[];

    for (var i = 0; i <= 50; i++) {
      itens.add(DropdownMenuItem(
        child: Text(i.toString()),
        value: i,
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meus Dados")),
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: salvando
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    const TextLabel(
                      texto: "Nome",
                    ),
                    TextField(
                      controller: nomeController,
                    ),
                    const TextLabel(texto: "Data de Nascimento"),
                    TextField(
                      controller: dataNascimentoController,
                      readOnly: true,
                      onTap: () async {
                        var data = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000, 1, 1),
                            firstDate: DateTime(1900, 5, 20),
                            lastDate: DateTime(2023, 10, 24));
                        if (data != null) {
                          dataNascimentoController.text = data.toString();
                          dataNascimento = data;
                          print(data);
                        }
                      },
                    ),
                    const TextLabel(
                      texto: "Nivel de Experiência",
                    ),
                    Column(
                      children: niveis
                          .map((nivel) => RadioListTile(
                              dense: true,
                              title: Text(nivel.toString()),
                              selected: nivelSelecionado == nivel,
                              value: nivel.toString(),
                              groupValue: nivelSelecionado,
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  nivelSelecionado = value.toString();
                                });
                              }))
                          .toList(),
                    ),
                    const TextLabel(texto: "Linguagens Preferidas"),
                    Column(
                      children: linguagens
                          .map((linguagem) => CheckboxListTile(
                                dense: true,
                                title: Text(linguagem),
                                value:
                                    linguagensSelecionadas.contains(linguagem),
                                onChanged: (bool? value) {
                                  if (value!) {
                                    setState(() {
                                      linguagensSelecionadas.add(linguagem);
                                    });
                                  } else {
                                    setState(() {
                                      linguagensSelecionadas.remove(linguagem);
                                    });
                                  }
                                },
                              ))
                          .toList(),
                    ),
                    const TextLabel(texto: "Tempo de Experiência"),
                    DropdownButton(
                        value: tempoExpeciencia,
                        isExpanded: true,
                        items: returnItens(50),
                        onChanged: (value) {
                          setState(() {
                            tempoExpeciencia = int.parse(value.toString());
                          });
                        }),
                    TextLabel(
                        texto:
                            "Pretenção Salarial. R\$ ${salarioEscolhido.round().toString()}"),
                    Slider(
                        min: 0,
                        max: 10000,
                        value: salarioEscolhido,
                        onChanged: (double value) {
                          setState(() {
                            salarioEscolhido = value;
                          });
                        }),
                    TextButton(
                        onPressed: () async {
                          setState(() {
                            salvando = false;
                          });

                          if (nomeController.text.trim().length < 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("O nome deve ser preenchido"),
                              ),
                            );
                          } else if (dataNascimento == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Data de nascimento inválida"),
                              ),
                            );
                          } else if (nivelSelecionado.trim() == '') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("O nível deve ser selecionado"),
                              ),
                            );
                          } else if (linguagensSelecionadas.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Deve ser selecionada ao menos uma linguagem"),
                              ),
                            );
                          } else if (tempoExpeciencia == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Deve ter ao menos 1 ano de experiência em uma das linguagens"),
                              ),
                            );
                          } else if (salarioEscolhido == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "A pretensão salarial deve ser maior que zero"),
                              ),
                            );
                          }

                          await storage
                              .setDadosCadastraisNome(nomeController.text);
                          await storage.setDadosCadastraisDataNascimento(
                              dataNascimento!);
                          await storage.setDadosCadastraisNivelExperiencia(
                              nivelSelecionado);
                          await storage.setDadosCadastraisLinguagens(
                              linguagensSelecionadas);
                          await storage.setDadosCadastraisTempoExperiencia(
                              tempoExpeciencia);
                          await storage
                              .setDadosCadastraisSalario(salarioEscolhido);

                          setState(() {
                            salvando = true;
                          });
                          Future.delayed(Duration(seconds: 3), () {
                            setState(() {
                              salvando = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Dados salvos com sucesso!")));

                            setState(() {
                              salvando = false;
                            });
                            Navigator.pop(context);
                          });
                        },
                        child: Text("Salvar"))
                  ],
                )),
    );
  }
}
