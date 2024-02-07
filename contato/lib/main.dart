// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const Contato());
}

class Contato extends StatelessWidget {
  // Necessário para inicializar a widget, passar para classe pai.
  const Contato({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ), 
      home: const Principal(title: 'Contato Pessoal'),
    );
  } 
}

class Principal extends StatefulWidget {
  // Passa parâmetros informações para dentro dessa classe.
  const Principal ({super.key, required this.title});
  final String title;

  // Cria um estado que vai se referir a classe _PrincipalEstado.
  @override
  State<Principal> createState() => _PrincipalEstado();
}
// Classe _PrincipalEstado herdando o Estado - Estado: vai ficar atualizando.
class _PrincipalEstado extends State<Principal> {

  final foto = const CircleAvatar(
    backgroundImage: NetworkImage(
      "link da foto"),
    radius: 150,
  );
  final nome = const Text(
    'Ana',
    style: TextStyle(fontSize: 30),
    textAlign: TextAlign.center,
  );
  final obs = const Text(
    'Programador Full Stack Senac',
    style: TextStyle(fontSize: 20, color: Colors.blue),
    textAlign: TextAlign.center,
  );

 final email = IconButton(
   icon: const Icon(Icons.email),
   color: Colors.blue,
   onPressed: () {
      launchUrl(Uri(
        scheme: 'mailto', 
        path: 'dams.5930@aluno.pr.senac.br',
        queryParameters: {
          'subject': 'Assunto do email',
          'body': 'Corpo do email',
        },
      ));
    },
  );

  final telefone = IconButton(
    icon: const Icon(Icons.phone),
    color: Colors.blue,
    onPressed: () {
      launchUrl(Uri(scheme: 'tel', path: '+554499887766'));
    },
  );

  final sms = IconButton(
    color: Colors.blue,
    icon: const Icon(Icons.sms),
    onPressed: () {
      launchUrl(Uri(scheme: 'tel', path: '+554499887766'));
    },
  );

  final site = IconButton(
    color: Colors.blue,
    icon: const Icon(Icons.open_in_browser),
    onPressed: () {
      launchUrl(Uri.parse(
        'https:' ));
    },
  );

  final whatsapp = IconButton(
    color: Colors.blue, 
    icon: const Icon(Icons.wechat),
    onPressed: () {
      launchUrl(Uri.parse('https://api.whatsapp/' ));
    },
  );

  
  final mapa = IconButton(
    color: Colors.blue, 
    icon: const Icon(Icons.map),
    onPressed: () {
      launchUrl(Uri.parse('' ));
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aplicativo de Contato',
         style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        leading: IconButton( 
          icon: Icon(Icons.account_circle, color: Colors.white),
        onPressed: () {},
        ),
      ),

      // Organizar coluna.
      body: Column(
        // Alinhar conteúdo no centro - acima/baixo.
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          foto, nome, obs,
          // Criando linha.

          Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
            email, telefone, sms, site, whatsapp, mapa,
           ],
           // Botões do aplicativo.
          ),
        ],
      ),
    );
  }
  
  static void launchUrl(Uri uri) {}
}