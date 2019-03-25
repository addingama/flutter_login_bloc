import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';


class Bloc extends Object with Validators {

  // BehaviorSubject is StreamController that keep reference to the last event, by default is broadcast stream
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();


  // Getter on dart using keyword `get`

  // Changes data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Retrieve data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);


  submit() {
    final validEmail = _email.value;
    final validPassword =_password.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  // clean up function
  dispose () {
    _email.close();
    _password.close();
  }
}