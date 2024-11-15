import 'package:bus_route_example/Global/global.dart';
import 'package:bus_route_example/Model/routemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? _sourceCity,_destinationCity;
  List<BusRoute> bus_route=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Search',style: TextStyle(fontSize: 20),),),
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
                        if(_sourceCity!=null && _destinationCity!=null)
                        {
                          bus_route=route_list.where((element) => 
                                                     element.source==_sourceCity! && element.destination==_destinationCity!).toList();

                        }
                        else{
                          bus_route.clear();
                        }
                        
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
                    if(_sourceCity!=null && _destinationCity!=null)
                        {
                          bus_route=route_list.where((element) => 
                                                     element.source==_sourceCity! && element.destination==_destinationCity!).toList();

                        }
                        else{
                          bus_route.clear();
                        }
                                 });
                               },
                             ),
                             ),
                 )
              ],
            ),
            SizedBox(height: 10,),
            Expanded(child: Container(
              child: ListView.builder(
                itemCount: bus_route.length,
                itemBuilder:(context,index){
                  BusRoute bus_route_obj=bus_route[index];
                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Text('Bus# ${bus_route_obj.busnum}'),
                          Text('Time ${bus_route_obj.time}')
                        ],
                      ),
                    ),
                  );
                }
                ),
            ))
        
          ],
        ),
      ),
    );
  }
}