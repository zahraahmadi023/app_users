import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Center(
                child: Text(
              "Profile",
              style: TextStyle(color: Colors.white),
            )),
            backgroundColor: Color.fromARGB(255, 22, 121, 171),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "My accont ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://img.freepik.com/free-vector/illustration-user-avatar-icon_53876-5908.jpg?uid=R156493205&ga=GA1.2.692341463.1723471430&semt=ais_hybrid",
                  height: size.height * 0.15,
                  width: size.width * 0.30,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )),
    );
  }
}
