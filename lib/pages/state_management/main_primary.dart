import 'package:flutter/material.dart';

// import 'package:hello/pages/state_management/_bloc/app.dart';
import 'package:hello/pages/state_management/_bloc_lib/app.dart';
import 'package:hello/pages/state_management/_inherited_model/app.dart';
// import 'package:hello/pages/state_management/_inherited_widget/app.dart';
// import 'package:hello/pages/state_management/_mobx/app.dart';
// import 'package:hello/pages/state_management/_provider/app.dart';
// import 'package:hello/pages/state_management/_redux/app.dart';
// import 'package:hello/pages/state_management/_scoped_model/app.dart';
// import 'package:hello/pages/state_management/_stateful_widget/app.dart';

// void main() => runApp(App());

// import 'package:google_fonts/google_fonts.dart';

// class StateManagement extends StatelessWidget {
//   const StateManagement({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: TabBar(
//             tabs: [
//               Tab(icon: Icon(Icons.assignment), text: "Bloc 1"),
//               Tab(icon: Icon(Icons.assignment), text: "Bloc 2"),
//               Tab(icon: Icon(Icons.assignment), text: "Inherited Model"),
//             ],
//           ),
//           title: Text('Latihaan State Management', style: GoogleFonts.lato()),
//         ),
//         body: TabBarView(
//           children: [
//             BlocLib(
//               key: PageStorageKey('Bloc1'),
//             ),
//             BlocLib(
//               key: PageStorageKey('Bloc2'),
//             ),
//             Inherited(),
//           ],
//         ),
//       ),
//     );
//   }
// }

class StateManagement extends StatelessWidget {
  const StateManagement({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer"),
      ),
      body: Center(
        child: Text("Navigation Drawer Example", style: TextStyle(
          fontSize: 20.0,
        ),)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child:Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("Akram.aic193@Gmail.com"),
              accountName: Text("Akram Chauhan"),
              currentAccountPicture: CircleAvatar(
                child: Text("AC"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Categories"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.add_to_photos),
              title: Text("Add Items"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Share with Friends"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text("Rate and Review"),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.flag),
              title: Text("Privacy Policy"),
              onTap: (){},
            ),
          ],
        ),
      ),
    );
  }
}