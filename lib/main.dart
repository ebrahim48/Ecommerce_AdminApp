import 'package:ecom_admin_new13/page/category_page.dart';
import 'package:ecom_admin_new13/page/dashboard_page.dart';
import 'package:ecom_admin_new13/page/launcher_page.dart';
import 'package:ecom_admin_new13/page/login_page.dart';
import 'package:ecom_admin_new13/page/new_product_page.dart';
import 'package:ecom_admin_new13/page/order_page.dart';
import 'package:ecom_admin_new13/page/product_details_page.dart';
import 'package:ecom_admin_new13/page/product_page.dart';
import 'package:ecom_admin_new13/page/report_page.dart';
import 'package:ecom_admin_new13/page/settings_page.dart';
import 'package:ecom_admin_new13/page/user_page.dart';
import 'package:ecom_admin_new13/providers/order_provider.dart';
import 'package:ecom_admin_new13/providers/product_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => ProductProvider()),
        ChangeNotifierProvider(
            create: (context) => OrderProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      builder: EasyLoading.init(),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName: (_) => LauncherPage(),
        LoginPage.routeName: (_) => LoginPage(),
        DashboardPage.routeName: (_) => DashboardPage(),
        ProductPage.routeName: (_) => ProductPage(),
        NewProductPage.routeName: (_) => NewProductPage(),
        ProductDetailsPage.routeName: (_) => ProductDetailsPage(),
        OrderPage.routeName: (_) => OrderPage(),
        UserPage.routeName: (_) => UserPage(),
        SettingsPage.routeName: (_) => SettingsPage(),
        ReportPage.routeName: (_) => ReportPage(),
        CategoryPage.routeName: (_) => CategoryPage(),
      },
    );
  }
}

