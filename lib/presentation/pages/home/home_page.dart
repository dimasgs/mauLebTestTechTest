import 'package:flutter/cupertino.dart';
import 'package:mau_lab_tech_test/presentation/base/base_view.dart';
import 'package:mau_lab_tech_test/presentation/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:mau_lab_tech_test/presentation/widget/candidate_item.dart';
import 'package:mau_lab_tech_test/presentation/widget/error_widget.dart';

class HomePage extends BasePage<HomeController> {
  HomePage({Key? key, required super.controller}) : super(key: key);

  static const String route = '/home';

  @override
  Widget get view => ControlledWidgetBuilder<HomeController>(
        builder: (context, controller) {
          return SafeArea(
              child: Scaffold(
            key: globalKey,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: controller.isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : controller.error != ""
                      ? ErrorDialog(
                          error: controller.error,
                          onRefresh: () {
                            controller.initListeners();
                          },
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: TextField(
                                  onChanged: (value) {
                                    controller.filterSearchResults(value);
                                  },
                                  controller: controller.searchTextController,
                                  decoration: const InputDecoration(
                                      labelText: "Search",
                                      hintText: "Search",
                                      prefixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25.0)))),
                                ),
                              ),
                              const SizedBox(height: 10),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.candidateWithBlog.length,
                                itemBuilder: (_, index) {
                                  var item =
                                      controller.candidateWithBlog[index];
                                  return Column(
                                    children: [
                                      HomeItem(
                                        title: item.title,
                                        imageUrlPath: item.image,
                                        onDetailPressed: () {
                                          item.blogCreatedAt != null
                                              ? controller.gotoDetailBlog(item)
                                              : controller
                                                  .gotoDetailCandidate(item);
                                        },
                                        date: item.blogCreatedAt != null
                                            ? controller.formatDate(
                                                item.blogCreatedAt.toString())
                                            : controller.formatDate(item
                                                .candidateBirthDate
                                                .toString()),
                                        blogAuthor: item.blogAuthor,
                                      ),
                                      if (index !=
                                          controller.candidateWithBlog.length -
                                              1) ...[const SizedBox(height: 8)],
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
            ),
          ));
        },
      );
}
