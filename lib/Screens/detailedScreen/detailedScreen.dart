// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:news_app/model/news_model.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// class NewsDetailScreen extends StatefulWidget {
//   const NewsDetailScreen({super.key});

//   @override
//   State<NewsDetailScreen> createState() => _NewsDetailScreenState();
// }

// class _NewsDetailScreenState extends State<NewsDetailScreen> {
//   late Article article;
//   bool _isDataLoaded = false;

//   @override
//   void didChangeDependencies() {
//     if (!_isDataLoaded) {
//       final args = ModalRoute.of(context)?.settings.arguments;
//       if (args is Article) {
//         article = args;
//         _isDataLoaded = true;
//       }
//     }
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_isDataLoaded) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }

//     return Scaffold(
//       backgroundColor: Color(0xFFF9F9F9),
//       appBar: AppBar(
//       backgroundColor: Color(0xFFF9F9F9),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           "News Detail",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             fontFamily: "Poppins",
//             color: Colors.black,
//           ),
//         ),
//         elevation: 4,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 article.urlToImage != null && article.urlToImage!.isNotEmpty
//                     ? ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(20),
//                             bottomRight: Radius.circular(20)),
//                         child: Image.network(
//                           article.urlToImage!,
//                           width: double.infinity,
//                           height: 220,
//                           fit: BoxFit.cover,
//                         ),
//                       )
//                     : Container(
//                         height: 220,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[300],
//                           borderRadius: const BorderRadius.only(
//                               bottomLeft: Radius.circular(20),
//                               bottomRight: Radius.circular(20)),
//                         ),
//                         child: const Icon(Icons.image,
//                             size: 80, color: Colors.grey),
//                       ),
//                 Container(
//                   height: 220,
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(20),
//                         bottomRight: Radius.circular(20)),
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         Colors.transparent,
//                         Colors.black.withOpacity(0.6),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15.0, top: 10),
//                   child: Text(
//                     article.title ?? "No Title",
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontFamily: "Poppins",
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 0.6,
//                       height: 1.3,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         // yahan Expanded lagao taaki left wala part jitna space chahiye le sake
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Icon(Icons.person,
//                                 size: 18, color: Colors.grey),
//                             const SizedBox(width: 6),
//                             Flexible(
//                               // yahan Flexible lagao taaki Text wrap ho sake
//                               child: Text(
//                                 (article.author == null ||
//                                         article.author!.isEmpty)
//                                     ? "Unknown"
//                                     : article.author!,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                                 softWrap: true,
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontFamily: "Poppins",
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.grey[700],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           const Icon(Icons.calendar_today,
//                               size: 18, color: Colors.grey),
//                           const SizedBox(width: 6),
//                           Text(
//                             article.publishedAt != null
//                                 ? DateFormat.yMMMMd().format(
//                                     DateTime.parse(article.publishedAt!))
//                                 : "Unknown Date",
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontFamily: "Poppins",
//                               fontWeight: FontWeight.w500,
//                               color: Colors.grey[700],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15.0),
//                   child: Text(
//                     article.content?.isNotEmpty == true
//                         ? article.content!
//                         : (article.description ?? "No description available."),
//                     style: const TextStyle(
//                       fontSize: 15,
//                       fontFamily: "Poppins",
//                       fontWeight: FontWeight.w400,
//                       height: 1.5,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.share,
//                           color: Colors.black, size: 20),
//                       onPressed: () {},
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.bookmark_border,
//                           color: Colors.black, size: 20),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (article.url != null && article.url!.isNotEmpty) {
//                       final url = article.url!;
//                       print("Trying to open: $url");
//                       final launched = await launchUrlString(
//                         url,
//                         mode: LaunchMode.externalApplication,
//                       );
//                       if (!launched) {
//                         // ignore: use_build_context_synchronously
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                               content: Text('Could not open the link')),
//                         );
//                       }
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('No URL found')),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: const Size(320, 40),
//                     backgroundColor: Colors.blue,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text(
//                     "Read More",
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontFamily: "Poppins",
//                       fontWeight: FontWeight.w500,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }