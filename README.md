# Blood-Works
A Blood Bank Database Management System using PEN (PostgreSQL, Express, Node.JS) Stack
---

## Final Database Management System Project

This project is made by group 13 of Praktikum Sistem Basis Data which consists of:

1. [*Qinthara Andini Hananto*](https://github.com/qintharaandini)
2. [*Kemas Rafly Omar Thoriq*](https://github.com/grandier) 


as final programming assignment in Even Semester 2021/2022 for course Data based System + Lab. 
(ENCE604016) in Undergraduate of Computer Engineering study program, Department of Electrical Engineering, Faculty of Engineering, Universitas Indonesia.

---
## Overview of the Program

In this project, our group created a data-driven website that uses an SQL-based data system, namely[```PostgreSQL```](https://www.postgresql.org/). For the front-end part, we did not use any frameworks like [```React```](https://reactjs.org/) or [```Bootstrap```](https://getbootstrap.com/), we only used ```HTML+CSS```.  For the back-end part, we used a framework, namely [```Node.Js```](https://nodejs.org/en/) and to connect it to the front-end, we used [```Express```](https://expressjs.com/).

The website has two types of users who can log in: Admin and regular Users. Users can register for an account if they have not registered on the website before. After they register, they can log in. Login and registration use encryption by bycrypt. After they log in, they can do the following:

1. View the list of Hospitals
2. Interact with the Landing Page
3. Register as a Donor
4. Register as a Patient
5. View the list of Blood Banks

For Admin users, they can do some things that regular users cannot do. Some of the things that Admin users can do are as follows.

1. Register and edit hospitals in the system data and view the list of hospitals
2. Register other admins and view the list of admins
3. View the list of users and delete selected users
4. View the list of patients and edit/delete the contents
5. View the list of donors

Users and Admins can interact with data freely and anytime because this website uses a server or host based on [```PostgreSQL```](https://www.postgresql.org/) on [```Azure```](https://azure.microsoft.com/en-gb/), so as long as the server is on, they can still access this website. However, the disadvantage of this website is that it has not been deployed, so if someone wants to access it, they must have the source code locally.


---
## Explanation of Tables in the Program

### 1.  ```Account```

The Account table is used to store the data of the ```User``` on the website. This table has several attributes, including:
```
1. User_ID
2. Name
3. Email
4. Password
5. Contact
```

### 2.  ```Admin```

The Admin table is used to store the data of the ```Admin``` on the website. This table has several attributes, including:
```
1. Admin_ID
2. Name
3. Email
4. Password
5. Contact
```

### 3.  ```Patient```

The Patient table is used to store the data of the ```Patient``` on the website. This table has several attributes, including:
```
1. Patient_ID
2. Name
3. Age
4. Contact
5. Blood Type
6. Current Disease
```

### 4.  ```Donors```

The Donors table is used to store data for blood ```donors``` on the website. This table has several attributes, including:
```
1. Donor_ID
2. Name
3. Age
4. Contact
5. Blood Type
6. Current Disease
```

### 5.  ```Blood Bank```

The Blood Bank table is used to store data for ```blood banks``` on the website. This table has several attributes, including:
```
1. Bank_ID
2. Name
3. Blood Type
```

### 6.  ```Hospitals```

The Hospitals table is used to store data for ```hospitals``` on the website. This table has several attributes, including:
```
1. Hospital_ID
2. Name
3. Address
4. Blood Type
```

---
## Relation Table and UML Diagram View
<details>
  <summary>Relation Table and UML Diagram View:</summary>

  ```Table Relational or ERD:```

![alt text](https://github.com/grandier/Blood-Works/blob/master/Information/ERD_Blood%20Works.jpg)

```UML:```

![alt text](https://github.com/grandier/Blood-Works/blob/master/Information/UML%20Database_Blood%20Works.png)

</details>

## User and Admin Flowchart View
<details>
  <summary>User and Admin Flowchart View:</summary>

  ```Flowchart of User```

![alt text](https://github.com/grandier/Blood-Works/blob/master/Information/Flowchart_User_Blood%20Works.png)

```Flowchart of Admin```

![alt text](https://github.com/grandier/Blood-Works/blob/master/Information/Flowchart_Admin_Blood%20Works.png)

</details>


---
![alt text](https://github.com/grandier/Blood-Works/blob/master/public/images/logo_bloodworks.png)

---