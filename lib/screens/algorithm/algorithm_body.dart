import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AlgorithmBody extends StatelessWidget {
  const AlgorithmBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final List<MenuData> menu = [
      // https://www.flaticon.es/icono-gratis/sistema-de-gestion-de-contenidos_2535488?related_id=2535488
      const MenuData(
        coverImg: "https://cdn-icons-png.flaticon.com/512/2535/2535476.png",
        title: "BUBBLE SORT",
        description:
            "El ordenamiento de burbuja es un sencillo algoritmo de ordenamiento. Funciona revisando cada elemento...",
        route: "/algorithm-details",
      ),
      const MenuData(
        coverImg: "https://cdn-icons-png.flaticon.com/512/2535/2535476.png",
        title: "BUBBLE SORT",
        description:
            "El ordenamiento de burbuja es un sencillo algoritmo de ordenamiento. Funciona revisando cada elemento...",
        route: "/algorithm-details",
      ),
      const MenuData(
        coverImg: "https://cdn-icons-png.flaticon.com/512/2535/2535476.png",
        title: "BUBBLE SORT",
        description:
            "El ordenamiento de burbuja es un sencillo algoritmo de ordenamiento. Funciona revisando cada elemento...",
        route: "/algorithm-details",
      ),
      const MenuData(
        coverImg: "https://cdn-icons-png.flaticon.com/512/2535/2535476.png",
        title: "BUBBLE SORT",
        description:
            "El ordenamiento de burbuja es un sencillo algoritmo de ordenamiento. Funciona revisando cada elemento...",
        route: "/algorithm-details",
      ),
      const MenuData(
        coverImg: "https://cdn-icons-png.flaticon.com/512/2535/2535476.png",
        title: "BUBBLE SORT",
        description:
            "El ordenamiento de burbuja es un sencillo algoritmo de ordenamiento. Funciona revisando cada elemento...",
        route: "/algorithm-details",
      ),
      const MenuData(
        coverImg: "https://cdn-icons-png.flaticon.com/512/2535/2535476.png",
        title: "BUBBLE SORT",
        description:
            "El ordenamiento de burbuja es un sencillo algoritmo de ordenamiento. Funciona revisando cada elemento...",
        route: "/algorithm-details",
      ),
    ];
    /*return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: menu.length,
      itemBuilder: (context, index) {
        final MenuData item = menu[index];
        return InkWell(
            onTap: () {
              Navigator.pushNamed(context, item.route);
            },
            child: Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.network(
                      item.coverImg,
                      width: 90,
                      height: 90,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.description,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );*/
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('modules').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<DocumentSnapshot> docs = snapshot.data!.docs;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot doc = docs[index];
              return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, doc['route']);
                  },
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Image.network(
                            doc['coverImage'],
                            width: 90,
                            height: 90,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doc['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  doc['name'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          );
        });
  }
}

class MenuData {
  const MenuData(
      {required this.coverImg,
      required this.title,
      required this.description,
      required this.route});

  final String coverImg;

  final String title;

  final String description;

  final String route;
}
