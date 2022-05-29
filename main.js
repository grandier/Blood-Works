//import packages
const express = require('express');
const session = require('express-session'); 
const bodyParser = require('body-parser');
const cors = require('cors')
const path = require('path')
 
//initialize the app as an express app
const app = express();
const router = express.Router();
const { Client } = require('pg');
const bcrypt = require('bcrypt');
const { hash } = require('bcrypt');
const { isWindows } = require('nodemon/lib/utils');
const { write } = require('fs');

//Insiasi koneksi ke database
const db = new Client({
    //isi dengan konfigurasi database anda
    user: 'kemas_sbd',
    host: 'kemas-sbd.postgres.database.azure.com',
    database: 'proyeksbd',
    password: 'grandier2*',
    port: 5432,
    sslmode: 'require',
    ssl: true
});

//Melakukan koneksi dan menunjukkan indikasi database terhubung
db.connect((err)=>{
    if(err){
        console.log(err)
        return
    }
    console.log('Database berhasil terkoneksi')
})

//middleware (session)
app.use(
    session({
        secret: 'ini contoh secret',
        saveUninitialized: false,
        resave: false
    })
);
app.use(bodyParser.json());
app.use(
    bodyParser.urlencoded({
        extended: true
    })
);
const corsOptions = {
    origin: '*',
    Credentials: true,
    optionsSuccessStatus: 200
};
app.use(cors(corsOptions))
app.use(express.static(path.join(__dirname, 'public')));
var temp;

app.get('/', function(req, res) {
    // Prepare the context
    response.sendFile(__dirname + '/login.html');
});

app.get('/style.css', function(req, res) {
    res.sendFile(__dirname + "/" + "style.css");
  }); 

app.post('/loginAdmin', async (req, res) =>{
    temp = req.session;
    temp.admin_email = req.body.admin_email;
    temp.admin_password = req.body.admin_password;
    if(temp.admin_email.length > 0 || temp.admin_password.length > 0){
        bcrypt.hash(temp.admin_password, 10, function(err, hash) {
            if (err) {
                res.send(err);
            }
            const query = `select admin_email, admin_password from admin where admin_email like '${temp.admin_email}';`; //query ambil data Admin untuk login
            //mengecek informasi yang dimasukkan Admin apakah terdaftar pada database
            db.query(query, (err, results) => {
                if(results.rowCount < 1){
                    res.end('email')
                }
                else{
                    bcrypt.compare(temp.admin_password, results.rows[0].admin_password, (err, result) => {
                        if(!result){
                            res.end('fail');
                            console.log(err);
                        }
                        res.end('done');
                    });
                }
            });
        });
    }
    else{
        res.end('empty');
    }
})

app.post('/registerAdmin', (req, res) =>{
    temp = req.session;
    temp.admin_name = req.body.admin_name;
    temp.admin_email = req.body.admin_email;
    temp.admin_password = req.body.admin_password;
    temp.admin_contact = req.body.admin_contact;
    if(temp.admin_password.length > 0 && temp.admin_name.length > 0 && temp.admin_email.length > 0 && temp.admin_contact.length > 0){
        bcrypt.hash(temp.admin_password, 10, (err, hash) => {
            if (err) {
                res.end('empty');
            }
            const query = `insert into admin (admin_name, admin_email, admin_password, admin_contact) values ('${temp.admin_name}', '${temp.admin_email}', '${hash}', ${temp.admin_contact});` //query tambahkan Admin baru ke database  
            db.query(query, (err, results) => {
            if (!results) { 
                console.log(err);
                res.end('fail');
                return
                }
            });
        });
        res.end('done');
    }
    res.end('empty');
});

app.post('/checkAdminID', (req, res) =>{
    temp = req.session;
    temp.admin_id = req.body.admin_id
    if(temp.admin_id.length > 0){
        const query = `select * from admin where admin_id = ${temp.admin_id};`
        db.query(query, (err, results) => {
            if (results.rowCount == 0) {
                res.end('fail')
            }
            res.end('done')
        })   
    }
    else {
        res.end('empty') 
    }
});

app.post('/updateAdmin', (req, res) => {
    temp = req.session;
    temp.admin_name = req.body.admin_name
    temp.admin_email = req.body.admin_email
    temp.admin_contact = req.body.admin_contact
    if(temp.admin_name.length > 0 && temp.admin_email.length > 0 && temp.admin_contact.length > 0){
        db.query(`UPDATE admin set admin_Name = '${temp.admin_name}', admin_email = '${temp.admin_email}', admin_contact = ${temp.admin_contact} WHERE admin_ID = ${temp.admin_id};`, (err) => {
            if (err) {
                res.end('fail') 
                return
            }
            res.end('done')
        })
    }
    else{
        res.end('empty')
    }
})

app.post("/deleteAdmin", (req, res) => {
    temp = req.session;
    temp.admin_id = req.body.admin_id
    if(temp.admin_id.length > 0){
        db.query(`DELETE FROM admin WHERE admin_id = ${temp.admin_id};`, (err) => {
            if (err) {
                console.log(err);
                res.end('fail');
                return;
            }
            else{
                res.end('done');
            }
        });
    }
    else{
        res.end('empty')
    }
});

app.post('/showUser', (req, res) =>{
    temp = req.session
    const query = `select * from account;`
    db.query(query, (err, results) => {
        if(err){
            console.log(err)
            res.end('error')
            return
        }
        //res.send(results.rows)
        res.write(`<table id="data_user">
                    <thead>
                    <tr>
                        <th>User ID</th>
                        <th>User Name</th>
                        <th>User Email</th>
                        <th>User Contact</th>
                    </tr>
                    </thead>`)
        for(row of results.rows){
            res.write(`<tr>
                        <td>${row["user_id"]}</td>
                        <td>${row["name"]}</a></td>
                        <td>${row["email"]}</td>
                        <td>${row["contact"]}</td>
                        </tr>`);
        }
        res.end(`</table>`);
    })
});

app.post('/checkUser', (req, res) =>{
    temp = req.session;
    temp.user_id = req.body.user_id
    if(temp.user_id.length > 0){
        const query = `select * from account where user_id = ${temp.user_id};`
        db.query(query, (err, results) => {
            if (results.rowCount == 0) {
                res.end('fail')
            }
            res.end('done')
        })   
    }
    else {
        res.end('empty') 
    }
});

app.post("/deleteUser", (req, res) => {
    temp = req.session;
    temp.user_id = req.body.user_id
    if(temp.user_id.length > 0){
        db.query(`DELETE FROM account WHERE user_id = ${temp.user_id};`, (err) => {
            if (err) {
                console.log(err);
                res.end('fail');
                return;
            }
            else{
                res.end('done');
            }
        });
    }
    else{
        res.end('empty')
    }
});

app.post('/showPatient', (req, res) =>{
    temp = req.session
    const query = `select * from patient;`
    db.query(query, (err, results) => {
        if(err){
            console.log(err)
            res.end('error')
            return
        }
        //res.send(results.rows)
        res.write(`<table id="data_patient">
                    <thead>
                    <tr>
                        <th>Patient ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Contact</th>
                        <th>Blood Type</th>
                        <th>Current Disease</th>
                    </tr>
                    </thead>`)
        for(row of results.rows){
            res.write(`<tr>
                        <td>${row["patient_id"]}</td>
                        <td>${row["patient_name"]}</a></td>
                        <td>${row["patient_age"]}</td>
                        <td>${row["patient_contact"]}</td>
                        <td>${row["patient_blood_type"]}</td>
                        <td>${row["patient_current_disease"]}</td>
                        </tr>`);
        }
        res.end(`</table>`);
    })
});

app.post('/checkPatientRS', (req, res) =>{
    temp = req.session;
    temp.hospital_id = req.body.hospital_id
    if(temp.hospital_id.length > 0){
        const query1 = `select * from rumah_sakit where hospital_id = ${temp.hospital_id};`
        const query = `select patient_id, patient_name, patient_age, patient_contact, patient_blood_type, patient_current_disease from patient inner join rumah_sakit ON patient.hospital_id = rumah_sakit.hospital_id WHERE patient.hospital_id = ${temp.hospital_id};`
        db.query(query1, (err, results) => {
            if (results.rowCount == 0) {
                res.end('hospital')
                return
            }
            db.query(query, (err, results) => {
                if (results.rowCount == 0) {
                    res.end('fail')
                    return
                }
                res.end('done')
            })
        })
    }
    else{
        res.end('empty')
    }
});

app.post('/showPatientRS', (req, res) =>{
    temp = req.session
    const query = `select patient_id, patient_name, patient_age, patient_contact, patient_blood_type, patient_current_disease from patient inner join rumah_sakit ON patient.hospital_id = rumah_sakit.hospital_id WHERE patient.hospital_id = ${temp.hospital_id};`
    db.query(query, (err, results) => {
        if(err){
            console.log(err)
            res.end('error')
            return
        }
        //res.send(results.rows)
        res.write(`<table id="data_patient">
                    <tr>
                        <th>Patient ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Contact</th>
                        <th>Blood Type</th>
                        <th>Current Disease</th>
                    </tr>
                `)
        for(row of results.rows){
            res.write(`<tr>
                        <td>${row["patient_id"]}</td>
                        <td>${row["patient_name"]}</a></td>
                        <td>${row["patient_age"]}</td>
                        <td>${row["patient_contact"]}</td>
                        <td>${row["patient_blood_type"]}</td>
                        <td>${row["patient_current_disease"]}</td>
                        </tr>`);
        }
        res.end(`</table>`);
    })
});


app.post('/checkPatient', (req, res) =>{
    temp = req.session;
    temp.patient_id = req.body.patient_id
    if(temp.patient_id.length > 0){
        const query = `select * from patient where patient_id = ${temp.patient_id};`
        db.query(query, (err, results) => {
            if (results.rowCount == 0) {
                res.end('fail')
            }
            res.end('done')
        })   
    }
    else {
        res.end('empty') 
    }
});

app.post('/updatePatient', (req, res) => {
    temp = req.session;
    temp.patient_name = req.body.patient_name
    temp.patient_age = req.body.patient_age
    temp.patient_contact = req.body.patient_contact
    temp.patient_blood_type = req.body.patient_blood_type
    temp.patient_current_disease = req.body.patient_current_disease
    if(temp.patient_name.length > 0 && temp.patient_age.length > 0 && temp.patient_contact.length > 0 && temp.patient_blood_type.length > 0 && temp.patient_current_disease.length > 0){
        db.query(`UPDATE patient set patient_Name = '${temp.patient_name}', patient_age = ${temp.patient_age}, patient_Contact = ${temp.patient_contact}, patient_blood_type = '${temp.patient_blood_type}', patient_current_disease = '${temp.patient_current_disease}' WHERE patient_ID = ${temp.patient_id};`, (err) => {
            if (err) {
                res.end('fail') 
                return
            }
        })
        res.end('done')
    }
    res.end('empty')
})

app.post("/deletePatient", (req, res) => {
    temp = req.session;
    temp.patient_id = req.body.patient_id
    if(temp.patient_id.length > 0){
        db.query(`DELETE FROM patient WHERE patient_id = ${temp.patient_id};`, (err) => {
            if (err) {
                console.log(err);
                res.end('fail');
                return;
            }
            else{
                res.end('done');
            }
        });
    }
    else{
        res.end('empty')
    }
});

app.post('/showDonaturAdmin', (req, res) =>{
    temp = req.session
    const query = `select * from donatur;`
    db.query(query, (err, results) => {
        if(err){
            console.log(err)
            res.end('error')
            return
        }
        //res.send(results.rows)
        res.write(`<table id="data_donatur">
                    <thead>
                    <tr>
                        <th>Donor ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Contact</th>
                        <th>Blood Type</th>
                        <th>Current Disease</th>
                    </tr>
                    </thead>`)
        for(row of results.rows){
            res.write(`<tr>
                        <td>${row["donor_id"]}</td>
                        <td>${row["donor_name"]}</a></td>
                        <td>${row["donor_age"]}</td>
                        <td>${row["donor_contact"]}</td>
                        <td>${row["donor_blood_type"]}</td>
                        <td>${row["donor_current_disease"]}</td>
                        </tr>`);
        }
        res.end(`</table>`);
    })
});

app.post('/checkAdmin', (req, res) =>{
    temp = req.session
    const query = `select * from admin;`
    db.query(query, (err, results) => {
        if(!results){
            console.log(err)
            res.end('error')
            return
        }
        res.end('done')
    })
});

app.post('/showAdmin', (req, res) =>{
    temp = req.session
    const query = `select * from admin ORDER BY admin_id ASC`
    db.query(query, (err, results) => {
        if(err){
            console.log(err)
            res.end('error')
            return
        }
        //res.send(results.rows)
        res.write(`<table id="data_admin">
                    <thead>
                    <tr>
                        <th>Admin ID</th>
                        <th>Admin Name</th>
                        <th>Admin Email</th>
                        <th>Admin Contact</th>
                    </tr>
                    </thead>`)
        for(row of results.rows){
            res.write(`<tr>
                        <td>${row["admin_id"]}</td>
                        <td>${row["admin_name"]}</a></td>
                        <td>${row["admin_email"]}</td>
                        <td>${row["admin_contact"]}</td>
                        </tr>`);
        }
        res.end(`</table>`);
    })
});

/*
    Bagian Admin Diatas
    Bagian User dibawah
*/


//Route that handles login logic
app.post('/login', async (req, res) =>{
    temp = req.session;
    temp.email = req.body.email;
    temp.password = req.body.password;
    if(temp.email.length > 0 && temp.password.length > 0){
        bcrypt.hash(temp.password, 10, function(err, hash) {
            if (err) {
                res.send(err);
            }
            const query = `select email, password from account where email like '${temp.email}';`; //query ambil data user untuk login
            //mengecek informasi yang dimasukkan user apakah terdaftar pada database
            db.query(query, (err, results) => {
                if(results.rowCount < 1){
                    res.end('email')
                }
                else{
                    bcrypt.compare(temp.password, results.rows[0].password, (err, result) => {
                        if(!result){
                            res.end('fail');
                            console.log(err);
                        }
                        res.end('done');
                    });
                }
            });
        });
    }
    else{
        res.end('empty');
    }
})

//Route that handles signup logic
app.post('/register', (req, res) =>{
    temp = req.session;
    temp.name = req.body.name;
    temp.email = req.body.email;
    temp.password = req.body.password;
    temp.contact = req.body.contact;
    if(temp.password.length > 0 && temp.name.length > 0 && temp.email.length > 0 && temp.contact.length > 0){
        bcrypt.hash(temp.password, 10, (err, hash) => {
            if (err) {
                return res.status(500).json({
                    error: err
                });
            }
            const query = `insert into account (name, email, password, contact) values ('${temp.name}', '${temp.email}', '${hash}', ${temp.contact});` //query tambahkan user baru ke database  
            db.query(query, (err, results) => {
            if (err) { 
                console.log(err);
                return res.status(500).json({
                    error: err
                });
            }
            res.end('done');
            });
        });
    }
    else{
        res.end('empty');
    }
});

app.get('/show', (req, res) =>{
    db.query('SELECT * from account', (err, results) => {
        if (err) {
            console.log(err)
            return
        }
        res.send(results.rows)
        res.end('done')
    })
});

//Route that handles patient signup logic
app.post('/registerPatient', (req, res) =>{
    temp = req.session;
    temp.name = req.body.name;
    temp.age = req.body.age;
    temp.contact = req.body.contact;
    temp.blood_type = req.body.blood_type;
    temp.current_disease = req.body.current_disease;
    if(temp.name.length > 0 && temp.age.length > 0 && temp.contact.length > 0 && temp.blood_type.length > 0 && temp.current_disease.length > 0){
        const query = `INSERT INTO patient (patient_name, patient_age, patient_contact, patient_blood_type, patient_current_disease, hospital_id) VALUES ('${temp.name}',${temp.age},${temp.contact},'${temp.blood_type}','${temp.current_disease}', ${temp.hospital_id});`
        db.query(query, (err) => {
            if (err) {
                console.log(err)
                res.end('fail')
                return
            }
            res.end('done')
        })
    }
    else{
        res.end('empty');
    }
});

//Route that handles donatur signup logic
app.post('/registerDonatur', (req, res) =>{
    temp = req.session;
    temp.donor_name = req.body.name;
    temp.donor_age = req.body.age;
    temp.donor_contact = req.body.contact;
    temp.donor_blood_type = req.body.blood_type;
    temp.donor_current_disease = req.body.current_disease;
    if(temp.donor_name.length > 0 && temp.donor_age.length > 0 && temp.donor_contact.length > 0 && temp.donor_blood_type.length > 0 && temp.donor_current_disease.length > 0){
        if(temp.donor_age > 16 && temp.donor_age < 50){
            const query = `INSERT INTO donatur (donor_name, donor_age, donor_contact, donor_blood_type, donor_current_disease, hospital_id) VALUES ('${temp.donor_name}','${temp.donor_age}',${temp.donor_contact},'${temp.donor_blood_type}','${temp.donor_current_disease}', ${temp.hospital_id});`
            db.query(query, (err) => {
                if (err) {
                    console.log(err)
                    res.end('fail')
                    return
                }
                res.end('done')
            })
        }
        else{
            res.end('age')
        }
    }
    else{
        res.end('empty')
    }
});

app.post('/checkDonatur', (req, res) =>{
    temp = req.session;
    temp.hospital_id = req.body.hospital_id
    if(temp.hospital_id.length > 0){
        const query = `select * from rumah_sakit where hospital_id = ${temp.hospital_id};`
        db.query(query, (err, results) => {
            if (results.rowCount == 0) {
                res.end('fail')
            }
            res.end('done')
        }) 
    }
    else{
        res.end('empty')
    }
     
});

app.post('/checkDonaturBB', (req, res) =>{
    temp = req.session;
    temp.donor_id = req.body.donor_id;
    if(temp.donor_id.length > 0){
        const query = `select donor_name, donor_age, donor_contact, donor_blood_type, donor_current_disease from donatur inner join blood_bank ON donatur.donor_id = blood_bank.bank_id inner join rumah_sakit ON blood_bank.hospital_id = rumah_sakit.hospital_id WHERE blood_bank.bank_id = ${temp.donor_id} AND rumah_sakit.hospital_id = ${temp.hospital_id};`
        db.query(query, (err, results) => {
            if (results.rowCount == 0) {
                res.end('empty')    
                return
            } 
            res.end('done')            
        })
        //res.end('done')
    }
    else {
        res.end('fail')
    }
});

app.post('/showDonatur', (req, res) =>{
    temp = req.session
    const query = `select donor_name, donor_age, donor_contact, donor_blood_type, donor_current_disease from donatur inner join blood_bank ON donatur.donor_id = blood_bank.bank_id inner join rumah_sakit ON blood_bank.hospital_id = rumah_sakit.hospital_id WHERE blood_bank.bank_id = ${temp.donor_id} AND rumah_sakit.hospital_id = ${temp.hospital_id};`
    db.query(query, (err, results) => {
        if(err){
            console.log(err)
            res.end('error')
            return
        }
        //res.send(results.rows)
        res.write(`<table id="show_donatur">
                    <thead>
                    <tr>
                        <th>Donor Name</th>
                        <th>Donor Age</th>
                        <th>Donor Contact</th>
                        <th>Blood Type</th>
                        <th>Current Disease</th>
                    </tr>
                    </thead>`)
        for(row of results.rows){
            res.write(`<tr>
                        <td>${row["donor_name"]}</td>
                        <td>${row["donor_age"]}</a></td>
                        <td>${row["donor_contact"]}</td>
                        <td>${row["donor_blood_type"]}</td>
                        <td>${row["donor_current_disease"]}</td>
                        </tr>`);
        }
        res.end(`</table>`);
    })
});

//Route that handles rumah sakit
app.post('/registerRS', (req, res) =>{
    temp = req.session;
    temp.hospital_name = req.body.hospital_name
    temp.hospital_address = req.body.hospital_address
    temp.hospital_contact = req.body.hospital_contact
    if(temp.hospital_name.length > 0 && temp.hospital_address.length > 0 && temp.hospital_contact.length > 0){
        const query = `INSERT INTO rumah_sakit (hospital_name, hospital_address, hospital_contact) VALUES ('${temp.hospital_name}','${temp.hospital_address}',${temp.hospital_contact});`
        db.query(query, (err) => {
            if (err) {
                res.end('fail')
                return
            }
        })
        res.end('done')
    }
    res.end('empty')
});

app.post('/showRS', (req, res) =>{
    const query = "SELECT * from rumah_sakit ORDER BY hospital_id ASC";
    db.query(query, (err, results) => {
        if (err) {
            console.log(err)
            return
        }
        //res.send(results.rows)
        res.write(`<table id=data_rs>
                    <thead>
                    <tr>
                        <th>Hospital ID</th>
                        <th>Hospital Name</th>
                        <th>Address</th>
                        <th>Contact</th>
                    </tr>
                    </thead>`)
        for(row of results.rows){
            res.write(`<tr>
                        <td>${row["hospital_id"]}</td>
                        <td>${row["hospital_name"]}</a></td>
                        <td>${row["hospital_address"]}</td>
                        <td>${row["hospital_contact"]}</td>
                        </tr>`);
        }
        res.end(`</table>`);
    })
});

app.post('/checkRS', (req, res) =>{
    temp = req.session;
    temp.hospital_id = req.body.hospital_id
    if(temp.hospital_id.length > 0){
        const query = `select * from rumah_sakit where hospital_id = ${temp.hospital_id};`
        db.query(query, (err, results) => {
            if (results.rowCount == 0) {
                res.end('fail')
            }
            res.end('done')
        })   
    }
    else {
        res.end('empty') 
    }
});

app.post('/updateRS', (req, res) => {
    temp = req.session;
    temp.hospital_name = req.body.hospital_name
    temp.hospital_address = req.body.hospital_address
    temp.hospital_contact = req.body.hospital_contact
    if(temp.hospital_name.length > 0 && temp.hospital_address.length > 0 && temp.hospital_contact.length > 0){
        db.query(`UPDATE rumah_sakit set hospital_Name = '${temp.hospital_name}', hospital_address = '${temp.hospital_address}', hospital_Contact = ${temp.hospital_contact} WHERE hospital_ID = ${temp.hospital_id};`, (err) => {
            if (err) {
                res.end('fail')
                return
            }
        })
        res.end('done')
    }
    res.end('empty')
})

//Route that handles bank darah
app.post('/registerBB', (req, res) =>{
    temp = req.session;
    temp.blood_name = req.body.name
    temp.blood_type = req.body.blood_type
    const query = `INSERT INTO blood_bank (blood_name, blood_type, hospital_id) VALUES ('${temp.blood_name}','${temp.blood_type}', ${temp.hospital_id});`
    db.query(query, (err) => {
        if (err) {
            console.log(err)
            return
        }
        else {
            res.end('done')
        }
        
    })
});

app.post('/checkBB', (req, res) =>{
    temp = req.session;
    temp.hospital_id = req.body.hospital_id
    if(temp.hospital_id.length > 0){
        const query1 = `select * from rumah_sakit WHERE hospital_id = ${temp.hospital_id};`
        const query = `select bank_id, blood_name, blood_type from blood_bank inner join rumah_sakit ON blood_bank.hospital_id = rumah_sakit.hospital_id WHERE rumah_sakit.hospital_id = ${temp.hospital_id};`
        db.query(query1, (err, results) => {
            if (results.rowCount == 0) { 
                res.end('fail')
                return
            }
            else {
                db.query(query, (err, results) => {
                if (results.rowCount == 0) {
                    res.end('empty')
                    return
                }
                else {
                    res.end('done')
                }
                }) 
            }
        })
    }
    else{
        res.end('fail')
    }
   
});

app.post('/showBB', (req, res) =>{
    temp = req.session

    const query = `select bank_id, blood_name, blood_type from blood_bank inner join rumah_sakit ON blood_bank.hospital_id = rumah_sakit.hospital_id WHERE rumah_sakit.hospital_id = ${temp.hospital_id};`
    db.query(query, (err, results) => {
        if(err){
            res.end('error')
            return
        }
        //res.send(results.rows)
        res.write(`<table id=data_bb>
                    <thead>
                    <tr>
                    <th>Blood Bank ID</th>
                    <th>Blood Name</th>
                    <th>Blood Type</th>
                    </tr>
                    </thead>`)
        for(row of results.rows){
            res.write(`<tr>
                        <td>${row["bank_id"]}</td>
                        <td>${row["blood_name"]}</td>
                        <td>${row["blood_type"]}</td>
                        </tr>
                    `);
        }
        res.end(`</table>`);
    })
});

app.put('/updateBB', (req, res) => {
    const user = req.body
    db.query(`UPDATE blood_bank set "name" = '${user.name}', "blood_type" ='${user.blood_type}' WHERE id = ${user.id};`, (err) => {
        if (err) {
            console.log(err)
            return
        }
        res.send('Mata kuliah berhasil diubah')
    })
})

app.post('/logout', (req, res) => {
    req.session.destroy(err => {
        if (err) {
            res.end('error')
            return 
        }
        res.end('logout')
    });
});


app.listen(process.env.PORT || 5500, () => {
    console.log(`App Started on PORT ${process.env.PORT || 5500}`);
});