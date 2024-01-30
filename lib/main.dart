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
  HomeActivity({super.key});

  MySnackBar(message, context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  MyAlertDialog(context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                title: Text("Alert!"),
                content: Text("Do you want to delete?"),
                actions: [
                  TextButton(onPressed: (){
                    MySnackBar("You click Yes", context);
                    Navigator.of(context).pop();
                  }, child: Text("Yes")),
                  TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No")),
                ],
              )
          );
        }
    );
  }
  
  ButtonStyle buttonStyle=ElevatedButton.styleFrom(
    padding: EdgeInsets.all(20),
    backgroundColor: Colors.cyan,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10))
    )
  );

  ButtonStyle buttonStyle2=ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 60)
  );

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
      endDrawer: Drawer(
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

      //body: Text("Hello PWD"),
      //body: Center(
        //child: Text("Hello PWD"),
        //child: Image.network("http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg")
      //),
        /*
      body: Container(
        height: 250,
        width: 250,
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(20),
        //margin: EdgeInsets.fromLTRB(10, 20, 20, 5),
        padding: EdgeInsets.all(10),
        //padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(color: Colors.black, width: 5)
        ),
        child: Image.network("http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg"),
      )
         */
      /*
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,width: 100, child: Image.network("http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg"),
          ),
          Container(
            height: 100,width: 100, child: Image.network("http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg"),
          ),
          Container(
            height: 100,width: 100, child: Image.network("http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg"),
          )
        ],
      ),
      */
      /*
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: (){MySnackBar("Text button Click", context);}, child: Text("Text Button")),
          ElevatedButton(onPressed: (){MySnackBar("Elevated button Click", context);}, child: Text("Elevated Button"), style: buttonStyle,),
          OutlinedButton(onPressed: (){MySnackBar("Outline button Click", context);}, child: Text("Outline Button"))
        ],
      ),
      */
      /*
      body: Center(
        child: ElevatedButton(
          child: Text("Click Me"),onPressed: (){MyAlertDialog(context);},
        ),
      )
      */
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(15), child: TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: 'First Name'))),
          Padding(padding: EdgeInsets.all(15), child: TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: 'Last Name'))),
          Padding(padding: EdgeInsets.all(15), child: TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: 'Email'))),
          Padding(padding: EdgeInsets.all(15), child: ElevatedButton(onPressed:(){}, child: Text("Submit"), style: buttonStyle2))

        ],
      )
    );
  }

}

