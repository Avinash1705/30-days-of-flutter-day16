import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fileUrl =
        "https://avatars.githubusercontent.com/u/34656820?s=400&u=47185404bcc478b23a92b1f89e20989e2137a4c4&v=4";
    return Drawer(
      child: Container(
          color: Colors.deepPurple,
          child: ListView(
            children: [
              DrawerHeader(
                  child: UserAccountsDrawerHeader(
                accountName: Text("Avinash Rawat"),
                accountEmail: Text("avinashrawat1705@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(fileUrl),
                ),
              )),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text("Home",textScaleFactor: 1.2 ,style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text("Profile",textScaleFactor: 1.2 ,style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                ),
                title: Text("Email me",textScaleFactor: 1.2 ,style: TextStyle(color: Colors.white)),
              ),
            ],
          )),
    );
  }
}
