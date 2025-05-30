import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voy/pages/splash_screen.dart';

import 'features/profile/bloc/profile_bloc.dart';
import 'features/profile/mock/mock_api_request.dart';
import 'features/profile/repository/profile_repository.dart';
import 'features/profile_tiles/bloc/profile_verification_bloc/drivers_verification_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider<ProfileBloc>(
            create: (context) {
              final profileApiService = ProfileApiService();
              final profileRepository = ProfileRepository(apiService: profileApiService);
              return ProfileBloc(profileRepository: profileRepository);
            },
          ),
          BlocProvider<DriversVerificationBloc>(
            create: (context) => DriversVerificationBloc(),
          ),
        ],
        child: MyApp()
    ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //show splash screen
      home: SplashScreen(),
    );
  }
}
