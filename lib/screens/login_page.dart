import 'package:flutter/material.dart';
import 'package:test/screens/home_page.dart';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  late FocusNode nodeOne;
  late FocusNode nodeTwo;
  static MaterialColor Color1 = Colors.grey;
  static MaterialColor Color2 = Colors.purple;
  Color field1 = Color1;
  Color field2 = Color1;
  @override
  void initState() {
    super.initState();
    nodeOne = FocusNode();
    nodeTwo = FocusNode();
  }

  @override
  void dispose() {
    nodeOne.dispose();
    nodeTwo.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus( nodeOne);
      FocusScope.of(context).requestFocus( nodeTwo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/image.png'),
              fit: BoxFit.cover,
              alignment: Alignment.center)),
      child: 
      Stack(children:<Widget>[
      Container(
        child:SingleChildScrollView(
          child: Column(children: [
        SizedBox(height: 70),  
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(25.0),
          child:Focus(
          onFocusChange: (hasFocus) {
                        setState(() => field1 = hasFocus ? Color(0x000E3311).withOpacity(0.5) : Color2);
                      },
          child: Text('Вход',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40)))),
    
        Center(
            child: Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            width: 350,
            height: 330,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: Colors.white,
            ),
            child: Column(children: [
              SizedBox(height: 50),
              Container(
                width: 250,
                child: Focus(
                onFocusChange: (hasFocus) {
                        setState(() => nodeOne.hasFocus ? Colors.purple : Colors.grey);
                      },
                child:TextFormField(
                  cursorColor: Colors.purple,
                  focusNode: nodeOne,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                          color: nodeOne.hasFocus ? Colors.purple : Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),        
                          ),
                ),
              )
              ),
              SizedBox(height: 20),
              Container(
                  width: 250,
                  child: Focus(
                      onFocusChange: (hasFocus) {
                        setState(() => nodeTwo.hasFocus
                                    ? Colors.purple
                                    : Colors.grey);
                      },
                      child: TextFormField(
                        cursorColor: Colors.purple,
                        focusNode: nodeTwo,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Пароль",
                            labelStyle: TextStyle(
                                color: nodeTwo.hasFocus
                                    ? Colors.purple
                                    : Colors.grey),
                             focusedBorder: UnderlineInputBorder(
                             borderSide: BorderSide(color: Colors.black)),
                                    ),
                      )
                      )
                      ),
              SizedBox(height: 50),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    minimumSize: MaterialStateProperty.all(const Size(230, 40)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage())),
                  child: Text(
                    'Войти',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ]),
          ),
        ))
      ]
      )
      ),
      )]
    )
    )
    );
  }
}
