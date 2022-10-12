import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class ScaffoldExample extends StatelessWidget {
  void main() => runApp(ScaffoldExample());


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Bet Score',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();
  }

}
DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);
String day = date.day.toString();
String month = date.month.toString();
String year = date.year.toString();


class _HomeState extends State {


  String _title = "Football";
  String dateText = day+"/"+month+"/"+year;
  int _selectedIndex = 0;
  final List _widgetOptions = [
    AllMatches(),
    Favorites(),
    Live(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer : Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('Popular Sports'),
            ),
            ListTile(
              title: const Text('Football'),
              onTap: () {
                // Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('Basketball'),
              onTap:  () {

              },
            ),
            ListTile(
              title: const Text('Tennis'),
              onTap: () {

                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        //title: Text(_title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
          title: Column(
              children: <Widget>[
                Text(
                  _title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18),
                ),
                Text(dateText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14),
                )
              ]
          ),
        actions: [


          IconButton(
              onPressed: () => openLoginScreen(context),
              icon: Icon(
                Icons.account_circle_outlined,
              )),
          IconButton(
              onPressed: () => openSearchScreen(context),
              icon: Icon(
                Icons.search,
              )),

        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset), title: Text('All Matches')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favorites')),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_tv), title: Text('LIVE')),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch (index) {
        case 0:
          {
            _title = 'All Matches';
          }
          break;
        case 1:
          {
            _title = 'Favorites';
          }
          break;
        case 2:
          {
            _title = 'LIVE';
          }
          break;
      }
    });
  }
}



/*START TAB SCREENS*/
class AllMatches extends StatelessWidget {

  final List images = ["https://image.freepik.com/free-vector/illustration-italy-flag_53876-27098.jpg",
    "https://flagsweb.com/images/PNG/Flag_of_Spain.png",
    "https://upload.wikimedia.org/wikipedia/commons/4/42/Flag_of_the_United_Kingdom.png",
    "https://www.germany-insider-facts.com/image-files/flag-of-germany-civil-flag.jpg",
    "https://seeklogo.com/images/F/france-flag-logo-DBC61B59A7-seeklogo.com.png",
    "https://seeklogo.com/images/A/Albania-logo-031A88DA81-seeklogo.com.png",
    "https://seeklogo.com/images/W/world-flags-logo-5BA03DE1FC-seeklogo.com.png",
    "https://besthqwallpapers.com/Uploads/23-12-2018/75356/thumb2-new-england-revolution-4k-logo-creative-art-blue-and-white-checkered-flag.jpg",
    "https://seeklogo.com/images/U/UEFA_Champions_league-logo-76E1E8D3FA-seeklogo.com.png",
    "https://seeklogo.com/images/U/UEFA_Champions_league-logo-76E1E8D3FA-seeklogo.com.png",
    "https://seeklogo.com/images/U/UEFA_Champions_league-logo-76E1E8D3FA-seeklogo.com.png",
    "https://seeklogo.com/images/U/UEFA_Champions_league-logo-76E1E8D3FA-seeklogo.com.png"
  ];

  final List Elis = [
    "Italy: Seria A",
    "Spain: LaLiga",
    "England: Premier League",
    "Germany: Bundesliga",
    "France: Ligue 1",
    "Albania: Superliga",
    "World: Club Frendly",
    "USA: MLS",
    "Champios League",
    "Brazil: Copa 1",
    "Ecuador: Liga Pro",
    "England: FA Cup"

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All games',style: TextStyle(color: Colors.black87),),
        // centerTitle: true,
        backgroundColor: Colors.white60,
      ),
      backgroundColor: Colors.white60,
      body: ListView.builder(
        itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 3,
          color: Colors.white60,
          child: ListTile(
            leading: ClipOval(
              child: Container(
                width: 30,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage (images[index]),


                  ),


                  //color: Colors.blue,
                  //borderRadius: BorderRadius.circular(13.9)
                ),
                child: null,
              ),
            ),
            trailing: Text('10'),
            title: Text(Elis[index]),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder:(context) =>AllMatchesDetail()));
            } ,

          ),
        );
      }),



      // body: Center(
      //   child: Text(
      //     'This is All Matches',
      //     style: TextStyle(fontSize: 24.0),
      //   ),
      // ),
    );
  }

//New route Screen or Page
}
class AllMatchesDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today Games'),
        backgroundColor: Colors.lightGreen.shade700,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go Back'),
          onPressed:() {
            Navigator.pop(context);


          },
        ),
      ),


    );
  }
}




class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is Favorites',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

class Live extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is Live',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}


/*END TAB SCREENS*/

openSearchScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => SearchScreen()));
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}


openLoginScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => LoginDemo()));
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    String email;
    String password;
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text("Login or Register"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 300,
                    height: 150,
                    child: Image.network(
                        "https://image.shutterstock.com/image-vector/label-bet-letter-logo-template-600w-1165444822.jpg")),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),

            //fgfgfgc gdfdf
            TextButton(
              onPressed: () {
                myMethod();
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),

            //ketu kam login button
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.green.shade700, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  email = emailController.text;
                  password = passwordController.text;
                },
                child: Text(
                  'login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),

            SizedBox(
              height: 130,
            ),
            new GestureDetector(
              onTap: () {
                eventclikcme();
              },
              child: new Text("New user? Register here"),
            ),
            new Text("test posht register")
          ],
        ),
      ),
    );
  }

  void eventclikcme() {
    //new user or register here click event
  }

  void myMethod() {
    //Forgot password click event
  }
}

