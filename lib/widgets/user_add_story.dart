import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAddStory extends StatelessWidget {
  const UserAddStory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                height: 70,
                width: 70,
              ),
              Container(
                height: 66,
                width: 66,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('lib/assets/images/user.png'))
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          Text(
            'Your Story',
            style: GoogleFonts.openSans(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
