import 'main_title_text.dart';
import 'section_title.dart';
import 'package:flutter/material.dart';
import 'post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasicPage(),
    );
  }
}

class BasicPage extends StatelessWidget {

  List<Post> posts = [
    Post(name: "Olivier Personne", time: "10 minutes", imagePath: "images/carnaval.jpg", desc: "Petit tour au Magic World, on s'est bien amusés et en plus il n'y avait pas grand monde. J'ai adoré."),
    Post(name: "Olivier Personne", time: "4 jours", imagePath: "images/mountain.jpg", desc: "La montagne ça vous gagne."),
    Post(name: "Olivier Personne", time: "3 semaines", imagePath: "images/work.jpg", desc: "Retour au boulot après plusieurs mois de confinement."),
    Post(name: "Olivier Personne", time: "6 ans", imagePath: "images/playa.jpg", desc: "Le boulot en remote c'est le pied: la preuve ceci sera mon bureau pour les prochaines semaines.")
  ];

  BasicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Facebook"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset("images/cover.jpg", height: 200, fit: BoxFit.cover,),
                Padding(
                    padding: const EdgeInsets.only(top: 125),
                  child: CircleAvatar(radius: 75, backgroundColor: Colors.white,
                    child: myProfilePic(72),
                  ),
                )
              ],
            ),
            Row(
              children: const [
                Spacer(),
                MainTitleText(data: "Pascal Gillotin"),
                Spacer()
              ],
            ),
            const Padding(
                padding: EdgeInsets.all(8),
                child: Text("Ce n' est pas la réponse qui éclaire, mais la question.                      E. Ionesco",
                style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic
                ),
                textAlign: TextAlign.center,
              )
            ),
            Row(
              children: [
                Expanded(child: buttonContainer(text: "Modifier le profil")),
                buttonContainer(icon: Icons.border_color)
              ],
            ),
            const Divider(thickness: 2,),
            const SectionTitle(text: 'A propos de moi'),
            aboutRow(icon: Icons.house, text: "Ville-sur-Lumes, France"),
            aboutRow(icon: Icons.work, text: "Développeur FullStack"),
            aboutRow(icon: Icons.favorite, text: "Pasckoo"),
            const Divider(thickness: 2,),
            const SectionTitle(text: 'Amis'),
            allFriends(width),
            const Divider(thickness: 2,),
            const SectionTitle(text: 'Mes Posts'),
            allPosts()
         ] ,
        ),
      ),
    );
  }
  
  CircleAvatar myProfilePic(double radius) => CircleAvatar(radius: radius, backgroundImage: const AssetImage("images/profile.jpg"));

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue
      ),
      height: 50,
      child: (icon == null)
          ? Center(child: Text(text ?? "", style: const TextStyle(color: Colors.white)))
          : Icon(icon, color: Colors.white,),
    );
  }

  Widget aboutRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(icon),
        Padding(
            padding: const EdgeInsets.all(5),
          child: Text(text),
        )
      ],
    );
  }

  Column friendsImage(String name, String imagePath, double width) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.asset(imagePath, height: 100.0, width: 100.0,),
        ),

        Text(name),

      ],
    );

  }


  Row allFriends(double width) {
    Map<String, String> amis = {
      "Merlot": "images/cat.jpg",
      "Maggie": "images/sunflower.jpg",
      "Douggy": "images/duck.jpg",
    };
    List<Widget> cheImage = [];
    amis.forEach((key, value) {
    cheImage.add(friendsImage(key, value, width));

      });
    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
    cheImage,);

 }

  Column allPosts() {
    List<Widget> postToAdd = [];
    for (var element in posts) {
      postToAdd.add(post(post: element));
    }
    return Column(children: postToAdd,);
  }

  Container post({required Post post}) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(225, 225, 225, 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              myProfilePic(20),
              const Padding(padding: EdgeInsets.only(left: 8)),
              Text(post.name),
              const Spacer(),
              timeText(post.setTime())
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Image.asset(post.imagePath, fit: BoxFit.cover,)
          ),
          Text(post.desc,
            style: const TextStyle(
              color: Colors.blueAccent),
            textAlign: TextAlign.center,

          ),
          const Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.favorite),
              Text(post.setLikes()),
              const Icon(Icons.message),
              Text(post.setComments())
            ],
          )

        ],
      ),
    );
  }
  
  Text timeText(String time) {
    return Text(time, style: const TextStyle(color: Colors.blue),);
  }
}