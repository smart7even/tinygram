import 'package:flutter/material.dart';
import 'package:tinygram/constants.dart';
import 'package:tinygram/features/home/presentation/widgets/app_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: const Text("Tinygram"),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              isScrollable: true,
              controller: tabController,
              indicatorColor: const Color(0xFFFDFBF8),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              tabs: const [
                AppTab(
                  title: 'All',
                  unreadMessagesCounter: 10,
                ),
                AppTab(
                  title: 'Personal',
                  unreadMessagesCounter: 0,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () {},
        elevation: 0,
        backgroundColor: AppColors.blue,
      ),
      drawer: const Drawer(),
      body: TabBarView(
        controller: tabController,
        children: const [
          Center(
            child: Text("All messages"),
          ),
          Center(
            child: Text("Personal messages"),
          )
        ],
      ),
    );
  }
}
