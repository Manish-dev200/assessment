import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assessment/common/color/colors.dart';
import 'package:assessment/dashboard/business/use%20case/api.dart';
import 'package:assessment/dashboard/presentation/widget/dashBoard_widget.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiProvider>(context, listen: false).fetchData(context);
    });

    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        Provider.of<ApiProvider>(context, listen: false).fetchData(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: DashboardWidget.appBar(),
      body: Consumer<ApiProvider>(
        builder: (context, provider, child) => provider.isLoading &&
                provider.dataList.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      'Showing ${provider.dataList.length} Courses',
                      style:
                          const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: controller,
                      padding: const EdgeInsets.only(top: 10),
                      itemCount: provider.dataList.length +
                          (provider.isLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index < provider.dataList.length) {
                          return DashboardWidget.product(
                            imagePath:
                                provider.dataList[index].image.toString(),
                            text: provider.dataList[index].title.toString(),
                            initialRating: provider
                                .dataList[index].rating!.rate!
                                .toDouble(),
                            rating: provider.dataList[index].rating!.rate!
                                .toDouble(),
                            count:
                                provider.dataList[index].rating!.count!.toInt(),
                            price: provider.dataList[index].price!.toDouble(),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
