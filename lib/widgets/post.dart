import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/app_models.dart';

class CustomPost extends StatefulWidget {
  final UserModel? user;
  const CustomPost({
    required this.user,
    super.key,
  });

  @override
  State<CustomPost> createState() => _CustomPostState();
}

class _CustomPostState extends State<CustomPost> {
  int imageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage('${widget.user!.image}'),
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${widget.user!.username}',
                style: GoogleFonts.openSans(
                    fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.topRight,
          children: [
            CarouselSlider.builder(
                itemCount: widget.user!.postImage!.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.asset(
                    '${widget.user!.postImage![index]}',
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                  );
                },
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.width,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      imageIndex = index;
                    });
                  },
                )),
            if (widget.user!.postImage!.length > 1)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.7),
                ),
                child: Text(
                  '${imageIndex + 1}/${widget.user!.postImage!.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const FaIcon(FontAwesomeIcons.heart),
              const SizedBox(
                width: 10,
              ),
              const FaIcon(FontAwesomeIcons.comment),
              const SizedBox(
                width: 10,
              ),
              const FaIcon(FontAwesomeIcons.paperPlane),
              const SizedBox(
                width: 100,
              ),
              if (widget.user!.postImage!.length > 1)
                SmoothPageIndicator(
                  controller: PageController(initialPage: imageIndex),
                  count: widget.user!.postImage!.length,
                  effect: const SlideEffect(
                      spacing: 6,
                      radius: 6,
                      dotWidth: 8,
                      dotHeight: 8,
                      paintStyle: PaintingStyle.fill,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.blue),
                ),
              const Spacer(),
              const FaIcon(FontAwesomeIcons.bookmark),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 5),
          child: Text(
            '${widget.user!.like} likes',
            style: GoogleFonts.openSans(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: RichText(
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: '${widget.user!.username} ',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
                children: [
                  TextSpan(
                      text: '${widget.user!.details}',
                      style:
                          GoogleFonts.openSans(fontWeight: FontWeight.normal))
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  image: DecorationImage(
                    image: AssetImage('${widget.user!.image}'),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text('Add Comment ...',
                  style: GoogleFonts.openSans(color: Colors.grey)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Text(
            '30 minutes ago',
            style: GoogleFonts.openSans(color: Colors.grey, fontSize: 11),
          ),
        )
      ],
    );
  }
}
