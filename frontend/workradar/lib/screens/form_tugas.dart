import 'package:flutter/material.dart';
import '../config/app_template.dart';
import '../config/app_screens.dart';
import 'tambah_subtugas.dart'; 

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool _isRecurring = false;

  void _saveTask() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tugas berhasil disimpan!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _cancelTask() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Membatalkan tugas'),
        duration: Duration(seconds: 1),
      ),
    );
    Future.delayed(Duration(milliseconds: 800), () {
      Navigator.pushNamed(context, AppScreens.task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppTemplate(
      currentRoute: AppScreens.addTask,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // nama tugas
            _buildTaskNameField(),
            SizedBox(height: 16),
            
            // kategori 
            _buildCategoryDropdown(),
            SizedBox(height: 16),
            
            // detail tugas
            _buildTaskDetailField(),
            SizedBox(height: 16),
            
            // tanggal
            _buildDateRangeField(),
            SizedBox(height: 16),
            
            // waktu
            _buildDeadlineField(),
            SizedBox(height: 16),
            
            // checkbox
            _buildRecurringTaskCheckbox(),
            SizedBox(height: 24),
            
            Divider(thickness: 1),
            SizedBox(height: 16),
            
            // tombol tambah subtugas 
            _buildAddSubtaskButton(),
            
            SizedBox(height: 24),
            
            // tombol simpan & batal 
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Tugas',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            'Contoh: Menyelesaikan laporan',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kategori',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pekerjaan',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTaskDetailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detail Tugas',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 120,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '',
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }

  Widget _buildDateRangeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tanggal Mulai',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Text(
              'Tanggal Selesai',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '09/11/2024',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    Icon(Icons.calendar_today, size: 20, color: Colors.grey.shade600),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12),
            Text('-', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
            SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '10/11/2024',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    Icon(Icons.calendar_today, size: 20, color: Colors.grey.shade600),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDeadlineField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Jam Mulai',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Text(
              'Jam Selesai',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '08:00',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    Icon(Icons.access_time, size: 20, color: Colors.grey.shade600),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12),
            Text('-', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
            SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '17:00',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    Icon(Icons.access_time, size: 20, color: Colors.grey.shade600),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecurringTaskCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: _isRecurring,
          onChanged: (bool? value) {
            setState(() {
              _isRecurring = value!;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Tugas Berulang: ${value! ? 'AKTIF' : 'NON-AKTIF'}'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
        Text(
          'Tugas Berulang',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildAddSubtaskButton() {
  return SizedBox(
    width: double.infinity,
    child: OutlinedButton.icon(
      onPressed: () {
        // navigasi ke halaman AddSubtaskScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddSubtaskScreen()),
        );
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(''),
            duration: Duration(seconds: 1),
          ),
        );
      },
      icon: Icon(Icons.add, size: 20),
      label: Text(
        'Tambah Subtugas',
        style: TextStyle(fontSize: 16),
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(color: Colors.blue),
      ),
    ),
  );
}

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: _cancelTask,
            child: Text(
              'Batal',
              style: TextStyle(fontSize: 16),
            ),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: _saveTask,
            child: Text(
              'Simpan',
              style: TextStyle(fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}