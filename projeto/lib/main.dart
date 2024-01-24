import 'package:flutter/material.dart';

// Onde a execução do programa começa - principal.

void main() {
  runApp(const Aplicativo()); // Roda aplicativo.
}

// Classe aplicativo (Contém características, variáveis e funções).
// Extends - extende - Herda características do Widget Stateless.
// Stateless - Toda interface é imutável após a criação.
class Aplicativo extends StatelessWidget {
  const Aplicativo({super.key}); // Classe pai.

  // Metódo que reconstrói tela.
  @override
  Widget build(BuildContext context) {
    // Widget responsável pelo design da aplicação.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Home - Tela principal - Scaffold fornece layout básico.
      home: Scaffold(
        // Appbar é a barra superior.
        appBar: AppBar(
          backgroundColor: Colors.green, // Cor de fundo da barra.
          title: const Text(
            // Colocar título - Texto na barra.
            'Flutter é divertido!', // O texto que você quer entre aspas.
            style: TextStyle(color: Colors.white), // Alterar a cor do texto.
          ),
        ),

        // Body é o corpo do app, Center vai centralizar o conteúdo.
        body: const Center(
          // Child representa que é filho do Widget Center - SizedBox - CaixaComTamanho.
          child: SizedBox(
            // ignore: sort_child_properties_last, unnecessary_const
            child: const Text(
                'Flutter foi criado pelo Google, usa a linguagem DAT',
                  style: TextStyle(               // Estilo do texto.
                    fontSize: 20,                 // Tamanho do texto.
                    fontFamily:  'arial',         // Qual fonte usar.
                  ),
                ),
            height: 300,      // Altura da caixa.
            width: 300,       // Largura da caixa.
          ),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,            // Altera a cor do botão.
          child: const Icon(Icons.add),                     // Icone do botão.
          onPressed: () {},                           // Ação quando clicar.
        ),

        // ----- Barra de Navegação inferior.
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Principal'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Negócios'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Escola'),
        ]), 

        // ----- Barra Lateral
        drawer:   Drawer(
          backgroundColor: Colors.white,
          
          // Lista dos itens do menu.
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                child: Text(
                  'Menu App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                )
              ),

              ListTile(                                     // Item do menu.
                leading: const Icon(Icons.home),            // Ícone do item do menu.
                title: const Text('Página Inicial'),        // Título do itme do menu.
                onTap: () {},                               // Ação que o botão irá executar.
              ),

              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações'),
                onTap: () {},
              ),

              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Perfil'),
                onTap: () {},
              ),

            ],
          ),
        ), 
      ),
    );
  }
}
