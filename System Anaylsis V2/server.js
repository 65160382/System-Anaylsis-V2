const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(cors());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '', 
    database: 'secondhandmarket' // ชื่อฐานข้อมูล
});

// เชื่อมต่อฐานข้อมูล
db.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the database');
});

app.get('/products', (req, res) => {
    const sql = 'SELECT * FROM Products';
    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error fetching products:', err);
            res.status(500).send('Error fetching products');
            return;
        }
        res.json(results);
    });
});

app.get('/search', (req, res) => {
    const searchTerm = req.query.q;
    const sql = 'SELECT * FROM Products WHERE name LIKE ?';
    db.query(sql, [`%${searchTerm}%`], (err, results) => {
        if (err) {
            console.error('Error searching products:', err);
            res.status(500).send('Error searching products');
            return;
        }
        res.json(results);
    });
});

//Test
app.get('/api/daily-discover', (req, res) => {
    const sql = 'SELECT * FROM Products LIMIT 8'; // ดึงข้อมูลสินค้าตามความต้องการ
    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error fetching daily discover products:', err);
            res.status(500).send('Error fetching daily discover products');
            return;
        }
        res.json(results);
    });
});


// เริ่มเซิร์ฟเวอร์
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});