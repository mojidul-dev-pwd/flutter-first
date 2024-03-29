//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Fragment/AlarmFragment.dart';
import 'Fragment/BalanceFragment.dart';
import 'Fragment/ContactFragment.dart';
import 'Fragment/EmailFragment.dart';
import 'Fragment/HomeFragment.dart';
import 'Fragment/PersonFragment.dart';
import 'Fragment/SearchFragment.dart';
import 'Fragment/SettingsFragment.dart';

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

  var MyItems = [
    {"img":"http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg","title":"PWD"},
    {"img":"http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg","title":"Mojidul"},
    {"img":"http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg","title":"Nayeem"},
    {"img":"http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg","title":"Fatima"},
    {"img":"http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg","title":"PWD"},
    {"img":"http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg","title":"Mojidul"},
    {"img":"http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg","title":"Nayeem"},
    {"img":"http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg","title":"Fatima"},{"img":"http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg","title":"PWD"},
    {"img":"http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg","title":"Mojidul"},
    {"img":"http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg","title":"Nayeem"},
    {"img":"http://dpp.pwdsoft.org/assets/media/avatars/300-1.jpg","title":"Fatima"}
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PageActivity1("Come from Home to activity 1")));
          }, child: Text("Activity 1")),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PageActivity2("Come from Home to activity 2")));
          }, child: Text("Activity 2")),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CardActivity()));
          }, child: Text("Card")),
        ],
      ),
    );
  }


//tab bar
  /*
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
        title: Text("My AppBar.."),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.home),text: "Home"),
              Tab(icon: Icon(Icons.search),text: "Search"),
              Tab(icon: Icon(Icons.settings),text: "Settings"),
              Tab(icon: Icon(Icons.email),text: "Email"),
              Tab(icon: Icon(Icons.contact_mail),text: "Contact Mail"),
              Tab(icon: Icon(Icons.person),text: "Person"),
              Tab(icon: Icon(Icons.access_alarm),text: "Access Alarm"),
              Tab(icon: Icon(Icons.account_balance),text: "Account Balance")
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeFragment(),
            SearchFragment(),
            SettingsFragment(),
            EmailFragment(),
            ContactFragment(),
            PersonFragment(),
            AlarmFragment(),
            BalanceFragment()
          ],
        ),
      ),
    );
  }
  */
//app bar
  /*
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
      */
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
      /*
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(15), child: TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: 'First Name'))),
          Padding(padding: EdgeInsets.all(15), child: TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: 'Last Name'))),
          Padding(padding: EdgeInsets.all(15), child: TextField(decoration: InputDecoration(border:OutlineInputBorder(),labelText: 'Email'))),
          Padding(padding: EdgeInsets.all(15), child: ElevatedButton(onPressed:(){}, child: Text("Submit"), style: buttonStyle2))

        ],
      )
      */
      /*
      body: ListView.builder(
          itemCount: MyItems.length,
          itemBuilder: (context,index){
            return GestureDetector(
              //onTap: (){MySnackBar(MyItems[index]['title'], context);},
              onDoubleTap: (){MySnackBar(MyItems[index]['title'], context);}, //type on to get varities action name
              child: Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 300,
                child: Image.network(MyItems[index]['img']!, fit: BoxFit.fill,),//for null accept use !
              ),
            );
          }),
      */
        /*
        body: GridView.builder(itemCount: MyItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,//number of column shows
              crossAxisSpacing: 0,
              childAspectRatio: 1.1
            ),
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){MySnackBar(MyItems[index]['title'], context);},
                //onDoubleTap: (){MySnackBar(MyItems[index]['title'], context);}, //type on to get varities action name
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  height: 300,
                  child: Image.network(MyItems[index]['img']!, fit: BoxFit.fill,),//for null accept use !
                ),
              );
            }),
      */
    //);
  }

//}

class PageActivity1 extends StatelessWidget{

  String msg;
  PageActivity1(
    this.msg,
    {super.key}
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(msg),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PageActivity2("from PageActivity1 to PageActivity2")));
        }, child: Text('Go Text Activity 2'),),
      ),
    );
  }
}

class PageActivity2 extends StatelessWidget{

  String msg;
  PageActivity2(
      this.msg,
      {super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(msg),
      ),
      body: Center(
      child: ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PageActivity1("Come from PageActivity2 to PageActivity1")));
      }, child: Text('Go Text Activity 1'),),
    ),
    );
  }
}

class CardActivity extends StatelessWidget{

  CardActivity({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Test"),
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)//for round 100
          ),
          //color: Color.fromARGB(33, 191, 115, 1), //best
          color: Colors.green,
          shadowColor: Colors.greenAccent,
          //shape: OutlineInputBorder(),
          elevation: 80,
          child: SizedBox(
            height: 200,
            width: 200,
            child: Center(child: Text("Card Ready"),),
          ),
        ),
      )
    );
  }
}

