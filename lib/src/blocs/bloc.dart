import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Validators{
  final _emailControler = BehaviorSubject<String>();
  final _passwordControler = BehaviorSubject<String>();

  // add data to stream
  Stream<String> get email => _emailControler.stream.transform(validateEmail);
  Stream<String> get password => _passwordControler.stream.transform(validatePassword);
  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (e, p) => true);
    

  // change data 
Function(String) get changeEmail => _emailControler.sink.add;
Function(String) get changePassword => _passwordControler.sink.add;

submit(){
  final validEmail = _emailControler.value;
  final validPassword = _passwordControler.value;

  print("the email $validEmail is valid and the password $validPassword is valid");
}

dispose(){
  _emailControler.close();
  _passwordControler.close();
 }
}

