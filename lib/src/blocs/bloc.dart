import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';


class Bloc extends Object with Validators {
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();


  // Getter on dart using keyword `get`

  // Changes data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Retrieve data from stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);

  // clean up function
  dispose () {
    _email.close();
    _password.close();
  }
}