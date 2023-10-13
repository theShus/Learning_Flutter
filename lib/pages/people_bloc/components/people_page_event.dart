import 'package:equatable/equatable.dart';

abstract class PeoplePageEvent extends Equatable{//Equatable sluzi da optimalnije proverava == , tako da ne moramo mi da pravimo logiku i brze je
  const PeoplePageEvent();

  @override
  List<Object> get props => [];//ovde se kaze sta ce da Equatable proverava kada se pozove ==, trenutno u [] ne proverava nista, ali u people page state ima primer sa
}

class PeoplePageLoadEvent extends PeoplePageEvent {}