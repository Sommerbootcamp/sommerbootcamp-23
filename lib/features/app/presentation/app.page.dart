import 'package:flutter/material.dart';

/// Home
class Home extends StatelessWidget {
  /// constructor
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juhu'),
      ),
      body: const Center(
        child: Text('Home from app Page'),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// // /// App Main Page
// // class AppPage extends ConsumerWidget {
// //   /// constructor
// //   const AppPage({super.key});
// //
// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     return Container();
// //   }
// // }
//
// class AppPage extends StatefulWidget {
//   const AppPage({Key? key}) : super(key: key);
//
//   @override
//   State<AppPage> createState() => _AppPageState();
// }
//
// class _AppPageState extends State<AppPage> {
//   int currentPageIndex = 0;
//   final pages = [
//     FeedPage(),
//     const Placeholder(),
//     const Placeholder(),
//     const Placeholder(),
//     const SettingsPage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sommerbootcamp \'23'),
//         actions: _appBarActions(),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         onTap: (int index) {
//           setState(() {
//             currentPageIndex = index;
//           });
//         },
//         currentIndex: currentPageIndex,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
//           BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
//        BottomNavigationBarItem(icon: Icon(Icons.scoreboard), label: 'Score'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), label: 'Settings'),
//         ],
//       ),
//       body: pages[currentPageIndex],
//     );
//   }
//
//   List<Widget> _appBarActions() {
//     if (0 == currentPageIndex) {
//       return [
//         IconButton(
//           onPressed: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (_) => const AddPost(),
//               ),
//             );
//           },
//           icon: const Icon(Icons.add_box_outlined),
//         ),
//       ];
//     }
//
//     return [];
//   }
// }
