// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tec_blog_new/components/my_colors.dart';
import 'package:tec_blog_new/controller/post_article_controller.dart';

class HtmlEditingArticleScreen extends StatelessWidget {
  HtmlEditingArticleScreen({super.key});
  HtmlEditorController controller =
      HtmlEditorController(processNewLineAsBr: true);
  PostArticleController postArticleController =
      Get.put(PostArticleController());
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        controller.clearFocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: Get.height / 16.5,
                        width: Get.height / 16.5,
                        decoration: BoxDecoration(
                            color: MyColors.purpleAccentColor,
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'ویرایش / نوشتن مقاله',
                        style: textTheme.titleSmall!
                            .copyWith(color: MyColors.purpleAccentColor),
                      )
                    ],
                  ),
                  HtmlEditor(
                    controller: controller,
                    htmlEditorOptions: HtmlEditorOptions(
                      hint: '... متن مقاله خود را اینجا بنویسید',
                    ),
                    htmlToolbarOptions: HtmlToolbarOptions(
                        toolbarType: ToolbarType.nativeGrid,
                        defaultToolbarButtons: [
                          ParagraphButtons(textDirection: true)
                        ]),
                    callbacks: Callbacks(onChangeContent: (p0) {
                      postArticleController.firstContent.value =
                          p0!.toString().split('<p>').last.split('</p>').first;
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
