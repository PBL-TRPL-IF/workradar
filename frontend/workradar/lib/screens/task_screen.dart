import 'package:flutter/material.dart';
import '../config/app_template.dart';
import '../screens/task_form.dart';
import '../screens/edit_tugas.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int _selectedFilterIndex = 0;
  int _selectedTabIndex = 0;
  String _selectedDropdownValue = 'semua'; // Tambahkan state untuk dropdown

  final List<String> filters = ['Semua', 'Hari', 'Minggu', 'Bulan'];

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      currentRoute: '',
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // search dan filter
            _buildSearchAndFilterSection(),

            // tab dan list task
            _buildTabAndTaskSection(),
          ],
        ),
        // floating action button untuk tambah tugas
        floatingActionButton: _buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  // search dan filter section
  Widget _buildSearchAndFilterSection() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // search bar
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.search, color: Color(0xFF666666), size: 24),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 16),
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        hintText: 'Cari tugas...',
                        hintStyle: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(bottom: 15),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),

          // dropdown filter
          Center(
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Color(0xFFE0E0E0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedDropdownValue, // Gunakan state
                  icon: Icon(Icons.arrow_drop_down, size: 28),
                  isExpanded: true,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'semua',
                      child: Center(
                        child: Text(
                          'Semua Tugas',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'tugas',
                      child: Center(
                        child: Text(
                          'Tugas Biasa',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'tugas berulang',
                      child: Center(
                        child: Text(
                          'Tugas Berulang',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                  onChanged: (String? newValue) {
                    // dijalankan ketika dropdown diubah
                    setState(() {
                      _selectedDropdownValue = newValue!;
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 16),

          // filter chips
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filters.asMap().entries.map((entry) {
                  int index = entry.key;
                  String filter = entry.value;
                  return Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedFilterIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: _selectedFilterIndex == index
                              ? Color(0xFF2196F3)
                              : Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(20),
                          border: _selectedFilterIndex == index
                              ? null
                              : Border.all(color: Color(0xFFE0E0E0)),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: _selectedFilterIndex == index
                                ? Colors.white
                                : Color(0xFF666666),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // tab dan task section
  Widget _buildTabAndTaskSection() {
    return Expanded(
      child: Column(
        children: [
          // task List
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildTaskItem(
                  title: 'Rapat Proyek PBL 315',
                  date: 'Senin, 10 Des 2025',
                  type: 'To Do',
                  onEdit: () {
                    print('');
                  },
                ),
                SizedBox(height: 12),
                _buildTaskItem(
                  title: 'Mengerjakan Laporan Akhir',
                  date: 'Selasa, 11 Des 2025',
                  type: 'In Progress',
                  onEdit: null,
                ),
                SizedBox(height: 12),
                _buildTaskItem(
                  title: 'Presentasi Kelompok',
                  date: 'Rabu, 12 Des 2025',
                  type: 'Done',
                  onEdit: null,
                ),
                SizedBox(height: 80), 
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskItem({
    required String title,
    required String date,
    required String type,
    VoidCallback? onEdit,
  }) {
    Color getTypeColor() {
      switch (type) {
        case 'To Do':
          return Color(0xFF2196F3);
        case 'In Progress':
          return Color(0xFFFF9800);
        case 'Done':
          return Color(0xFF4CAF50);
        default:
          return Color(0xFF9E9E9E);
      }
    }

    Color getTypeTextColor() {
      switch (type) {
        case 'To Do':
          return Colors.white;
        case 'In Progress':
          return Colors.white;
        case 'Done':
          return Colors.white;
        default:
          return Colors.black;
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: Color(0xFFEEEEEE)),
      ),
      child: Row(
        children: [
          // Task content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: Color(0xFF666666),
                    ),
                    SizedBox(width: 6),
                    Text(
                      date,
                      style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: getTypeColor(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        type,
                        style: TextStyle(
                          fontSize: 12,
                          color: getTypeTextColor(),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Expanded(child: SizedBox()),

                    if (type == 'To Do' && onEdit != null)
                      GestureDetector(
                        onTap: () {
                          print('/edit_tugas.dart');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTaskScreen(),
                            ),
                          );
                          onEdit();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 20,
                            color: Color(0xFF5F4AFB),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),

          // checkbox atau status icon
          if (type == 'Done')
            Icon(Icons.check_circle, color: Color(0xFF4CAF50), size: 28),
          if (type == 'In Progress')
            Icon(Icons.access_time, color: Color(0xFFFF9800), size: 28),
        ],
      ),
    );
  }

  // floating Action Button untuk tambah tugas
  Widget _buildFloatingActionButton() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: 60,
      child: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          // aksi ketika tombol tambah tugas ditekan
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Membuka form tambah tugas baru',
                style: TextStyle(fontSize: 14),
              ),
              duration: Duration(seconds: 2),
              backgroundColor: Color.fromARGB(255, 0, 0, 0),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
          print('Tambah tugas baru');
        },
        backgroundColor: Color(0xFF4CAF50),
        foregroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        icon: Icon(Icons.add, size: 28),
        label: Text(
          'Tambah Tugas Baru',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
