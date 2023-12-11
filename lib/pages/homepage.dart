import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late var themeState = false;
  late Color primaryThemeColor = Colors.grey;
  late Color secondaryThemeColor = Colors.white;
  late Color fontColor = Colors.black;
  late IconData iconMode = Icons.dark_mode;

  bool setTheme(){
    if(themeState == false){
      setState(() {
        themeState = true;
        primaryThemeColor = Colors.black;
        secondaryThemeColor = Colors.black87;
        fontColor = Colors.white;
        iconMode = Icons.light_mode;
      });
      return themeState;
    } else{
        setState(() {
          themeState = false;
          primaryThemeColor = Colors.grey;
          secondaryThemeColor = Colors.white;
          fontColor = Colors.black;
          iconMode = Icons.dark_mode;

      });

      return themeState;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:[
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: primaryThemeColor),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Teste Front WEB", style: TextStyle(color: fontColor, fontSize: 20),),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                children: [
                TextButton(onPressed: () {}, child: Text("Home", style: TextStyle(color: fontColor, fontSize: 16))),
                const SizedBox(width: 20,),
                Text("Quem Somos", style: TextStyle(color: fontColor, fontSize: 16)),
                const SizedBox(width: 20,),
                Text("Anuncios", style: TextStyle(color: fontColor, fontSize: 16)),
                const SizedBox(width: 20,),
                Text("Contato", style: TextStyle(color: fontColor, fontSize: 16)),
                const SizedBox(width: 20,),
                IconButton(icon: Icon(iconMode, color: fontColor,), onPressed: () {
                setTheme();
              },)
              ],)
            ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: secondaryThemeColor),
            padding: EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                MyHome()
              ],
            ),
          )
          
        ],),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Homepage",style: TextStyle(fontSize: 20),);
  }
}

class MyContact extends StatelessWidget {
  const MyContact({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Contatos",style: TextStyle(fontSize: 20),);
  }
}