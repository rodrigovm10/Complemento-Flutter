import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../../domain/usecases/get_user.dart';
import '../../infrastructure/repositories/user_repository_impl.dart';
import '../../infrastructure/data_sources/user_data_source.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: BlocProvider(
        create: (context) => UserBloc(
          GetUser(
            UserRepositoryImpl(
              UserDataSource('https://api.example.com'),
            ),
          ),
        ),
        child: UserPage(),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(GetUserEvent('1'));
            },
            child: const Text('Load User'),
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserInitial) {
                return const Text('Press the button to load user');
              } else if (state is UserLoading) {
                return const CircularProgressIndicator();
              } else if (state is UserLoaded) {
                return Text('User: ${state.user.name}');
              } else if (state is UserError) {
                return const Text('Failed to load user');
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
