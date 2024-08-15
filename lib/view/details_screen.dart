import 'package:app_users/model/user_model2.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final UserData userData;
  Detail({super.key, required this.userData});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 22, 121, 171),
          title: const Text(
            'Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      color: Colors.black45, blurRadius: 10, spreadRadius: 5)
                ], borderRadius: BorderRadius.circular(10)),
                child: Hero(
                  tag: widget.userData.avatar.toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: widget.userData.avatar.toString(),
                      height: size.height * 0.40,
                      width: size.width * 0.60,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, color: Colors.red),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                " first name : ${widget.userData.firstName.toString()}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                " last name : ${widget.userData.lastName.toString()}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                " email  : ${widget.userData.email.toString()}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                textAlign: TextAlign.center,
                " Descripion :A personal blog is your digital diary, a canvas where you paint with words. This snug nook online ",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
