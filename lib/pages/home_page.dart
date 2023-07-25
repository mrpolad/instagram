import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/models/app_models.dart';

import '../widgets/post.dart';
import '../widgets/user_story.dart';
import '../widgets/user_add_story.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List userList = [
    UserModel(image: 'lib/assets/images/ilyas.jpeg', username: 'Ilyas'),
    UserModel(image: 'lib/assets/images/codelandial.jpeg', username: 'Codelandia'),
    UserModel(image: 'lib/assets/images/agababa.jpeg', username: 'Ağababa'),
    UserModel(image: 'lib/assets/images/togrul.jpeg', username: 'Toğrul'),
    UserModel(image: 'lib/assets/images/ramin.jpeg', username: 'Ramin'),
    UserModel(image: 'lib/assets/images/mensur.jpeg', username: 'Mənsur'),
    UserModel(image: 'lib/assets/images/rasul.jpeg', username: 'Rəsul'),
    UserModel(image: 'lib/assets/images/murad.jpeg', username: 'Murad'),
  ];

  List postList = [
    UserModel(image: 'lib/assets/images/rasul.jpeg', username: 'Rəsul', postImage: [
      'lib/assets/images/rasulpost2.jpg',
      'lib/assets/images/rasulpost.jpg',
    ],like: 90, details: 'Work'),
    UserModel(image: 'lib/assets/images/codelandial.jpeg', username: 'Codelandia', postImage: [
      'lib/assets/images/codelandia2.jpg',
      'lib/assets/images/codelandia.jpg',
    ],like: 90, details: '🎉 Kod yazmayı öyrənmək heç bu qədər əyləncəli olmamışdı! Codelandia Proqramlaşdırma Mərkəzindəki dinamik, professionallar tərəfindən keçirilən dərslərə qoşul və sürətli vebsaytların yaradılmasında öz töhvəni ver! 💫'),
    UserModel(image: 'lib/assets/images/togrul.jpeg', username: 'Togrul', postImage: [
      'lib/assets/images/nature.jpg',
      'lib/assets/images/togrul.jpeg',
      'lib/assets/images/codelandia2.jpg',
      'lib/assets/images/codelandia.jpg',
    ],like: 46, details: 'Codelandia ilə keçirilən zaman...'),
    UserModel(image: 'lib/assets/images/ilyas.jpeg', username: 'Ilyas', postImage: [
      'lib/assets/images/ilyaspost.jpg',
      'lib/assets/images/ilyaspost2.jpg',
      'lib/assets/images/ilyaspost3.jpg',
    ],like: 75, details: 'Just good memories…'),
    UserModel(image: 'lib/assets/images/agababa.jpeg', username: 'Agababa', postImage: [
      'lib/assets/images/agababapost.jpg',
      'lib/assets/images/agababapost2.jpg',
      'lib/assets/images/agababapost3.jpg',
    ],like: 83, details: 'Daily Life'),
    UserModel(image: 'lib/assets/images/ramin.jpeg', username: 'Ramin', postImage: [
      'lib/assets/images/raminpost.jpeg',
      'lib/assets/images/raminpost2.jpeg',
      'lib/assets/images/raminpost3.jpeg',
      'lib/assets/images/raminpost4.jpeg',
    ],like: 44, details: '🤫🤫🤫'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/1280px-Instagram_logo.svg.png',
        height: 40,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: const [
        FaIcon(FontAwesomeIcons.heart, color: Colors.black,),
        SizedBox(width: 15,),
        FaIcon(FontAwesomeIcons.facebookMessenger, color: Colors.black,),
        SizedBox(width: 15,),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const UserAddStory(),
                  Row(
        children: userList.map((e) => CustomUserStory(user: e),).toList()
      ),
                ],
              ),
            ),
            Column(
              children: postList.map((e) => 
              CustomPost(user: e)).toList(),
            )
          ],
        ),
      ),
    );
  }
}

