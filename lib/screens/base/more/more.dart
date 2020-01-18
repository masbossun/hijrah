import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hijrah/widgets/styled_underline.dart';
import 'package:hijrah/widgets/topbar.dart';

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Topbar(
        title: 'LAINNYA',
        iconButton: IconButton(
          icon: Icon(
            FeatherIcons.settings,
          ),
          onPressed: () {},
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(24, 16, 24, 0),
          child: ListView(
            children: <Widget>[
              Section(
                title: 'Tentang Aplikasi',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ut commodo risus. Aliquam sagittis enim quis nisl ornare posuere. Duis ex lacus, mollis ac viverra vel, tempor sed nulla. Donec consectetur, quam non feugiat sagittis, magna ex posuere diam, et ornare diam ipsum vitae nisl. Ut congue suscipit justo, ut consectetur erat lobortis nec. Sed efficitur urna ac tellus venenatis luctus. Nulla eget neque venenatis, venenatis turpis et, elementum nunc. Proin interdum semper sem, tempus suscipit ligula posuere nec. Suspendisse porttitor augue velit, in pulvinar metus congue quis. Vivamus gravida dui ut elementum varius. Nulla ac gravida felis. Suspendisse eget diam ligula. Aliquam vitae odio at nibh gravida pharetra at ullamcorper diam. ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    Key key,
    @required this.title,
    @required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                String.fromCharCode(0x2014),
                style: Theme.of(context).textTheme.headline,
              ),
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Stack(
                  children: <Widget>[
                    StyledUnderline(),
                    Container(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.display2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.body1,
          ),
        ],
      ),
    );
  }
}
