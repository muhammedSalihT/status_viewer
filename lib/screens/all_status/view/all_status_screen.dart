import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_viewer_app/constents/const_color.dart';
import 'package:status_viewer_app/screens/all_status/view_model/all_status_provider.dart';
import 'package:status_viewer_app/utils/custom_text_widget.dart';

class AllStatusScreen extends StatelessWidget {
  const AllStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allStatusProvider = context.read<AllStatusProvider>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomTextWidget(
          text: "Status Viewer",
          textColor: AppColors.appWhite,
          textSize: 30,
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: SizedBox(
        child: ListView(
          children: [
            ListTile(
              leading: Stack(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuIbv-7JSgC23hcGq8qDRBpFzdMBEw8urHdQ&usqp=CAU"),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.appBarColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(1, 1),
                            color: AppColors.grey.withOpacity(0.5),
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.appWhite,
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
              title: const CustomTextWidget(text: "My Status"),
              subtitle:
                  const CustomTextWidget(text: "Tap to add status update"),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: const CustomTextWidget(text: "Recent Updates"),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final result = allStatusProvider.eachList[index];
                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: AppColors.appWhite,
                      border:
                          Border.all(color: AppColors.appBarColor, width: 2),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(result.personImage!),
                        ),
                      ),
                    ),
                  ),
                  title: CustomTextWidget(
                    text: result.personName!,
                  ),
                  subtitle: CustomTextWidget(
                    text: result.statusTime!,
                    textSize: 18,
                  ),
                );
              },
              itemCount: allStatusProvider.eachList.length,
              separatorBuilder: (context, _) {
                return const SizedBox(
                  height: 20,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
