import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class ReadMore extends StatelessWidget {
  ReadMore({
    Key? key,
    required this.blogDetails,
    required this.title,
    required this.date,
    required this.imageHeight,
    required this.image,
    required this.isAssetImage,
    required this.author,
    this.htmlTextstyle,
    required this.changeHtmlStyle,
  }) : super(key: key);

  String blogDetails;
  String title;
  String date;
  double imageHeight;
  String image;
  bool isAssetImage;
  String author;
  Map<String, Style>? htmlTextstyle;
  bool changeHtmlStyle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read More Page'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 5,
              bottom: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'By $author',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 7,
                    bottom: 5,
                  ),
                  child: Text(
                    '🕒 $date',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          isAssetImage
              ? Image.asset(image)
              : CachedNetworkImage(
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: image,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, error, child) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12.0)),
                        margin: const EdgeInsets.all(12.0),
                        height: imageHeight,
                        width: double.infinity,
                      ),
                    );
                  },
                ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 5,
            ),
            child: Html(
              data: blogDetails,
              style: changeHtmlStyle
                  ? htmlTextstyle!
                  : {
                      'p': Style(
                        textAlign: TextAlign.justify,
                        lineHeight: const LineHeight(1.4),
                      ),
                    },
            ),
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
    this.isAssetImage = false,
    this.imagePath = 'https://kopilahomenepal.org/img/gallery/school1.jpeg',
    this.blogTitle = 'Design your apps in your own way',
    this.authorName = 'Author Name',
    this.nameStyle = const TextStyle(color: Colors.white38),
    this.lovecount = 33,
    this.commentCount = 10,
    this.changeHtmlStyle = false,
    this.htmlStyle,
    this.titleStyle = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: Color(0xff3D4958),
    ),
    this.countstyle = const TextStyle(
      color: Color(0xff94A0B1),
    ),
    this.postDate = '26 June,2022',
    this.readmoreImageHeight = 200,
    this.blogDetails =
        '<p> Offering some respite to the general public grappling with the spike in fuel prices, Nepal Oil Corporation has decided to reduce the prices of petrol, diesel and kerosene despite facing huge losses after the government announced it would lift taxes levied on fuel.</p>'
            '<p> A meeting of the ruling coalition held earlier today had decided to adjust the price of petroleum products in an attempt to reduce the problems suffered by the general public due to skyrocketing fuel prices.</p>'
            '<p>Following the Cabinet\'s decision, the Minister of Industry, Commerce and Supplies Dilendra Prasad Badu stated that the prices of petroleum products have been reduced by removing taxes.</p><p>Thus, the price of petrol has been slashed by Rs 20 per litre to Rs 179 a litre. Similarly, the price of diesel and kerosene has been reduced by Rs 29 per litre to Rs 163 per litre each.</p><p>Thus, the price of petrol has been slashed by Rs 20 per litre to Rs 179 a litre. Similarly, the price of diesel and kerosene has been reduced by Rs 29 per litre to Rs 163 per litre each.</p><p>The recent hike in fuel prices has sparked multiple demonstrations and protests in the capital.</p><p>The NOC has raised the price of petroleum products dozens of times in line with the rates sent to it by the Indian Oil Corporation.</p><p>During its most recent revision, it had hiked the price of petrol by Rs 21 a litre, while the prices of diesel and kerosene had been raised by Rs 27 per litre. The price of domestic aviation fuel had also been raised by Rs 19 per litre.</p><p>Subsequently, the domestic airline operators as well as the public transport operators had increased their fares, adding to the woes of the general public and further fuelling fears of runaway inflation.</p>',
  }) : super(key: key);

  bool isAssetImage;
  String imagePath;
  String blogTitle;
  String authorName;
  TextStyle nameStyle;
  int lovecount;
  int commentCount;
  TextStyle titleStyle;
  TextStyle countstyle;
  String postDate;
  double readmoreImageHeight;
  String blogDetails;
  bool changeHtmlStyle;
  Map<String, Style>? htmlStyle;

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
                              builder: (context) => ReadMore(
                                title: widget.blogTitle,
                                date: widget.postDate,
                                image: widget.imagePath,
                                isAssetImage: widget.isAssetImage,
                                author: widget.authorName,
                                imageHeight: widget.readmoreImageHeight,
                                blogDetails: widget.blogDetails,
                                changeHtmlStyle: widget.changeHtmlStyle,
                                htmlTextstyle: widget.htmlStyle,
                              ),
                            ),
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
                        widget.postDate,
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
