import 'package:bus_route_example/Screens/newroute.dart';
import 'package:bus_route_example/Screens/searchscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Home',style: TextStyle(fontSize: 20),),),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(child: Text('New Route',
            style: TextStyle(fontSize: 15),),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return NewRouteScreen();
              }));
            
            },
            style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.black, width: 2), // Border color and width
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
                ),
                  minimumSize: Size(200, 50)
                ),
            
            ),
            SizedBox(height: 5,),
             ElevatedButton(child: Text('Search',
             style: TextStyle(fontSize: 15),),
             onPressed: (){
               Navigator.push(context,MaterialPageRoute(builder: (context){
                return SearchScreen();
              }));
             
             },
             style: ElevatedButton.styleFrom(
                   side: BorderSide(color: Colors.black, width: 2), // Border color and width
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
                 ),
                   minimumSize: Size(200, 50)
                 ),
             ),
          ],
        ),
      ) ,
    );
  }
}