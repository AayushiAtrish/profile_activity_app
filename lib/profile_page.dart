import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(child: _buildBody(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.subdirectory_arrow_left_outlined, color: Colors.white),
              SizedBox(width: 8),
              Text("Profile", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white24),
              boxShadow: [
                BoxShadow(color: Colors.white24, blurRadius: 6, offset: Offset(0, 2)),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                Icon(Icons.chat_bubble_outline, color: Colors.white70, size: 18),
                SizedBox(width: 4),
                Text("support", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHeader(context),
          SizedBox(height: 24),
          _buildGarageTile(),
          SizedBox(height: 24),
          _buildProfileStat("credit score", "757", actionText: "REFRESH AVAILABLE"),
          Divider(color: Colors.white24),
          _buildProfileStat("lifetime cashback", "₹3"),
          Divider(color: Colors.white24),
          _buildProfileStat("bank balance", "check"),
          SizedBox(height: 24),
          Text("YOUR REWARDS & BENEFITS", style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          _buildAnimatedTile("cashback balance", "₹0"),
          SizedBox(height: 12),
          _buildAnimatedTile("coins", "26,46,583"),
          SizedBox(height: 12),
          _buildAnimatedTile("win upto Rs 1000", "refer and earn"),
          SizedBox(height: 24),
          Text("TRANSACTIONS & SUPPORT", style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          _buildAnimatedTile("all transactions", ""),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/editProfile');
          },
          child: Hero(
            tag: 'profile_pic',
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("aayushi atrish", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            Text("member since Dec, 2020", style: TextStyle(color: Colors.white60)),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/editProfile');
          },
          child: Icon(Icons.edit, color: Colors.white60),
        ),
      ],
    );
  }

  Widget _buildGarageTile() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.directions_car, color: Colors.white),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("get to know your vehicles, inside out", style: TextStyle(color: Colors.white60, fontSize: 12)),
              Text("CRED garage", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildProfileStat(String title, String value, {String? actionText}) {
    Icon? icon;
    if (title == "credit score") icon = Icon(Icons.score, color: Colors.white60);
    if (title == "lifetime cashback") icon = Icon(Icons.currency_rupee, color: Colors.white60);
    if (title == "bank balance") icon = Icon(Icons.account_balance_wallet, color: Colors.white60);

    return Row(
      children: [
        icon ?? SizedBox(width: 24),
        SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: title + ' ',
              style: TextStyle(color: Colors.white, fontSize: 16),
              children: actionText != null
                  ? [
                TextSpan(
                  text: "• $actionText",
                  style: TextStyle(color: Colors.green, fontSize: 14),
                ),
              ]
                  : [],
            ),
          ),
        ),
        Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        if (value.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
          )
      ],
    );
  }

  Widget _buildAnimatedTile(String title, String subtitle) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.white10,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white24)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                  if (subtitle.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(subtitle, style: TextStyle(color: Colors.white60)),
                    ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
