
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi{
 static final LocalAuthentication _auth = LocalAuthentication();

 static Future<bool> authenticate()async{
   final isAvailable=await hasBiometrics();

   if(!isAvailable) return false;
   try{
     return await _auth.authenticate(
       localizedReason: 'Scan Fingerprint to authenticate',
       options: const AuthenticationOptions(
         biometricOnly: true,
         useErrorDialogs: true,
         stickyAuth: true,
       ),
     );
   }on PlatformException catch(e){
     return false;
   }
 }
 static Future<List<BiometricType>> getBiometrics()async{
   try{
     return await _auth.getAvailableBiometrics();
   }on PlatformException catch(e){
     return <BiometricType>[];
   }
 }
 static Future<bool> hasBiometrics() async{
    try{
      final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
      final bool canAuthenticate = canAuthenticateWithBiometrics || await _auth.isDeviceSupported();
      return canAuthenticate;
    }on PlatformException catch(e){
      return false;
    }

  }

}