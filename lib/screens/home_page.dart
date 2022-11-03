import 'package:flutter/material.dart';
import 'package:test/model/user.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../common/api_service.dart';
import '../common/exceptions.dart';
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<User>>? _users;
  @override
  void initState() {
    super.initState();
    _users = fetchUsrInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Пользователи',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<User>>(
        future: _users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    size: 55,
                  ),
                  title: Text(
                    '${snapshot.data![index].name}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                        text: '${snapshot.data![index].email}\n',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                              text: 'Surf',
                              style: TextStyle(color: Colors.black))
                        ]),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            // return  Column(
            //  children: [ 
            //     SizedBox(height: 100,),
            //      Container(
            //         child: Icon(Icons.report_problem_outlined,size: 70,color: Colors.purple, ),
            //         alignment: Alignment.center,),
            //     SizedBox(height: 30,),
            //     Text('Не удалось загрузить информацию',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
            //     SizedBox(height: 30,),
            //     ElevatedButton(
            //         style: ButtonStyle(
            //           backgroundColor: MaterialStateProperty.all(Colors.purple),
            //           padding:
            //               MaterialStateProperty.all(const EdgeInsets.all(10)),
            //           minimumSize:
            //               MaterialStateProperty.all(const Size(230, 40)),
            //           shape: MaterialStateProperty.all(
            //             RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(30),
            //             ),
            //           ),
            //         ),
            //         onPressed: () {
            //           fetchUsrInfo();
            //         },
            //         child: Text(
            //           'Обновить',
            //           style: TextStyle(fontWeight: FontWeight.bold),
            //         ))
            //   ]
            // );
              if (snapshot.error is NoInternetException) {
              NoInternetException noInternetException =
              snapshot.error as NoInternetException;
              return Text(noInternetException.message);
             }
             if (snapshot.error is NoServiceFoundException) {
                NoServiceFoundException noServiceFoundException =
                 snapshot.error as NoServiceFoundException;
                return Text(noServiceFoundException.message);
            }
         if (snapshot.error is InvalidFormatException) {
          InvalidFormatException invalidFormatException =
         snapshot.error as InvalidFormatException;
           return Text(invalidFormatException.message);
}
       UnknownException unknownException =
            snapshot.error as UnknownException;
         return Text(unknownException.message);
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
            ),
          );
        },
      ),
    );
  }
}
