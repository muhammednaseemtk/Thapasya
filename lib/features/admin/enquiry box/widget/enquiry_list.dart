import 'package:flutter/material.dart';
import 'package:thapasya/features/admin/enquiry%20box/widget/enquiry_item.dart';

class EnquiryList extends StatelessWidget {
  const EnquiryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: const Row(
              children: [
                Text(
                  "All Enquiries (7)",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 550, 
            child: ListView(
              children: const [
                EnquiryItem(
                  title: "Asking about scholarship programs",
                  time: "Just now",
                  showDot: false,
                ),
                EnquiryItem(
                  name: "Neha Sharma",
                  title: "Interested in science stream admission",
                  time: "Just now",
                ),
                EnquiryItem(
                  name: "Ramesh Gupta",
                  title:
                      "I would like to know about the admission process for Class I",
                  time: "Just now",
                ),
                EnquiryItem(
                  name: "Sunita Desai",
                  title:
                      "What are the extracurricular activities available?",
                  time: "5 minutes ago",
                ),
                EnquiryItem(
                  name: "Vikram Singh",
                  title:
                      "Please share the fee structure for senior secondary",
                  time: "1 hour ago",
                ),
                EnquiryItem(
                  name: "Priya Nambiar",
                  title: "Is there a hostel facility available?",
                  time: "2 hours ago",
                ),
                EnquiryItem(
                  name: "Vikram Singh",
                  title:
                      "Please share the fee structure for senior secondary",
                  time: "1 hour ago",
                ),
                EnquiryItem(
                  name: "Priya Nambiar",
                  title: "Is there a hostel facility available?",
                  time: "2 hours ago",
                ),
                EnquiryItem(
                  name: "Vikram Singh",
                  title:
                      "Please share the fee structure for senior secondary",
                  time: "1 hour ago",
                ),
                EnquiryItem(
                  name: "Priya Nambiar",
                  title: "Is there a hostel facility available?",
                  time: "2 hours ago",
                ),
                EnquiryItem(
                  name: "Vikram Singh",
                  title:
                      "Please share the fee structure for senior secondary",
                  time: "1 hour ago",
                ),
                EnquiryItem(
                  name: "Priya Nambiar",
                  title: "Is there a hostel facility available?",
                  time: "2 hours ago",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}