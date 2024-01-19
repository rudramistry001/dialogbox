import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Dialog Example'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                showPdfDialog(context);
              },
              child: const Text('Open Image Dialog for both pdf '),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Show the image dialog
              showImageDialog(context);
            },
            child: const Text('Open Image Dialog only for Images'),
          ),
        ],
      ),
    );
  }

//   void showImageAndPdfDialog(BuildContext context,
//       {String? imageUrl, String? pdfUrl}) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return CustomImageAndPdfDialog(
//             imageUrl: imageUrl ?? "",
//             pdfUrl: pdfUrl ??
//                 "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf");
//       },
//     );
//   }
// }

  void showImageDialog(
    BuildContext context, {
    String? imageUrl,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomImageDialog(
          imageUrl: imageUrl ?? "https://picsum.photos/250?image=9",
        );
      },
    );
  }
}

void showPdfDialog(
  BuildContext context, {
  String? pdfUrl,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const CustomPdfDialog();
    },
  );
}
// class CustomImageAndPdfDialog extends StatelessWidget {
//   final String imageUrl;
//   final String pdfUrl;

//   const CustomImageAndPdfDialog(
//       {super.key, required this.imageUrl, required this.pdfUrl});

//   @override
//   Widget build(BuildContext context) {
//     if (pdfUrl.isNotEmpty) {
//       // Display PDF
//       return AlertDialog(
//         title: const Text('PDF Document View'),
//         content: SizedBox(
//           width: 800, // Adjust the width as needed
//           height: 500, // Adjust the height as needed
//           child: FutureBuilder<PDFDocument>(
//             future: PDFDocument.fromURL(pdfUrl),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return PDFViewer(document: snapshot.data!);
//               } else if (snapshot.hasError) {
//                 return Text('Error loading PDF: ${snapshot.error}');
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Close'),
//           ),
//         ],
//       );
//     } else {
//       // Display Image
//       return AlertDialog(
//         title: const Text('Image Document View'),
//         content: SizedBox(
//           width: 800, // Adjust the width as needed
//           height: 500, // Adjust the height as needed
//           child: PhotoViewGallery.builder(
//             itemCount: 1,
//             builder: (context, index) {
//               return PhotoViewGalleryPageOptions(
//                 imageProvider: NetworkImage(imageUrl),
//                 minScale: PhotoViewComputedScale.contained * 0.8,
//                 maxScale: PhotoViewComputedScale.covered * 2,
//               );
//             },
//             scrollPhysics: const BouncingScrollPhysics(),
//             backgroundDecoration: const BoxDecoration(
//               color: Colors.black,
//             ),
//             pageController: PageController(),
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Close'),
//           ),
//         ],
//       );
//     }
//   }
// }

class CustomImageDialog extends StatelessWidget {
  final String imageUrl;

  const CustomImageDialog({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Display Image
    return AlertDialog(
      title: const Text('Image Document View'),
      content: SizedBox(
        width: 800, // Adjust the width as needed
        height: 500, // Adjust the height as needed
        child: PhotoViewGallery.builder(
          itemCount: 1,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(imageUrl),
              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
            );
          },
          scrollPhysics: const BouncingScrollPhysics(),
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          pageController: PageController(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

class CustomPdfDialog extends StatelessWidget {
  final String pdfUrl =
      "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf";

  const CustomPdfDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('PDF Document View'),
      content: SizedBox(
          width: 800,
          height: 500,
          child: SfPdfViewer.network(
            pdfUrl,
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
