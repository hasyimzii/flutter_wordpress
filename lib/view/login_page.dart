import 'package:flutter/material.dart';

import '../widget/scaffold_theme.dart';
import '../widget/text_field_input.dart';
import '../widget/submit_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController username = TextEditingController();
    final TextEditingController password = TextEditingController();

    return ScaffoldTheme(
      title: 'Login Page',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFieldInput(
                obscureText: false,
                label: 'Username',
                text: username,
                validator: (String? value) {
                  if (value?.isEmpty ?? true) return 'required';
                },
              ),
              const SizedBox(height: 15),
              TextFieldInput(
                obscureText: true,
                label: 'Password',
                text: password,
                validator: (String? value) {
                  if (value?.isEmpty ?? true) return 'required';
                },
              ),
              const SizedBox(height: 15),
              SubmitButton(
                title: 'Login',
                icon: Icons.send,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
