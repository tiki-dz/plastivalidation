import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plastivalidation/views/widget.home.dart';
import 'package:plastivalidation/views/widget.views.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';
/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    DevicePreview(
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MyApp(), // Wrap your app
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ),      
            backgroundColor: Colors.white),
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        home:
        GetStorage().read('token') == null ?   LogInWidget()  : HomeWidget()
      );
    });
  }
}
