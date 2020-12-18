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