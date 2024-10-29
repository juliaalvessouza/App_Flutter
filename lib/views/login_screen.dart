import 'package:app_flutter/constants/app_styles.dart';
import 'package:app_flutter/constants/assets.dart';
import 'package:app_flutter/views/home_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String? email, senha;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: AppStyles.bigTitle),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.store),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Digite seu email",
                          labelText: "Email"),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Digite um email válido";
                        }

                        return null;
                      },
                      onSaved: (String? newValue) {
                        email = newValue;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Digite a sua senha",
                          labelText: "Senha"),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Digite uma senha";
                        }

                        if (value.length < 6) {
                          return "A senha precisa ter 6 ou mais caracteres";
                        }

                        return null;
                      },
                      onSaved: (String? newValue) {
                        senha = newValue;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final form = _formKey.currentState;

                        if (form == null || !form.validate()) {
                          print("não validou");
                          return;
                        }
                        form.save();

                        print(email);
                        print(senha);

                        // email e senha estão ok
                        //com o .push vc volta a tela anterior.
                        //com o .pushReplacement vc não volta a tela anterior.
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                      },
                      child: const Text("Login")),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const SizedBox(
                      width: 8,
                    ),
                    const Text("Não tem conta?"),
                    InkWell(
                      onTap: () {
                        print("Clique no texto de criar a conta");
                      },
                      child: const Text(
                        "Crie a sua conta.",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ])
                ],
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
