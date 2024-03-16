// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:azkar_application_/Presentation/UI/Azan/azan_screen.dart';
import 'package:azkar_application_/Presentation/UI/Azkar/azkar_category_screen.dart';
import 'package:azkar_application_/Presentation/UI/Qibla/qiblah_screen.dart';
import 'package:azkar_application_/Presentation/UI/Sebha/sebha_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    AzanPage(),
    AzkarCategoryPage(),
    QiblahPage(),
    SebhaPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // final Widget pageName;
  // List<CategoryModel> Category = [
  //   CategoryModel(
  //     name: 'الأذكار',
  //     icon: 'assets/images/quran.png',
  //     pageName: AzkarCategoryPage(),
  //   ),
  //   CategoryModel(
  //     name: 'مواعيد الصلاة',
  //     icon: 'assets/images/praying.png',
  //     pageName: AzanPage(),
  //   ),
  //   CategoryModel(
  //     name: 'القبلة',
  //     icon: 'assets/images/qibla.png',
  //     pageName: QiblahPage(),
  //   ),
  //   CategoryModel(
  //     name: 'السبحة',
  //     icon: 'assets/images/arabic.png',
  //     pageName: SebhaPage(),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.fill)),
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
//
                  label: 'مواقيت الصلاة',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'أذكار',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: 'القبلة',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_repair_service),
                  label: 'السبحة',
                ),
              ],
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.blueGrey,
              selectedItemColor: Colors.blue,
              onTap: _onItemTapped,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: _screens[_selectedIndex],

        // Padding(
        //   padding: const EdgeInsets.all(30.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       const Spacer(
        //         flex: 1,
        //       ),
        //       const Text(
        //         'حصن المسلم',
        //         style: TextStyle(
        //           fontFamily: 'Tajawal',
        //           fontSize: 35,
        //           color: Color(0xff87854f),
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Expanded(
        //         flex: 2,
        //         child: GridView.builder(
        //             itemCount: Category.length,
        //             gridDelegate:
        //                 const SliverGridDelegateWithFixedCrossAxisCount(
        //                     crossAxisCount: 2,
        //                     crossAxisSpacing: 25,
        //                     mainAxisSpacing: 25),
        //             itemBuilder: (context, index) {
        //               return GestureDetector(
        //                 onTap: () {
        //                   Navigator.push(context,
        //                       MaterialPageRoute(builder: (context) {
        //                     return Category[index].pageName;
        //                   }));
        //                 },
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(20),
        //                     color: Colors.black12,
        //                   ),
        //                   child: Column(
        //                     mainAxisAlignment: MainAxisAlignment.center,
        //                     crossAxisAlignment: CrossAxisAlignment.center,
        //                     children: [
        //                       Image.asset(
        //                         Category[index].icon,
        //                         height: 50,
        //                       ),
        //                       const SizedBox(
        //                         height: 10,
        //                       ),
        //                       Text(
        //                         Category[index].name,
        //                         style: const TextStyle(
        //                             fontFamily: 'Tajawal',
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: 17),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               );
        //             }),
        //       ),
        //       // const Spacer(flex: 1,),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Demo'),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFAFAFA),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/images/praying (1).png')), //
            label: 'مواقيت الصلاة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'أذكار',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'القبلة',
          ),
          BottomNavigationBarItem(
            icon: Image(image: AssetImage('assets/images/arabic.png')),
            label: 'السبحة',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
