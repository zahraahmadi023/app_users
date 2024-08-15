import 'package:app_users/provider/user_provider.dart';
import 'package:app_users/view/details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Provider.of<UserController>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text("list users", style: TextStyle(color: Colors.white))),
          backgroundColor: Color.fromARGB(255, 22, 121, 171),
        ),
        body: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                itemCount: controller.users.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(
                              userData: controller.users[index],
                            ),
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 8, bottom: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 210, 227, 252),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Hero(
                              tag: controller.users[index].avatar.toString(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      controller.users[index].avatar.toString(),
                                  height: size.height * 0.15,
                                  width: size.width * 0.30,
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error, color: Colors.red),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(controller.users[index].firstName.toString()),
                            Text(controller.users[index].lastName.toString()),
                            Text(controller.users[index].email.toString()),
                          ],
                        ),
                      ),
                    ),
                  );
                }));
  }
}
