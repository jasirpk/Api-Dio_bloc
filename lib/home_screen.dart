import 'package:bloc_api/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'api flutter bloc',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.read<HomeBloc>().add(FetchApiEvent());
          },
          label: Text('Fetch Data')),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.isApiFetching) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: Colors.red,
              ),
            );
          }
          return Center(
            child: Container(
              // Example alignment: Align the Card to the center of its parent
              alignment: Alignment.center,
              // Example width and height: Set the size of the Card
              width: double.infinity,
              height: 200,
              child: Card(
                elevation: 10,
                color: Colors.grey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.result ?? 'No Data',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
