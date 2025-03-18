// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:io';

// class ExploreScreen extends StatefulWidget {
//   const ExploreScreen({super.key});

//   @override
//   ExploreScreenState createState() => ExploreScreenState();
// }

// class ExploreScreenState extends State<ExploreScreen> {
//   final ImagePicker _picker = ImagePicker();
//   bool _isUploading = false;

//   Future<void> _uploadDesign() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) return;

//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image == null) return;

//     setState(() {
//       _isUploading = true;
//     });

//     File file = File(image.path);
//     String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
//     Reference storageRef =
//         FirebaseStorage.instance.ref().child('designs/$fileName');

//     try {
//       UploadTask uploadTask = storageRef.putFile(file);
//       TaskSnapshot snapshot = await uploadTask;
//       String imageUrl = await snapshot.ref.getDownloadURL();

//       await FirebaseFirestore.instance.collection('designs').add({
//         'imageUrl': imageUrl,
//         'description': 'A new design by ${user.displayName ?? "User"}',
//         'likes': 0,
//         'userId': user.uid,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Design uploaded successfully!")),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Upload failed: $e")),
//       );
//     }

//     setState(() {
//       _isUploading = false;
//     });
//   }

//   Future<void> _likeDesign(String docId, int currentLikes) async {
//     await FirebaseFirestore.instance
//         .collection('designs')
//         .doc(docId)
//         .update({'likes': currentLikes + 1});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Explore Designs"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add_a_photo),
//             onPressed: _uploadDesign,
//           ),
//         ],
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('designs')
//             .orderBy('timestamp', descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return const Center(child: Text("No designs shared yet."));
//           }

//           return ListView(
//             padding: const EdgeInsets.all(10),
//             children: snapshot.data!.docs.map((doc) {
//               var data = doc.data() as Map<String, dynamic>;
//               return Card(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//                 margin: const EdgeInsets.only(bottom: 15),
//                 elevation: 3,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(12)),
//                       child: Image.network(
//                         data['imageUrl'],
//                         width: double.infinity,
//                         height: 200,
//                         fit: BoxFit.cover,
//                         loadingBuilder: (context, child, loadingProgress) {
//                           if (loadingProgress == null) return child;
//                           return ClipRRect(
//                             borderRadius: const BorderRadius.vertical(
//                                 top: Radius.circular(12)),
//                             child: Container(
//                               width: double.infinity,
//                               height: 200,
//                               color: Colors.grey[300],
//                               child: const Center(
//                                 child: CircularProgressIndicator(),
//                               ),
//                             ),
//                           );
//                         },
//                         errorBuilder: (context, error, stackTrace) {
//                           return ClipRRect(
//                             borderRadius: const BorderRadius.vertical(
//                                 top: Radius.circular(12)),
//                             child: Container(
//                               width: double.infinity,
//                               height: 200,
//                               color: Colors.grey[300],
//                               child: const Center(
//                                 child: Icon(Icons.broken_image,
//                                     size: 50, color: Colors.grey),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Text(
//                         data['description'],
//                         style: const TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.favorite,
//                                     color: Colors.red),
//                                 onPressed: () =>
//                                     _likeDesign(doc.id, data['likes']),
//                               ),
//                               Text("${data['likes']} Likes"),
//                             ],
//                           ),
//                           const Icon(Icons.share, color: Colors.grey),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }).toList(),
//           );
//         },
//       ),
//       floatingActionButton: _isUploading
//           ? const CircularProgressIndicator()
//           : null,
//     );
//   }
// }
