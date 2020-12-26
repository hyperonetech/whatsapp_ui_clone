import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:whatsapp_ui_clone/models/ConversationModel.dart';
import 'package:flutter/services.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        ListTile(
          leading: Container(
            height: 60,
            width: 60,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://www.w3schools.com/howto/img_avatar.png",
                      width: 55,
                      height: 55,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ClipOval(
                    child: Container(
                      color: Color(0xFF25D366),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            "My status",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            "Tap to add status update",
            style: TextStyle(color: Colors.black54, fontSize: 15),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black12.withOpacity(0.1),
          padding: EdgeInsets.all(8),
          child: Text(
            "Recent updates",
            style: TextStyle(
                color: Colors.black87.withOpacity(0.6),
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
        ),
        Container(
          height: storylist.length * 73.5.toDouble(),
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemCount: storylist.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Story()));
                },
                child: ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    child: Stack(
                      children: [
                        Center(
                          child: Story_ring(
                            seen: storylist[index].seen,
                            story: storylist[index].noofstory,
                            width: 24,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 45,
                            height: 45,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: storylist[index].image,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    storylist[index].title,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    storylist[index].date,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.only(left: 80,right: 20),
                  child: Divider(
                    height: 2,
                    color: Colors.grey,
                  ));
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black12.withOpacity(0.1),
          padding: EdgeInsets.all(8),
          child: Text(
            "Viewed updates",
            style: TextStyle(
                color: Colors.black87.withOpacity(0.6),
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
        ),
        Container(
          height: seenstory.length * 73.5.toDouble(),
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemCount: seenstory.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Story()));
                },
                child: ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    child: Stack(
                      children: [
                        Center(
                          child: Story_ring(
                            seen: seenstory[index].seen,
                            story: seenstory[index].noofstory,
                            width: 24,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 45,
                            height: 45,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: seenstory[index].image,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    seenstory[index].title,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    seenstory[index].date,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.only(left: 80,right: 20),
                  child: Divider(
                    height: 2,
                    color: Colors.grey,
                  ));
            },
          ),
        )
      ],
    ));
  }
}

class Story_ring extends StatelessWidget {
  int story, seen;
  double width;

  Story_ring({this.seen, this.story, this.width});

  List<PieChartSectionData> data() {
    List<PieChartSectionData> dt = [];
    for (int i = 0; i < story; i++) {
      dt.add(PieChartSectionData(
          value: 1.0,
          radius: 3,
          showTitle: false,
          color: i < seen ? Colors.grey : Color(0xFF25D366)));
    }
    return dt;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RotatedBox(
      quarterTurns: 2,
      child: PieChart(PieChartData(
        centerSpaceRadius: width,
        borderData: FlBorderData(
          show: false,
        ),
        sections: data(),
      )),
    );
  }
}

class Story extends StatelessWidget {
  final StoryController controller = StoryController();

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: Container(
            padding: EdgeInsets.all(1.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: ClipOval(
              child: Image.network(
                  'https://guidanceandcounsellingui.org/images/testimonials/avatar2.png'),
            ),
          ),
          title: Text(
            "Riya",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            "12,2,3",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: StoryView(
          controller: controller,

          onVerticalSwipeComplete: (value) {
            print("reply");
          },
          storyItems: [
            StoryItem.text(
              title:
              "Hello world!\nHave a look at some great Ghanaian delicacies. I'm sorry if your mouth waters. \n\nTap!",
              backgroundColor: Colors.orange,
              roundedTop: true,
            ),
            // StoryItem.inlineImage(
            //   NetworkImage(
            //       "https://image.ibb.co/gCZFbx/Banku-and-tilapia.jpg"),
            //   caption: Text(
            //     "Banku & Tilapia. The food to keep you charged whole day.\n#1 Local food.",
            //     style: TextStyle(
            //       color: Colors.white,
            //       backgroundColor: Colors.black54,
            //       fontSize: 17,
            //     ),
            //   ),
            // ),
            StoryItem.inlineImage(
              url:
              "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg",
              controller: controller,


            ),
            StoryItem.inlineImage(
              url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
              controller: controller,

            ),
            StoryItem.text(
              title:
              "hey its working",
              backgroundColor: Colors.cyan,
              roundedTop: true,
            ),
          ],
          onStoryShow: (s) {
            print("Showing a story");
          },
          onComplete: () {
            Navigator.pop(context);
          },

          repeat: false,
          inline: false,
          progressPosition: ProgressPosition.bottom,

        ),
      ),
    );
  }
}

