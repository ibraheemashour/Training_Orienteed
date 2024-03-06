import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gp/loginPage.dart';
import 'package:gp/market.dart';
import 'package:gp/profile.dart';

class HomePage extends StatefulWidget {
  final String baseUrl;
  final String name;
  final String email;
  final String password;

  const HomePage({Key? key, required this.baseUrl, required this.name, required this.email,required this.password}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.comment),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.blue,
        elevation: 50.0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      // body: Center(
      //   child:Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //      children: [
      //         // Text(
      //         //   'Welcome',
      //         //   style: TextStyle(fontSize: 30, color: Colors.blue),
      //         // ),
      //         child: Container(
      //       width: 200,
      //       height: 200,
      //       decoration: BoxDecoration(
      //         color: Colors.blue, // You can set background color for the container
      //         borderRadius: BorderRadius.circular(10), // You can set border radius for rounded corners
      //       ),
      //       child: Image.network(
      //         'https://example.com/your-image.jpg', // Replace this URL with your image URL
      //         fit: BoxFit.cover, // You can adjust the fit of the image
      //       ),
      //         SizedBox(height: 20), // Add some space between text and button
      //         ElevatedButton(
      //           onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Market(baseUrl: widget.baseUrl)),
      //           );
      //           },
      //           child: Text('Marketplace',style: TextStyle(fontSize: 20, color: Colors.blue)),
      //         ),
      //       ],
      //   ),
        
      // ),
      //       body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
        
      //     children: [
      //       Container(
      //         width: 200,
      //         height: 200,
      //         decoration: BoxDecoration(
      //           color: Colors.blue, // You can set background color for the container
      //           borderRadius: BorderRadius.circular(50), // You can set border radius for rounded corners
                
      //         ),
      //         child: Image.network(
      //           'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg', // Replace this URL with your image URL
      //           fit: BoxFit.cover, // You can adjust the fit of the image
      //         ),
      //       ),
      //       SizedBox(height: 20), // Add some space between image and button
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Market(baseUrl: widget.baseUrl)),
      //           );
      //         },
      //         child: Text('Marketplace', style: TextStyle(fontSize: 20, color: Colors.blue)),
      //       ),
      //     ],
      //   ),
      // ),
      body: ListView(
          children: [
            SizedBox(height: 20), // Add some space between app bar and image
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue, // You can set background color for the container
                  borderRadius: BorderRadius.circular(100), // You can set border radius for rounded corners
                ),
                child: Image.network(
                  'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg', // Replace this URL with your image URL
                  fit: BoxFit.cover, // You can adjust the fit of the image
                ),
              ),
            ),
            SizedBox(height: 20), // Add some space between image and button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Market(baseUrl: widget.baseUrl)),
                );
              },
              child: Text('Marketplace', style: TextStyle(fontSize: 20, color: Colors.blue)),
            ),
          ],
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: const Color.fromARGB(255, 13, 105, 151),
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.account_circle),
          ),
        ],
        onTap: (int indexOfItem) {
          // print(indexOfItem);
          // Handle navigation
          if (indexOfItem == 0) {
            print('Home');
          }
          if (indexOfItem == 1) {
            print('Search');
          }
          if (indexOfItem == 2) {
            print('Profile');
            //go to profile
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(baseUrl: widget.baseUrl,name: widget.name,email: widget.email,password:widget.password)),
            );
          }

        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.name),
              accountEmail: Text(widget.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Text(
                  widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(baseUrl: widget.baseUrl,name: widget.name,email: widget.email,password:widget.password)),
            );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage(baseUrl: widget.baseUrl)),
                );
                print('logout successful!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
 

 