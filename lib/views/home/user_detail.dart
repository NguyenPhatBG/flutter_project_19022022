import 'package:flutter/material.dart';
import 'package:project_19022022/models/response/user/user_list_response.dart';
import 'package:project_19022022/shared/app_colors.dart';
import 'package:project_19022022/shared/app_constants.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final int id = arguments['id'];
    final UserListResponse user = arguments['user'];
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail ($id)'),
        backgroundColor: AppColors.primary,
      ),
      body: Align(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1,
                    color: AppColors.secondary,
                    spreadRadius: 0.2,
                  )
                ],
              ),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  user.data[id - 1].avatar,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${user.data[id - 1].first_name} ${user.data[id].last_name}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              user.data[id - 1].email,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.kPadding / 2,
              ),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What is Lorem Ipsum?',
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: const TextSpan(
                            text: 'Lorem Ipsum ',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 15),
                            children: [
                              TextSpan(
                                text:
                                    "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
