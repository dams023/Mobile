import 'dart:async';

import 'package:flutter/material.dart';

//Método principal - o primeiro a ser chamado para iniciar.
void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatefulWidget{
  // Construção de chave, ajuda o Flutter a gerenciar as atualizações de tela.
  // A chave Key é passada para o construtor da superClasse. 
  const Aplicativo({Key? key}) : super(key:key);

  // Serve para indicar como criar e associar um estado/alteração - Atualiza interface.
  // State - representa os dados mutáveis. 
  // Atualiza a tela sempre que houver alterações.
  @override
  State<Aplicativo> createState() => _EstadoAplicativo();
}

// "_" na classe indica que a classe só pode ser acessada neste aplicativo.
// Estado aplicativo herda as caracteristicas da classe State que está vinculada a aplicativo. 
class _EstadoAplicativo extends State<Aplicativo> {
  // Variáveis.
  int contador1 = 0;
  int contador2 = 0;
  int _tempo = 60; 
  late Timer _timer;
  bool _clique = true;    // Boolean - verdadeiro, ou falso.
  Color cor1 = Colors.black;
  Color cor2 = Colors.black;
  double posicao = 0;
  double largura = 100;
  double altura = 100;

  void movimentar() {
    setState(() {
      if (contador1 > contador2) {
        // Imagem fica na esquerda.
        posicao = 50.0;
      } else if (contador2 > contador1) {
        // Imagem fica na direita.
        posicao = MediaQuery.of(context).size.width - 150.0;
      } else {
        // Personagem no meio.
        posicao = MediaQuery.of(context).size.width / 2 - 50;
      }
    });
  }

  // Inicia o que estiver dentro, antes mesmo de carregar a tela - inicia o timer.
  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }
  
  // Cancelar timer - dispose - limpa todos os recursos.
  void dispose() {
    _timer.cancel();
    super.dispose;
  }

  void _iniciarTimer() {
    // Timer.periodic executa uma função a cada segundo.
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Se o tempo for < que zero, tempo diminui 1 (--).
      setState(() {
        if(_tempo > 0 ) {
          _tempo--;
        } else {
          _timer.cancel;
          _clique = false;
        }
      });
    });
  }

    void mudarCor() {
      if (contador1 > contador2) {
        cor1 = Colors.red;
        cor2 = Colors.black;
      } else if (contador2 > contador1) {
        cor1 = Colors.black;
        cor2 = Colors.red;
      } else {
        cor1 = Colors.blue;
        cor2 = Colors.blue;
      }
    }

  void _reiniciar() {
    // setState - Comunica ao flutter que houve alteração, atualiza toda a tela.
    setState(() {
      contador1 = 0;
      contador2 = 0;
      _tempo = 60;
      _clique = true;
    });
    _timer.cancel();
    _iniciarTimer();
  }
  
  // Construção do aplicativo - build.
  @override
  Widget build(BuildContext context) {
    mudarCor();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text(
            'Jogo Contador', 
            style: TextStyle(color: Colors.white),
            ),
        ),

        // Corpo do meu aplicativo.
        // Center - centralizar esquerda/direita
        body: Stack(
        children: [
        Center(
          // Column - organizar tudo em colunas. - mainAxiss - centralizar acima/abaixo.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // Representa os filhos do widget column. 
            children: [
              Text(
                'Contador 1: $contador1 ', 
                style: TextStyle(fontSize: 30, color: cor1),
              ),
              SizedBox(height: 20,),
              Text(
                'Contador 2: $contador2',
                style: TextStyle(fontSize: 30, color: cor2,),
              ),
              SizedBox(height: 30),
              Text(
                'Tempo restante: $_tempo segundos', 
                style: TextStyle(fontSize: 30),
              ),
            ],
          ), 
        ),
        AnimatedPositioned(
           duration: Duration(milliseconds: 500),
           bottom: 100.0,
           left: posicao,
           curve: Curves.easeInOut,
           child: Image.network(
            'https://art.pixilart.com/1cf51a4d4f0cea2.png', 
            width: 100, 
            height: 100,
            ),
          ),
         ],
        ),

        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              // Espaçamento interno ao redor do Widget - EdgetInsetsOnly só um lado.
              padding: const EdgeInsets.only(left: 60.0), 
              // Colocando o botão flutuante.
              child: FloatingActionButton(
                // onPressed: _clique ? (){ setState(() { contador1++; }); } : null,
                onPressed: () {
                  // SInaliza que houve mudança, para atualizar a tela.
                  setState(() {
                    // Adicionar +1 na variável contador.
                    if (_clique == true) {
                      contador1++;
                      movimentar();
                    }
                  });
                },
                tooltip: 'Incrementar Contador 1',
                child: Icon(Icons.add),
              ),
            ),
            FloatingActionButton.large(
              onPressed: _reiniciar,
              tooltip: 'Zerar Contagem',
              child: Icon(Icons.refresh),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 20.00),
              child: FloatingActionButton(
                onPressed: (){ 
                setState(() {
                    if (_clique == true) {
                      contador2++;
                      movimentar();
                    }
                });},
                tooltip: 'Incrementar Contador 2',
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}