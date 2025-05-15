import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:uber_eats_restaurant/controller/provider/restaurant_register_provider/restaurant_register_provider.dart';
import 'package:uber_eats_restaurant/view/sign_in_logic_screen/sign_in_logic_screen.dart';

void main() {
  runApp(const UberEats());
}

class UberEats extends StatelessWidget {
  const UberEats({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<RestaurantRegisterProvider>(
            create: (_) => RestaurantRegisterProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          home: SignInLogicScreen(),
        ),
      );
    });
  }
}

/*

return Sizer(
      builder: (context, _, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          home: AccountScreen(),
        );
      },
    );

 */
