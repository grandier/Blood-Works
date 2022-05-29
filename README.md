# Blood-Works
A Blood Bank Database Management System using PEN (PostgreSQL, Express, Node.JS) Stack
---
## Gambaran Umum Program

Pada proyek ini kelompok kita membuat sebuah website berbasis data yang menggunakan sistem data berbasis SQL yaitu ```PostgreSQL```. Untuk bagian front-end kita tidak menggunakan sebuah framework seperti ```React dan Bootstrap```, kita hanya menggunakan pure ```HTML+CSS```. Untuk bagian back-end kami menggunakan sebuah framework yaitu ```Node.Js``` dan untuk menhubungkannya dengan front-end kita menggunakan ```Express```.

Pada website terdapat 2 jenis user yang bisa login yaitu Admin dan User biasa. User sendiri bisa mendaftarkan akunnya jika belum pernah mendaftar pada website ini. Setelah mereka mendaftarkan dirinya mereka bisa melakukan login. Login dan Register menggunakan encryption oleh bycrypt. Setelah mereka login mereka dapat melakukan hal-hal berikut, diantaranya adalah:

1. Melihat  List Rumah Sakit
2. Berinteraksi pada Landing Page
3. Mendaftarkan diri sebagai Donor
4. Mendaftarkan diri sebagai Pasien
5. Bisa melihat list dari Bank Darah

Untuk user Admin sedikit berbeda dengan user biasa karena user admin bisa melakukkan hal-hal yang tidak bisa dilakukkan oleh user biasa, hal-hal yang bisa dilakukan oleh admin diantaranya adalah sebagai berikut.

1. Mendaftarkan dan meng-edit rumah sakit dalam sistem datanya dan melihat list rumah sakit
2. Mendaftarkan admin lain dan juga melihat list admin
3. Melihat list user dan bisa menghapus user yang dipilih
4. Melihat list patient dan bisa menghapus serte meng-edit isinya
5. Bisa melihat list dari donor

User dan Admin bisa berinteraksi dengan data secara bebas dan kapan saja dikerenakan website ini menggunakan sebuah server atau host ```PostgreSQL``` yang berbasis ```Azure```, sehingga selama servernya menyala maka tetap bisa mengakses website ini. Namun kekurangan daripada website ini adalah belum dilakukkannya deployment sehingga jika ada orang yang ingin mengaksesnya maka mereka secara local harus memiliki source codenya.

---
![alt text](https://github.com/grandier/Blood-Works/blob/master/public/images/logo_bloodworks.png)

---

## Final Database Management System Project

This project is made by group 13 of Praktikum Sistem Basis Data which consists of:

1. Qinthara Andini Hananto 
2. Kemas Rafly Omar Thoriq 
3. Septyana Wulansari 


as final programming assignment in Even Semester 2021/2022 for course Data based System + Lab. 
(ENCE604016) in Undergraduate of Computer Engineering study program, Department of Electrical Engineering, Faculty of Engineering, Universitas Indonesia.

---
## Penjelasan mengenai Table pada Program

### 1.  ```Account```

Table Account adalah table yang berguna untuk menyimpan data ```User``` dari websitenya. Tabel ini memiliki beberapa attributes, diantaranya adalah:
```
1. User_ID
2. Name
3. Email
4. Password
5. Contact
```

### 2.  ```Admin```

Table Admin adalah table yang berguna untuk menyimpan data ```Admin``` dari websitenya. Tabel ini memiliki beberapa attributes, diantaranya adalah:
```
1. Admin_ID
2. Name
3. Email
4. Password
5. Contact
```

### 3.  ```Patient```

Table Patient adalah table yang berguna untuk menyimpan data ```Patient``` dari websitenya. Tabel ini memiliki beberapa attributes, diantaranya adalah:
```
1. Patient_ID
2. Name
3. Age
4. Contact
5. Blood Type
6. Current Disease
```

### 4.  ```Donatur```

Table Donatur adalah table yang berguna untuk menyimpan data ```Donatur``` dari websitenya. Tabel ini memiliki beberapa attributes, diantaranya adalah:
```
1. Donor_ID
2. Name
3. Age
4. Contact
5. Blood Type
6. Current Disease
```

### 5.  ```Blood Bank```

Table Blood Bank adalah table yang berguna untuk menyimpan data ```Blood Bank``` dari websitenya. Tabel ini memiliki beberapa attributes, diantaranya adalah:
```
1. Bank_ID
2. Name
3. Blood Type
```

### 6.  ```Rumah Sakit```

Table Rumah Sakit adalah table yang berguna untuk menyimpan data ```Rumah Sakit``` dari websitenya. Tabel ini memiliki beberapa attributes, diantaranya adalah:
```
1. Hospital_ID
2. Name
3. Address
4. Blood Type
```

---
## Tampilan Relation Table dan UML

Table Relational atau ERD:

![alt text](https://github.com/grandier/Blood-Works/blob/master/ERD_Blood%20Works.jpg)

UML:
![alt text](https://github.com/grandier/Blood-Works/blob/master/UML%20Database_Blood%20Works.png)

---
## Tampilan Flowchart dari User dan Admin

Flowchart dari User

![alt text](https://github.com/grandier/Blood-Works/blob/master/Flowchart_User_Blood%20Works.png)

Flowchart dari Admin

![alt text](https://github.com/grandier/Blood-Works/blob/master/Flowchart_Admin_Blood%20Works.png)

---