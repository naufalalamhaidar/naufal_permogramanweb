import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/recipeController.dart';
import 'package:flutter_application_1/view/basket.dart';
import 'package:flutter_application_1/view/homescreen.dart';
import 'package:flutter_application_1/view/profilescreen.dart';
import 'package:flutter_application_1/view/searchscreen.dart';
import 'package:flutter_application_1/view/state.dart';
import 'package:flutter_application_1/view/studentlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 128, 0)),
      ),
      home: MyHomePage(title: "Naufal Food"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final RecipeController recipeController =  RecipeController();
  
  List widgets = [
    Homescreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  int activeIndex = 0;

  int _counter = 0;
  var name = "hello";
  final counter=0;
  String filter = "";

  Runes _smileEmoji = Runes('\u{1f600}');
  Runes _maskEmoji = Runes('\u{1f637}');
  String _emoji = "";
  


  void _incrementCounter() {
    
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      
      _counter++;
      _emoji += String.fromCharCodes(_smileEmoji);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Naufal", style: Theme.of(context).textTheme.headlineMedium, ),
              accountEmail: Text("NaufalFoodIndonesia@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pravatar.cc/100?img=3"),
              ),
            ),
            ListTile(
              title: Text("Inbox"),
              leading: Icon(Icons.inbox),
            ),
            ListTile(
              onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BasketScreen(recipeController: recipeController,)));
              },
              title: Text("My Basket "),
              leading: Icon(Icons.shopping_basket),
            ),
            ListTile(
              onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HalamanBaru()));
              },
              title: Text("Halaman Baru"),
              leading: Icon(Icons.help),
            ),
            ListTile(
              onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StudentList()));
              },
              title: Text("Student List"),
              leading: Icon(Icons.person),
            )
          ],
        ),
      ),
      persistentFooterButtons:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: (){}, 
              child: Icon(Icons.arrow_left),
            ),
            ElevatedButton(
              onPressed: (){}, 
              child: Icon(Icons.arrow_right),
            ),
          ],
        ),
      ],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeIndex,        
        fixedColor: const Color.fromARGB(255, 255, 158, 2),
        onTap: (int index) {
          setState(() {
            activeIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ]
      ),
      body: widgets[activeIndex],
      // Center(
        
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text('You have pushed  the button this many times: $name' ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //       Text(
      //         _emoji,
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
