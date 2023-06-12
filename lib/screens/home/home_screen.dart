import 'package:data_on_test/models/university_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/university_provider.dart';
import '../../utils/state/finite_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UniversityResultProvider _providerUniversity;

  @override
  void initState() {
    super.initState();
    _providerUniversity =
        Provider.of<UniversityResultProvider>(context, listen: false);
    _providerUniversity.fetchUniversityResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
      ),
      body: Consumer<UniversityResultProvider>(
        builder: ((context, provider, _) {
          switch (provider.myState) {
            case MyState.loading:
              print('university loading');
              return const Center(child: CircularProgressIndicator());

            case MyState.loaded:
              print('university loaded');

              final UniversityModel universityResult =
                  provider.universityResult;
              print('universityResult homepage');
              print(universityResult);

              // print(universityResult);
              return Text('got data');
            case MyState.failed:
              print('university failed');
              return const Center(
                child: Text('failed'),
              );
            default:
              return const SizedBox();
          }
        }),
      ),
    );
  }
}
