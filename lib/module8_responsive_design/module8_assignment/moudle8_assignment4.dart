import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProfileHomeScreen(),
      title: "Profile Layout App",
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileHomeScreen extends StatelessWidget {
  const ProfileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      height: 200,
                      width: 200,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.studioforty9.com/cdn/shop/articles/SF9_Blog_Banner_Image_935x550px_6.png?v=1687171917"),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet turpis eu enim tristique, in iaculis libero porttitor.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 21,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          return Image.network(
                            "https://www.studioforty9.com/cdn/shop/articles/SF9_Blog_Banner_Image_935x550px_6.png?v=1687171917",
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.studioforty9.com/cdn/shop/articles/SF9_Blog_Banner_Image_935x550px_6.png?v=1687171917"),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(
                      width: 150,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet turpis eu enim tristique.",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 21,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return Image.network(
                      "https://www.studioforty9.com/cdn/shop/articles/SF9_Blog_Banner_Image_935x550px_6.png?v=1687171917",
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
