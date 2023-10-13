import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_demo/pages/people_bloc/components/people_page_event.dart';
import 'package:learning_demo/pages/people_bloc/components/pople_page_state.dart';
import '../../../rest_client.dart';

class PeoplePageBloc extends Bloc<PeoplePageEvent, PeoplePageState>{

  final RestClient client;

  PeoplePageBloc({required this.client}): super(PeoplePageInitial()){
    on((event, emit) async {
      emit(PeoplePageLoading());
      final peopleList = await client.getPeople(25);
      emit(PeoplePageLoaded(people: peopleList));
    });
  }

}