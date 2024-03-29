import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welcomeback/auth_services/auth_service.dart';
import 'package:welcomeback/pages/settings.dart';

class Home_Drawer extends StatelessWidget {
  const Home_Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService auth_sec=AuthService();
    return  Drawer(
      backgroundColor: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/2156/sky-earth-space-working.jpg?auto=compress&cs=tinysrgb&w=600'),
                  ),
                  accountName: Text('Dawood'),
                  accountEmail: Text('dawood.personal.pk')
              ),

              ListTile(
                leading: const Icon(CupertinoIcons.home,color:Colors.white,),
                title: const Text('Home',style: TextStyle(color: Colors.white)),
                onTap: (){Navigator.pop(context);},
              ),

               ListTile(
                leading: const Icon(CupertinoIcons.settings,color:Colors.white,),
                title: const Text('Settings',style: TextStyle(color: Colors.white),),
                 onTap: ()=>Navigator.push(context, MaterialPageRoute(

                   builder: (context)=>const Settings(),
                 )),
              ),
              const Divider(),


            ],
          ),
           ListTile(
            leading: const Icon(Icons.logout,color:Colors.white,),
            title:const Text('Log Out',style: TextStyle(color: Colors.white)),
            onTap: ()=> auth_sec.signOut(),
          )
        ],
      ),
    );
  }
}
