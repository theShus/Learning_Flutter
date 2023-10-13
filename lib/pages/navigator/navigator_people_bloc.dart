import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_demo/pages/people_bloc/components/people_page_bloc.dart';
import 'package:learning_demo/pages/people_bloc/people_page.dart';
import 'package:learning_demo/rest_client.dart';


class SecondPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("People bloc"),
        backgroundColor: Colors.red,
      ),
      body: BlocProvider<PeoplePageBloc>( //Bloc provider ce da supply-uje okruzenje za bloc, dok u PeoplePageNew stavimo BlocBuilder
        create: (context) => PeoplePageBloc(client: RestClient()),
        child: PeoplePageNew(),
      )
    );
  }

}