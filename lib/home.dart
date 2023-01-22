import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import 'localAuthApi.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final LocalAuthentication auth = LocalAuthentication();
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Finger Print'),),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customButton(onClick:()async{
              var isAvailable= await LocalAuthApi.hasBiometrics();
              var list= await LocalAuthApi.getBiometrics();
              print(list);
            }, title:'Check', icon: const Icon(Icons.find_in_page, size: 30,)),
            customButton(onClick:()async{
              final isAuthenticated=await LocalAuthApi.authenticate();
              if(isAuthenticated){
                print('Authenticated');
              }
            }, title:'Finger', icon: const Icon(Icons.fingerprint, size: 30,)),
          ],
        ),
      ),
    );
  }


  Widget customButton({required VoidCallback onClick, required String title, required Icon icon}) {

    return IconButton(onPressed: onClick, icon: icon,);
  }
}
