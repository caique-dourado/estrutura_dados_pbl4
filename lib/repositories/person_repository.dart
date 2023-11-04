import 'dart:convert';

import 'package:estrutura_dados_pbl4/models/person.dart';
import 'package:http/http.dart' as http;

class PersonRepository {
  Future<List<Person>> getPersons() async {
    final personResponse =
        await http.get(Uri.parse("http://ip_sua_maquina:8080/persons"));
    final personList = jsonDecode(personResponse.body);
    final findAll = personList
        .map<Person>((personMap) => Person.fromMap(personMap))
        .toList();

    return findAll;
  }
}
