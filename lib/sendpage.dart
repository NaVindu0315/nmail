import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sendgrid_mailer/sendgrid_mailer.dart';

late String mail;
late String subject;
late String message;

TextEditingController cmail = new TextEditingController();
TextEditingController csub = new TextEditingController();
TextEditingController cmsg = new TextEditingController();
Future<void> sendm(tom, mmsg, msub) async {
  final mailer = Mailer(
      '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');
  final toAddress = Address(tom);
  final fromAddress = Address('nmails6969@gmail.com');
  final content = Content('text/plain', mmsg);
  final subject = msub;
  final personalization = Personalization([toAddress]);
  final ads = 'nmail';

  final email =
      Email([personalization], fromAddress, subject, content: [content]);
  mailer.send(email).then((result) {
    // ...
  });
}

class sendmail extends StatefulWidget {
  @override
  _sendmailState createState() => _sendmailState();
}

class _sendmailState extends State<sendmail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          title: Text(
            'Nmail',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.purple[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: cmail,
                  onChanged: (value) {
                    mail = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    labelText: 'To',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: csub,
                  onChanged: (value) {
                    subject = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.text_fields,
                    ),
                    labelText: 'Subject',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: cmsg,
                  onChanged: (value) {
                    message = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.message,
                    ),
                    labelText: 'Message',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    sendm(mail, subject, message);
                    cmsg.clear();
                    csub.clear();
                    cmail.clear();

                    /*Alert(
                      context: context,
                      type: AlertType.success,
                      title: "Email Sent",
                      desc: "Email Succesfully sent to $mail.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "ok",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {

                            Navigator.pop(context);
                          },
                          width: 120,
                        )
                      ],
                    ).show();*/

                    // Handle submit button press
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
