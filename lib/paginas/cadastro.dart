// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mindfullday_v1/login_page.dart';
import 'package:mindfullday_v1/util/textfield.dart';


class Cadastro extends StatelessWidget {
  Cadastro({super.key});

  final nomeController = TextEditingController();
  final senhaController = TextEditingController();
  final teleController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const logo = "assets/imagens/logo.png";
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(134, 150, 254, 1),
        body: ListView(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  //MediaQuery e um metodo de pegar o tamanho do dispositivo
                  maxHeight: MediaQuery.of(context).size.height,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/imagens/bg-login.png'),
                    fit: BoxFit.cover,
                    opacity: 0.5,
                    
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          const Image(
                            image: AssetImage(logo),
                            width: 266,
                          ),
                          Text(
                            'Cadastre-se!!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Campotexto(
                        controller: nomeController,
                        hintText: 'Nome',
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Campotexto(
                          controller: senhaController,
                          hintText: 'Senha',
                          obscureText: true
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Campotexto(
                          controller: teleController,
                          hintText: 'Telefone',
                          obscureText: false
                        ),
                      SizedBox(
                        height: 10
                      ),
                      Campotexto(
                          controller: emailController,
                          hintText: 'Email',
                          obscureText: false
                        ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                            child: Text('Cadastrar'),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                            child: Text('Voltar'),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}