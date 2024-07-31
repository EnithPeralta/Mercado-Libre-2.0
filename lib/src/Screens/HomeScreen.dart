import 'package:flutter/material.dart';
import 'package:mercadolibre2/lists/Category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
    int _chooseItem = 0;
    
  void _onItemChoose(int index) {
    setState(() {
      _chooseItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Mercado Libre'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/inicio');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.cyan[400],
                      ),
                      child: const Icon(Icons.login_outlined)),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registro');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.cyan[400],
                      ),
                      child: const Icon(Icons.app_registration_rounded))
                ],
              )),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Product search',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Colors.grey[200]),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_rounded),
                      color: Colors.cyan[400],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_sharp),
                      color: Colors.cyan[400],
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (BuildContext context, int index) {
                         return GestureDetector(
                          onTap: () {
                            categories[index]['titulo'];},
                          child: Card(
                            color: const Color(0xFF141414),
                            elevation: 2.0,
                            margin: const EdgeInsets.all(5),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(categories[index]['icono'],
                                      color: Colors.cyan[400]),
                                  const SizedBox(width: 10),
                                  Text(
                                    categories[index]['titulo'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 12.0,
                                    color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor:  Colors.cyan[400],
          currentIndex: _chooseItem,
          onTap: _onItemChoose,
          items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.0),
              label: 'Start'),
          BottomNavigationBarItem(
              icon:  Icon(Icons.shop_2, size: 30.0),
              label: 'Shop'),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app_rounded,size: 30.0),
            label: 'Exit',
          )
        ]));
  }
}