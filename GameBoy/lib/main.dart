import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:masked_text/masked_text.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final buttonColor = Color(0xFF69801D);

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/imagem/GameBoyTalaInicio.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 190.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 120,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Reproduza o som ao clicar no botão
                            int result = await audioPlayer.play('assets/audio/botaoSound.mp3');
                            if (result == 1) {
                              print('Reprodução de áudio iniciada');
                            } else {
                              print('Erro ao iniciar a reprodução de áudio');
                            }

                            // Navegar para a segunda tela (SecondScreen)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecondScreen(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(buttonColor),
                          ),
                          child: Text('Entrar'),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 120,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Reproduza o som ao clicar no botão
                            int result = await audioPlayer.play('assets/audio/botaoSound.mp3');
                            if (result == 1) {
                              print('Reprodução de áudio iniciada');
                            } else {
                              print('Erro ao iniciar a reprodução de áudio');
                            }

                            // Navegar para a terceira tela (ThirdScreen)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ThirdScreen(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(buttonColor),
                          ),
                          child: Text('Cadastrar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool _isPasswordVisible = false; // Variável para controlar a visibilidade da senha

  @override
  Widget build(BuildContext context) {
    final buttonColor = Color(0xFF69801D);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFF69801D),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFF69801D),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300,
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    fillColor: Colors.transparent,
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                width: 300,
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: !_isPasswordVisible, // Alterna a visibilidade da senha
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    fillColor: Colors.transparent,
                    filled: true,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible; // Alterna a visibilidade da senha
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 120,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    // Ação quando o botão "Entrar" for pressionado
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  child: Text('Entrar', style: TextStyle(color: buttonColor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  bool _isPasswordVisible = false; // Variável para controlar a visibilidade da senha
  String? selectedGender;
  double ageValue = 1.0;
  bool emailNotifications = false;
  bool whatsappNotifications = false;
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final buttonColor = Color(0xFF69801D);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFF69801D),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFF69801D),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      fillColor: Colors.transparent,
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      fillColor: Colors.transparent,
                      filled: true,
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      fillColor: Colors.transparent,
                      filled: true,
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      fillColor: Colors.transparent,
                      filled: true,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Gênero',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Radio<String>(
                            value: 'Masculino',
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          Text('Masculino'),
                          Radio<String>(
                            value: 'Feminino',
                            groupValue: selectedGender,
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                          Text('Feminino'),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Idade',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Slider(
                        value: ageValue,
                        min: 1,
                        max: 100,
                        onChanged: (value) {
                          setState(() {
                            ageValue = value;
                          });
                        },
                        divisions: 99,
                        label: ageValue.toStringAsFixed(0),
                      ),
                      Text('Idade: ${ageValue.toStringAsFixed(0)} anos'),
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Notificações',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text('E-mail'),
                          Switch(
                            value: emailNotifications,
                            onChanged: (value) {
                              setState(() {
                                emailNotifications = value;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text('WhatsApp'),
                          Switch(
                            value: whatsappNotifications,
                            onChanged: (value) {
                              setState(() {
                                whatsappNotifications = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 120,
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      // Ação quando o botão "Cadastrar" for pressionado
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: Text('Cadastrar', style: TextStyle(color: buttonColor)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}