import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        darkTheme: ThemeData(primarySwatch: Colors.pink),
        color: Colors.blue,
        debugShowCheckedModeBanner: false,
        home: HomeActivity()
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  MySnackBar(message, context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My AppBar.."),
        titleSpacing: 4,//decrease left alignment
        //centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,//50 dile bujha jabe
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: (){MySnackBar("Comments",context);}, icon: Icon(Icons.comment)),
          IconButton(onPressed: (){MySnackBar("Search",context);}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){MySnackBar("Settings",context);}, icon: Icon(Icons.settings)),
          IconButton(onPressed: (){MySnackBar("mojidul31@gmail.com",context);}, icon: Icon(Icons.email))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
        onPressed: (){
          MySnackBar("Floating Action Button", context);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Contact"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        onTap: (int index){
          if(index ==0){
            MySnackBar("Home Bottom Menu", context);
          }
          if(index ==1){
            MySnackBar("Contact Bottom Menu", context);
          }
          if(index ==2){
            MySnackBar("Profile Bottom Menu", context);
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color:Colors.white),
                  accountName: Text("Mojidul Islam", style: TextStyle(color: Colors.black),),
                  accountEmail: Text("mojidul31@gmail.com", style: TextStyle(color: Colors.black)),
                  //currentAccountPicture: Image.network("https://w7.pngwing.com/pngs/537/866/png-transparent-flutter-hd-logo-thumbnail.png"),
                  currentAccountPicture: Image.network("http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg"),
                  onDetailsPressed: (){MySnackBar("This is profile details.", context);},
                )
            ),
            ListTile(
              leading: Icon(Icons.home),
              title:Text("Home"),
              onTap: (){
                MySnackBar("Home", context);
              },),
            ListTile(
              leading: Icon(Icons.email),
              title:Text("Email"),
              onTap: (){
                MySnackBar("Email", context);
              },),
            ListTile(
              leading: Icon(Icons.phone),
              title:Text("Phone"),
              onTap: (){
                MySnackBar("Phone", context);
              },),
          ],
        ),
      ),

      body: Text("Hello PWD"),
    );
  }

}

