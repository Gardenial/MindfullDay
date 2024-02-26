// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mindfullday_v1/util/Tarefas.dart';
import 'package:mindfullday_v1/util/emoticon.dart';
import 'package:mindfullday_v1/util/navbar.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(134, 150, 254, 1),
      
      drawer: NavBar(),
      appBar: AppBar(
      backgroundColor: Color.fromRGBO(134, 150, 254, 1),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outlined), label: 'Adiconar Tarefa'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Calendario'
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  //Olá usuario e notificações
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Olá, (Usuario)',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '21 Jan 2024',
                            style: TextStyle(color: Colors.deepPurple[100]),
                          )
                        ],
                      ),
                      //Notificação
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(0, 255, 255, 255),
                            borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.notifications,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //Barra de Busca
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(43, 255, 255, 255),
                        borderRadius: BorderRadius.circular(22)),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Procurar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  //Como você está se sentindo hoje
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('   Como você está se sentindo hoje?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  //Emoções
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Triste
                      Column(
                        children: [
                          Emoticons(
                            emoticons: '😥',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Triste',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      //Feliz
                      Column(
                        children: [
                          Emoticons(
                            emoticons: '😁',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Feliz',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      //Pensativo(a)
                      Column(
                        children: [
                          Emoticons(
                            emoticons: '🤔',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Pensativo(a)',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      //Furioso(a)
                      Column(
                        children: [
                          Emoticons(
                            emoticons: '😡',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Furioso(a)',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Container(
              padding: EdgeInsets.all(25),
              color: Color.fromRGBO(73, 66, 228, 1),
              child: Center(
                child: Column(
                  children: [
                    // Heading Tarefas
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tarefas',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    //Lista de Tarefas
                    Expanded(
                      child: ListView(
                        children: [
                          Tarefas(
                            icon: Icons.favorite,
                            nomeTarefa: 'Tarefa 1',
                            descricaoTarefa: 'Descrição da Tarefa',
                            color: Colors.lightBlue,
                          ),
                          //ola Garden
                          Tarefas(
                            icon: Icons.earbuds,
                            nomeTarefa: 'Tarefa 2',
                            descricaoTarefa: 'Descrição da Tarefa',
                            color: Colors.orange,
                          ),
                          Tarefas(
                            icon: Icons.person,
                            nomeTarefa: 'Tarefa 3',
                            descricaoTarefa: 'Descrição da Tarefa',
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
