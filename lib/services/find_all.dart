import 'package:estrutura_dados_pbl4/repositories/person_repository.dart';

import '../models/person.dart';

class PersonService {
  final personRepository = PersonRepository();
  Future<List<Person>> findAll() async {
    final persons = await personRepository.getPersons();
    return persons;
  }
}
