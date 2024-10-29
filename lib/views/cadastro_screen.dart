import 'package:app_flutter/constants/app_styles.dart';
import 'package:app_flutter/constants/assets.dart';
import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  const CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String? email, senha, nome;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro', style: AppStyles.bigTitle),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(AppAssets.loja),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Digite seu nome",
                    labelText: "Nome"),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Digite o seu nome";
                  }

                  return null;
                },
                onSaved: (String? newValue) {
                  nome = newValue;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                    print("A senha precisa ter 6 ou mais caracteres");
                  }

                  return null;
                },
                onSaved: (String? newValue) {
                  senha = newValue;
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  final form = _formKey.currentState;

                  if (form == null || !form.validate()) {
                    print("não validou");
                    return;
                  }
                  form.save();

                  print(nome);
                  print(email);
                  print(senha);
                },
                child: const Text("Cadastrar")),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                width: 8,
              ),
              const Text("Já tem conta?"),
              InkWell(
                onTap: () {
                  print("Faça seu Login.");
                },
                child: const Text(
                  "Faça seu Login.",
                  style: TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.bold),
                ),
              )
            ]),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
