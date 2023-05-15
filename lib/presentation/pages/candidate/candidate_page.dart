import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mau_lab_tech_test/presentation/base/base_view.dart';
import 'package:mau_lab_tech_test/presentation/pages/candidate/args.dart';
import 'package:mau_lab_tech_test/presentation/pages/candidate/candidate_controller.dart';
import 'package:mau_lab_tech_test/presentation/widget/error_widget.dart';

class CandidatePage extends BasePage<CandidateController> {
  final CandidateDetailArguments arguments;
  CandidatePage({
    Key? key,
    required super.controller,
    required this.arguments,
  }) : super(key: key) {
    controller.setArguments(arguments);
  }

  static const String route = '/candidate_detail';

  @override
  Widget get view => ControlledWidgetBuilder<CandidateController>(
        builder: (context, controller) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: controller.isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : controller.error != ""
                      ? ErrorDialog(
                          error: controller.error,
                          onRefresh: () {
                            controller.initListeners();
                          },
                        )
                      : NestedScrollView(
                          headerSliverBuilder:
                              (BuildContext context, bool innerBoxIsScrolled) {
                            Size size = MediaQuery.of(context).size;
                            return <Widget>[
                              SliverAppBar(
                                iconTheme:
                                    const IconThemeData(color: Colors.white),
                                floating: true,
                                expandedHeight: 300,
                                flexibleSpace: FlexibleSpaceBar(
                                  background: Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          imageUrl: controller
                                              .arguments.candidate.image,
                                          imageBuilder:
                                              (context, imageProvider) =>
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
                                          placeholder: (context, url) =>
                                              SizedBox(
                                            width: size.width,
                                            height: size.height,
                                            child: const Center(
                                                child:
                                                    CupertinoActivityIndicator()),
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
                                              colors: [
                                                Colors.black,
                                                Colors.transparent
                                              ],
                                            ),
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
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    controller.arguments
                                                        .candidate.title,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Gender: ${controller.arguments.candidate.candidateGender! == 'm' ? 'Male' : "Female"}"),
                                    const SizedBox(height: 8),
                                    Text(
                                        "Email: ${controller.getCandidateDetail().email}"),
                                    const SizedBox(height: 8),
                                    Text(
                                        "Address: ${controller.getCandidateDetail().address}"),
                                    const SizedBox(height: 8),
                                    Text(
                                        "Status: ${controller.getCandidateDetail().status}"),
                                  ],
                                )),
                          ),
                        ),
            ),
          );
        },
      );
}
