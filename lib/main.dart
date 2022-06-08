import 'package:flutter/material.dart';
import 'language_change_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) => LanguageChangeProvider(),
      child: Builder(
      builder: (context) =>
        MaterialApp(
          locale: Provider.of<LanguageChangeProvider>(context, listen: true)
              .currentLocale,
          localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''),
                Locale('de', ''),
                Locale('ru', ''),
              ],

          title: 'Localization',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: "/",
          routes: {
            "/": (context)=> const MyHomePage(),
          },
        ),
      
    )
      );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      var translation = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(translation.title, style: const TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
      ),
      actions: [
          TextButton(
            onPressed: () {
              context.read<LanguageChangeProvider>().changeLocale("en");
            },
            child: const Text('🇬🇧')
          ),
          TextButton(
              onPressed: () {
                context.read<LanguageChangeProvider>().changeLocale("de");
              },
              child: const Text('🇩🇪')
          ),
          TextButton(
              onPressed: () {
                context.read<LanguageChangeProvider>().changeLocale("ru");
              },
              child: const Text('🇷🇺')
          ),
        ],),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            heroCard(context,
            translation.winnie,
            translation.date(DateTime.parse("2022-01-17")),
            translation.honey(5),
            translation.manufacturer("\"Bearhoney\""),
            translation.itemTotal(50),//'3 Jars - USD 15'
            'https://www.disneyclips.com/images/images/winnie-the-pooh26.png',
          ),

            heroCard(context,
            translation.piglet,
            translation.date(DateTime.parse("2022-03-12")),
            translation.honey(1),
            translation.manufacturer("\"Lindenhoney\""),
            translation.itemTotal(10),//'1 Jar - USD 10'
            'https://i.pinimg.com/564x/b1/d5/17/b1d517e5df335241d647870f2795d692.jpg',
          ),

            heroCard(context,
            translation.tigger,
            translation.date(DateTime.parse("2022-05-22")),
            translation.honey(2),
            translation.manufacturer("\"Acaciahoney\""),
            translation.itemTotal(20),//'3 Jars - USD 15'
            'https://www.disneyclips.com/images/images/tigger-heart.png',
          ),
          ],
        ),
      
    );
  }

}



// Widget Card

Widget heroCard(BuildContext context,
        String name, String date, String honey, String manufacturer, String total, String img ){

  return  Card(
    elevation: 5,
    shadowColor: const Color(0xFFFF7F50),
    child: Padding( 
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.network(img),
          ),
          const SizedBox( width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, 
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold) ),
              Text(date),
              Text("$honey $manufacturer"),
              Text(total),
            ],
          ),
        ],
      ),
      ),
  );
}
