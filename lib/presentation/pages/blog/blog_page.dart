import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mau_lab_tech_test/presentation/base/base_view.dart';
import 'package:mau_lab_tech_test/presentation/pages/blog/args.dart';
import 'package:mau_lab_tech_test/presentation/pages/blog/blog_controller.dart';

class BlogPage extends BasePage<BlogController> {
  BlogPage({
    Key? key,
    required super.controller,
    required this.arguments,
  }) : super(key: key) {
    controller.setArguments(arguments);
  }

  static const String route = '/blog_detail';

  final BlogDetailArguments arguments;

  @override
  Widget get view => ControlledWidgetBuilder<BlogController>(
        builder: (context, controller) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  Size size = MediaQuery.of(context).size;
                  return <Widget>[
                    SliverAppBar(
                      iconTheme: const IconThemeData(color: Colors.white),
                      floating: true,
                      expandedHeight: 300,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: controller.arguments.blog.image,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: size.width,
                                  height: size.height,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                fit: BoxFit.cover,
                                placeholder: (context, url) => SizedBox(
                                  width: size.width,
                                  height: size.height,
                                  child: const Center(
                                      child: CupertinoActivityIndicator()),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [Colors.black, Colors.transparent],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Text(
                                controller.arguments.blog.blogAuthor ?? "",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 5,
                                      color: Colors.black,
                                    ),
                                    Shadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 8,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 35,
                              child: SizedBox(
                                  width: size.width,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text(
                                          controller.arguments.blog.title,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ];
                },
                body: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(controller.arguments.blog.blogContent!)),
                ),
              ),
            ),
          );
        },
      );
}
