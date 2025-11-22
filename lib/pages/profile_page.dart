import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/profile.dart';
import '../widgets/info_grid_item.dart';
import '../widgets/skill_item.dart';
import '../widgets/hobby_item.dart';

class ProfilePage extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const ProfilePage({
    Key? key,
    required this.isDark,
    required this.onToggleTheme,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Profile myProfile = Profile(
    name: 'Aldi Rizkiansyah',
    nim: '23552011130',
    jurusan: 'Teknik Informatika',
    alamat: 'Desa Jelegong Kec.Kutawaringan Kab.Bandung Jawa Barat',
    status: StudentStatus.aktif,
    kontak: '0895-3657-20934',
    email: 'aldirizkiansyah24@gmail.com',
    skills: [
      'Mengoperasikan Microsoft Word dan Excel dengan baik',
      'Desain Grafis',
      'Editing Video dan Gambar',
      'Analisis',
      'Coding',
    ],
    hobbies: [
      'Menggambar',
      'Fotografi & Videografi',
      'Traveling',
      'Bermain Musik',
    ],
  );

  void showHalfModal(String title, String content) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final height = MediaQuery.of(context).size.height;
        return SizedBox(
          height: height * 0.45,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // JUDUL (tetap hitam)
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 10),

                // ISI (tetap hitam)
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      content,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // TOMBOL TETAP PUTIH
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2416F0),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Tutup',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  // ⭐ HEADER DENGAN SWITCH KEREN
  Widget buildHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF2416F0),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(28),
              bottomRight: Radius.circular(28),
            ),
          ),
          padding: const EdgeInsets.only(top: 60, bottom: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 44,
                backgroundImage: const AssetImage('assets/images/profil_aldi.png'),
              ),
              const SizedBox(height: 12),
              Text(
                'Hello everybody, my name is',
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                myProfile.name,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'NIM ${myProfile.nim}',
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),

        // 🔥 SWITCH DI POJOK KIRI ATAS
        Positioned(
          top: 10,
          left: 10,
          child: Row(
            children: [
              const Text(
                "Dark Mode",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(width: 6),
              Switch.adaptive(
                value: widget.isDark,
                activeColor: Colors.white,
                inactiveThumbColor: Colors.grey.shade300,
                onChanged: (value) {
                  widget.onToggleTheme();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildInfoGrid() {
    final items = [
      {'icon': Icons.badge, 'label': 'NIM', 'content': myProfile.nim},
      {'icon': Icons.school, 'label': 'Jurusan', 'content': myProfile.jurusan},
      {'icon': Icons.location_on, 'label': 'Alamat', 'content': myProfile.alamat},
      {
        'icon': Icons.assignment_ind,
        'label': 'Status',
        'content': myProfile.status.name.toUpperCase(),
      },
      {'icon': Icons.phone, 'label': 'Kontak', 'content': myProfile.kontak},
      {'icon': Icons.email, 'label': 'Email', 'content': myProfile.email},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
        children: items.map((it) {
          return InfoGridItem(
            icon: it['icon'] as IconData,
            label: it['label'] as String,
            onTap: () =>
                showHalfModal(it['label'] as String, it['content'] as String),
          );
        }).toList(),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 10, bottom: 6),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget buildSkills() {
    final List<String> skillsToShow = myProfile.skills;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: skillsToShow.map((s) => SkillItem(text: s)).toList(),
      ),
    );
  }

  Widget buildHobbies() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: myProfile.hobbies.map((h) => HobbyItem(text: h)).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(context),
              const SizedBox(height: 18),
              buildInfoGrid(),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Divider(
                  height: 8,
                  thickness: 3,
                  color: Color(0xFF2416F0),
                ),
              ),
              buildSectionTitle('Keahlian'),
              buildSkills(),
              const SizedBox(height: 6),
              buildSectionTitle('Hobi'),
              buildHobbies(),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
