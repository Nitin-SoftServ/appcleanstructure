import 'package:appstructureapp/navigation/routes.dart';
import 'package:appstructureapp/screens/home_binding.dart';
import 'package:appstructureapp/screens/home_screen.dart';
import 'package:get/get.dart';

class Nav{
 static List<GetPage> routes = [

   GetPage(
       name: Routes.home,
       page: ()=>HomeScreen(),
       binding: HomeBinding()
   )

 ];
}