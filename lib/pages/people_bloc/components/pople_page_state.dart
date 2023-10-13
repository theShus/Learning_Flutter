import 'package:equatable/equatable.dart';

import '../../../models/person.dart';

abstract class PeoplePageState extends Equatable {
  const PeoplePageState();

  @override
  List<Object> get props => [];
}

class PeoplePageInitial extends PeoplePageState {}

class PeoplePageLoading extends PeoplePageState {}

class PeoplePageLoaded extends PeoplePageState {

  final List<Person> people;

  PeoplePageLoaded({required this.people});

  @override
  List<Object> get props => [people];//ovde je definisana equitable funkcija, tj sta se proverava (proverava poredjenja people liste)
}
