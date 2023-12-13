import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


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
  late String page = "Home";

  bool setTheme() {
    if (themeState == false) {
      setState(() {
        themeState = true;
        primaryThemeColor = Colors.black;
        secondaryThemeColor = Colors.black87;
        fontColor = Colors.white;
        iconMode = Icons.light_mode;
      });
      return themeState;
    } else {
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

  Widget setPage() {
    if (page == "Home") {
      return MyHome(
        fontColor: fontColor,
      );
    } else if (page == "Quem Somos") {
      return MyContact(fontColor: fontColor);
    } else if (page == "Anuncios") {
      return MyAd(fontColor: fontColor);
    } else {
      return MyHome(fontColor: fontColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: primaryThemeColor),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "AnuncieAqui",
                      style: TextStyle(color: fontColor, fontSize: 20),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                page = "Home";
                              });
                            },
                            child: Text("Home",
                                style:
                                    TextStyle(color: fontColor, fontSize: 16))),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                page = "Quem Somos";
                              });
                            },
                            child: Text("Quem Somos",
                                style:
                                    TextStyle(color: fontColor, fontSize: 16))),
                        const SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                page = "Anuncios";
                              });
                            },
                            child: Text("Anuncios",
                                style:
                                    TextStyle(color: fontColor, fontSize: 16))),
                        const SizedBox(
                          width: 20,
                        ),
                        //TextButton(onPressed: (){}, child: Text("Contato", style: TextStyle(color: fontColor, fontSize: 16))),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          icon: Icon(
                            iconMode,
                            color: fontColor,
                          ),
                          onPressed: () {
                            setTheme();
                          },
                        )
                      ],
                    )
                  ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: secondaryThemeColor),
              padding: const EdgeInsets.only(
                  top: 50, left: 40, right: 40, bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [setPage()],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  final Color fontColor;
  const MyHome({super.key, required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Homepage",
       style:
                                    TextStyle(color: fontColor, fontSize: 20),
    );
  }
}

class MyContact extends StatelessWidget {
  final Color fontColor;
  const MyContact({super.key, required this.fontColor});

  void abrirUrl(url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      child: Column(
        children: [
          Text(
            "Quem Somos?",
            style: TextStyle(fontSize: 20, color: fontColor),
          ),
          Text(
            "Dois alunos de engenharia inventando que faz codigo",
            style: TextStyle(fontSize: 20, color: fontColor),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Luiz Eduardo",
                    style: TextStyle(fontSize: 20, color: fontColor),
                  ),
                  Image.network(
                    "https://avatars.githubusercontent.com/u/44899286?v=4",
                    height: 200,
                    width: 200,
                  ),
                  TextButton(onPressed: (){
                    abrirUrl("https://github.com/LuizEduardoBP");
                  }, child: const Text("Github")),

                  TextButton(onPressed: (){
                    abrirUrl("https://www.instagram.com/luiz_eduardo12/");
                  }, child: const Text("Instagram")),

                  Text("Email : luiz.pessoa@academico.ifpb.edu.br", style: TextStyle(fontSize: 14, color: fontColor),),
                   
                ],
              ),
              Column(
                children: [
                  Text(
                    "Daniel Victor",
                    style: TextStyle(fontSize: 20, color: fontColor),
                  ),
                  Image.network(
                    "https://avatars.githubusercontent.com/u/49991251?v=4",
                    height: 200,
                    width: 200,
                    fit: BoxFit.fill,
                  ),


                  TextButton(onPressed: (){
                    abrirUrl("https://github.com/danivict");
                  }, child: const Text("Github")),

                  TextButton(onPressed: (){
                    abrirUrl("https://www.instagram.com/daniogurt/");
                  }, child: const Text("Instagram")),

                  Text("Email : daniel.victor@academico.ifpb.edu.br", style: TextStyle(fontSize: 14, color: fontColor),),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyAd extends StatelessWidget {
  final Color fontColor;

  const MyAd({super.key, required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Anuncios",
      style: TextStyle(fontSize: 20),
    );
  }
}
