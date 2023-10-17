import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_demo/pages/people_bloc/components/people_page_bloc.dart';
import 'package:learning_demo/pages/people_bloc/bloc_people_page.dart';
import 'package:learning_demo/rest_client.dart';


class SecondPeoplePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("People recycler BLOC"),
        backgroundColor: Colors.blueGrey,
      ),
      body: BlocProvider<PeoplePageBloc>( //Bloc provider ce da supply-uje okruzenje za bloc, dok u PeoplePageNew stavimo BlocBuilder
        create: (context) => PeoplePageBloc(client: RestClient()),
        child: PeoplePageNew(),
      )
    );
  }
}