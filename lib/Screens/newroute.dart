import 'package:bus_route_example/Global/global.dart';
import 'package:bus_route_example/Model/routemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewRouteScreen extends StatefulWidget {
  const NewRouteScreen({super.key});

  @override
  State<NewRouteScreen> createState() => _NewRouteScreenState();
}

class _NewRouteScreenState extends State<NewRouteScreen> {
  String? _sourceCity,_destinationCity;
  TextEditingController busNumberController=TextEditingController();
  TextEditingController departuretimeCoroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('New Route',style: TextStyle(fontSize: 20),),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text('Source',style: TextStyle(fontSize: 20),)),
                 Expanded(child: Text('Destination',style: TextStyle(fontSize: 20),)),
              ],
            ),
         
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    width: 30,
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                    
                    
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    value: _sourceCity,
                    items: cities.map((e)=>DropdownMenuItem<String>(child: Text(e),value: e,)).toList(),
                    onChanged: (selectedItem){
                      setState(() {
                        _sourceCity=selectedItem;
                      });
                    },
                  ),
                  ),
                ),
                SizedBox(width: 10,),
                 Expanded(
                   child: Container(decoration: BoxDecoration(
                               border: Border.all(color: Colors.black),
                               borderRadius: BorderRadius.circular(5),
                               
                               
                             ),
                             child: DropdownButton(
                               isExpanded: true,
                               value: _destinationCity,
                               items: cities.map((e)=>DropdownMenuItem<String>(child: Text(e),value: e,)).toList(),
                               onChanged: (selectedItem){
                                 setState(() {
                   _destinationCity=selectedItem;
                                 });
                               },
                             ),
                             ),
                 )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 170,
                  child: TextFormField(
                    style: TextStyle(fontSize: 20),
                    
                
                    controller: busNumberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Bus#',labelText: 'Bus#',
                      hintStyle: TextStyle(fontSize: 18),
                       labelStyle: TextStyle(fontSize: 18),),
                  ),
                ),
                SizedBox(width: 10,),
            Container(
              height: 60,
              width: 170,
              child: TextFormField(
                style: TextStyle(fontSize: 20),
                
            
                controller: departuretimeCoroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Departure Time',labelText: 'Departure Time',
                  hintStyle: TextStyle(fontSize: 18),
                   labelStyle: TextStyle(fontSize: 18),),
              ),
            )
              ],
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 2), // Border color and width
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
    ),
                minimumSize: Size(150, 50)
              ),
              onPressed: (){
        route_list.add(      
          BusRoute(source: _sourceCity!, destination: _destinationCity!,
               busnum: busNumberController.text, time:departuretimeCoroller.text)
        );

            }, child: Text('Add',style: TextStyle(fontSize: 25),))
              
         
        
          ],
        ),
      ),
    );
  }
}