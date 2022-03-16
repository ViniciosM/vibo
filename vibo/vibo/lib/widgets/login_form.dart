import 'package:flutter/material.dart';
import 'package:vibo/widgets/input_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Text(
            "Usuário",
            style: TextStyle(
              fontSize: 14.0,
              color: Color.fromRGBO(138, 150, 191, 1),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          InputField(
            hintText: 'Usuário',
            suffixIcon: Icons.person,
            hideText: false,
          ),
          SizedBox(height: 10.0),
          Text(
            "Senha",
            style: TextStyle(
              fontSize: 14.0,
              color: Color.fromRGBO(138, 150, 191, 1),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          InputField(
            hintText: 'Senha',
            suffixIcon: Icons.lock,
            hideText: true,
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
