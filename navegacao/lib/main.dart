import 'package:flutter/material.dart';

// Método principal que inicia a aplicação.
void main() {
  runApp(Aplicativo());                 // runApp - roda app - chama a classe Aplicativo.
}

// A classe aplicativo vai herdar Stateless - não tem alteração dentro da tela.
class Aplicativo extends StatelessWidget {
  
  // Widgete build vai construir a aplicação.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(                           // Oferece padrão de design e componentes.
      debugShowCheckedModeBanner: false,
      home: Pagina1(),                            // Home - representa tela inicial - a primeira que abre.
    );
  }
}

class Pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(                              // Fornece estruturas básicas.
      appBar: AppBar(                             // Barra de cima.
        title: Text('Página 1'),                  // Texto dentro da barra
        backgroundColor: Colors.blue,           // Cor da barra.
      ),
        //Body - Corpo - Center - Centralizar(direita-esquerda).
        body: Center(   
          // Organize em sentido coluna.                          
        child: Column(
          // Centraliza sentido(acima-abaixo).
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('data:image/jpeg;base64,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', width: 300, height: 300,),
            const Text('Bem-vindo a tela inicial!')
          ],
         ),
      ),
    );
  }
  
} 