class Chat {
  String name;
  String image;
  String message;
  String date;
  int count;

  Chat(
      {this.name, this.image, this.message, this.date, this.count});

  Chat.fromJson(Map<String, dynamic> json) {
    name = json['full_name'];
    image = json['image'];
    message = json['message'];
    date = json['date'];
    count = json['message_cout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.name;
    data['image'] = this.image;
    data['message'] = this.message;
    data['date'] = this.date;
    data['message_cout'] = this.count;
    return data;
  }
}


List<Chat> chatdata =[

  Chat(name: '+91 95857*****',image: 'https://www.w3schools.com/howto/img_avatar.png',message: 'hello',date: '12:00',count: 2),
  Chat(name: 'Riya ',image: 'https://image.freepik.com/free-vector/smiling-girl-avatar_102172-32.jpg',message: 'how are you',date: '15/12/2020',count: 0),
  Chat(name: 'Rohan Shah',image: 'https://guidanceandcounsellingui.org/images/testimonials/avatar2.png',message: 'i am fine',date: '16/12/20',count: 4),
 ];

class Story{

  String title,date;
  String image;
  int noofstory,seen;
  Story({

    this.title,this.image,this.date,this.seen,this.noofstory
});
}class Call{

  String title,date;
  String image;
  bool incoming,video;

  Call({

    this.title,this.image,this.date, this.video,this.incoming
});
}

List storylist=[

  Story(title: "Rohan Joshi",date: "Today,14:38",image: 'https://guidanceandcounsellingui.org/images/testimonials/avatar2.png',noofstory: 4,seen: 2),
  Story(title: "Alex Roy",date: "Today,13:38",image: 'https://image.freepik.com/free-vector/smiling-girl-avatar_102172-32.jpg',noofstory: 3,seen: 2),
  Story(title: "Riya",date: "Today,8:38",image: 'https://guidanceandcounsellingui.org/images/testimonials/avatar2.png',noofstory: 1,seen: 0),
  Story(title: "Nick",date: "Today,6:38",image: 'https://guidanceandcounsellingui.org/images/testimonials/avatar2.png',noofstory: 4,seen: 2),
  Story(title: "Alex Ros",date: "Today,4:38",image: 'https://image.freepik.com/free-vector/smiling-girl-avatar_102172-32.jpg',noofstory: 3,seen: 2),
];
List seenstory=[

  Story(title: "Rohan Joshi",date: "Today,14:38",image: 'https://guidanceandcounsellingui.org/images/testimonials/avatar2.png',noofstory: 4,seen: 4),
  Story(title: "Alex Roy",date: "Today,13:38",image: 'https://image.freepik.com/free-vector/smiling-girl-avatar_102172-32.jpg',noofstory: 3,seen: 3),
  Story(title: "Riya",date: "Today,8:38",image: 'https://guidanceandcounsellingui.org/images/testimonials/avatar2.png',noofstory: 1,seen: 1),
];

List<Call> calls=[

  Call(title: "Rohan Joshi",date: "Today,14:38",image: 'https://guidanceandcounsellingui.org/images/testimonials/avatar2.png',incoming: true,video: false),
  Call(title: "Alex Roy",date: "Today,13:38",image: 'https://image.freepik.com/free-vector/smiling-girl-avatar_102172-32.jpg',incoming: false,video: true),
  Call(title: "Riya",date: "Today,8:38",image: 'https://guidanceandcounsellingui.org/images/testimonials/avatar2.png',incoming: true,video: false),
  Call(title: "Nick",date: "Today,6:38",image: 'https://guidanceandcounsellingui.org/images/testimonials/avatar2.png',incoming: true,video: true),
  Call(title: "Alex Ros",date: "Today,4:38",image: 'https://image.freepik.com/free-vector/smiling-girl-avatar_102172-32.jpg',incoming: false,video: true),
];