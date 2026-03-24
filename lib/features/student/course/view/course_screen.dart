import 'package:Thapasya/features/student/course/widget/course_card.dart';
import 'package:Thapasya/features/student/home/widget/common_app_bar.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CommonAppBar(),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text('My Course',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            CourseCard()
          ],
        ),
      ),
    );
  }
}