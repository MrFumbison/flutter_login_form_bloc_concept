
import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(context){
    final bloc = Provider.of(context);

    return Container(
      color: Color.fromARGB(255, 250, 251, 251),
      margin: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          Container(margin: const EdgeInsets.only(bottom: 25.0)),
          passwordFiels(bloc),
          Container(margin: const EdgeInsets.only(bottom: 30.0)),
          submitButton(bloc),
        ],
      ),
    );
  }

  emailField(Bloc bloc){
    return StreamBuilder(
      stream: bloc.email, 
      builder: (context, snapshot){
          return TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Email Address',
            hintText: 'abcd@dhfhf.com',
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
        );
      }
    );
  }

passwordFiels(Bloc bloc){
  return StreamBuilder(
    stream: bloc.password, 
    builder: (context, snapshot){
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: false,
          decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: 'Password',
          hintText: 'password',
          errorText: snapshot.hasError ? snapshot.error.toString() : null,
      ),
    );
      }
    );
  }

  submitButton(Bloc bloc){
    return StreamBuilder(
      stream: bloc.submitValid, 
      builder: (context, snapshot){
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, 
              backgroundColor: Colors.greenAccent,
              minimumSize: const Size(110, 55),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onPressed: snapshot.hasData ? bloc.submit : null,
            child: const Text('login'),
             
            );
      },
    );  
  }
  

}