import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadMore extends StatelessWidget {
  const ReadMore({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read More Page'),
      ),
      body: Column(
        children: const [
          Center(
            child: Text('Read More Page'),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class BlogPackage extends StatefulWidget {
  BlogPackage({
    Key? key,
    this.readMorePage = const ReadMore(),
    this.isAssetImage = false,
    this.imagePath = 'https://kopilahomenepal.org/img/gallery/school1.jpeg',
    this.blogTitle = 'Design your apps in your own way',
    this.authorName = 'Author Name',
    this.nameStyle = const TextStyle(color: Colors.white38),
    this.lovecount = 33,
    this.commentCount = 08,
    this.titleStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: Color(0xff3D4958),
    ),
    this.countstyle = const TextStyle(
      color: Color(0xff94A0B1),
    ),
  }) : super(key: key);

  Widget readMorePage;
  bool isAssetImage;
  String imagePath;
  String blogTitle;
  String authorName;
  TextStyle nameStyle;
  double lovecount;
  double commentCount;
  TextStyle titleStyle;
  TextStyle countstyle;

  @override
  State<BlogPackage> createState() => _BlogPackageState();
}

class _BlogPackageState extends State<BlogPackage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      child: Stack(
        children: [
          Container(
            height: 260,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Container(
            height: 190,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              image: DecorationImage(
                image: widget.isAssetImage
                    ? AssetImage(widget.imagePath) as ImageProvider
                    : CachedNetworkImageProvider(widget.imagePath),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                height: 190,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.blogTitle,
                      style: widget.titleStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite_outlined,
                              color: Color(0xffA1A5B7),
                              size: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 3,
                                right: 3,
                              ),
                              child: Text(
                                widget.lovecount.toString(),
                                style: widget.countstyle,
                              ),
                            ),
                            const Icon(
                              Icons.comment_rounded,
                              color: Color(0xffA1A5B7),
                              size: 18,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text(
                                widget.commentCount.toString(),
                                style: widget.countstyle,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => widget.readMorePage),
                          ),
                          child: const Text(
                            'Read More',
                            style: TextStyle(
                              color: Color(0xffA8B2C0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 12,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 18,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        widget.authorName,
                        style: widget.nameStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        '26 June,2022',
                        style: widget.nameStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
