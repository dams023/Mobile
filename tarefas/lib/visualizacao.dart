import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarefas/controle_tarefa.dart';
import 'package:tarefas/modelo_tarefa.dart';

// Função principal, executa em primeiro lugar.
void main() {
  runApp((Principal()));
}

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Change notifier liga a visualização ao controle tarefa.
    // Quando houver alguma alteraçãono controle, altera a tela.
    return ChangeNotifierProvider(
       create: (context) => Controle_tarefa(),
       child: MaterialApp( 
        title: 'App de tarefas',
        home: telaTarefas(),
        debugShowCheckedModeBanner: false,

       ),
    );
  }
}

class telaTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: const Text(
          'App de tarefas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: listaTarefas(),

      // ignore: prefer_const_constructors
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          abrirJanelaCadastro(context);
          //Provider.of<Controle_tarefa>(context, listen: false).adicionar('teste');
        },
        child: const Icon(Icons.add),
      ),   
    );
  }
  void abrirJanelaCadastro(BuildContext context) { 
    // Usado para controlar o textfiled(campo de inserção de texto editavél).
    TextEditingController tarefaControle = TextEditingController();

    // Exibir a uma janela.
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Adicionar Tarefa'),
            content: TextField(
             controller: tarefaControle,
              decoration: InputDecoration(labelText: 'Titulo de tarefa'),
            ),

            actions: <Widget>[
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }, 
                child: Text('Cancelar'),
                ),

                TextButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                  ),
                  onPressed: () { 
                    Provider.of<Controle_tarefa>(context, listen : false)
                        .adicionar(tarefaControle.text);
                    Navigator.pop(context);
                  },
                  child: Text('Adicionar', style: TextStyle(color:Colors.white)),
                ),
            ],
          );
       },
    );
  }   
}

class listaTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context ) {
    // Para fazer algo com o controle_tarefa.
    return Consumer<Controle_tarefa> (
      builder: (context, controle_tarefa, child) {
        // Constrói listas longas ou infinitas de acordo com a demanda.
        return ListView.builder(
          // Informando qual será o tamanho da lista.
          itemCount: controle_tarefa.tarefas.length,
          // Constrói um item da lista por vez .
          itemBuilder: (context, index) {
            Modelo_tarefa modelo_tarefa = controle_tarefa.tarefas[index];
            return ListTile(
              title: Text(modelo_tarefa.titulo),
              subtitle: Text(index.toString()),
              leading: Checkbox( 
                checkColor: Colors.white,
                activeColor: Colors.green,
                hoverColor: Colors.lightBlue,
                value: modelo_tarefa.completa,
                onChanged: (value) {
                  Provider.of<Controle_tarefa>(context, listen: false).concluir(index);
                },
              ),
              
              trailing: IconButton( 
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  Provider.of<Controle_tarefa>(context, listen: false).remover(index);
                },
              ),
            );
          }, 
        );
      },
    );
  }
}