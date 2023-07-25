import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/models/app_models.dart';

class CustomUserStory extends StatelessWidget {
  final UserModel user;
  const CustomUserStory({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [Colors.red, Colors.pink])
                ),
              ),
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 2),
                  image: DecorationImage(image: AssetImage('${user.image}'))
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
         Text('${user.username}', style: GoogleFonts.openSans(fontSize: 11),)
        ],
      ),
    );
  }
}