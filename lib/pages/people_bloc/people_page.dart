import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_demo/pages/people_bloc/components/people_page_bloc.dart';
import 'package:learning_demo/pages/people_bloc/components/people_page_event.dart';
import 'package:learning_demo/pages/people_bloc/components/pople_page_state.dart';
import 'package:learning_demo/recycler_items/person_item.dart';

class PeoplePageNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PeoplePageBloc, PeoplePageState>(
        builder: (BuildContext context, state) {
          if (state is PeoplePageLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (state is PeoplePageLoaded)
            return ListView(
              children: state.people.map((person) => PersonItem(person: person)).toList(),
            );
          else
            return Center(
              child: OutlinedButton(
                child: Icon(Icons.refresh),
                onPressed: () => context.read<PeoplePageBloc>().add(PeoplePageLoadEvent()), //context.read<CounterBloc>().add(NumberDecreaseEvent()); jos jedan primer
              ),
            );
        },
      ),
    );
  }
}
