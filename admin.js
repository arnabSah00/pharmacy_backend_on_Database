const path=require('path');
const express=require('express');
const EventEmitter = require('events');
const myEmitter = new EventEmitter();
const mysql = require('mysql');
const bodyParser = require('body-parser');

var app=express();
myEmitter.setMaxListeners(100);

app.use(express.json());
app.use(express.urlencoded({ extended: true }));


// app.use(express.urlencoded({
//   extended: true
// }));

//set handlebars
var handlebars=require('express3-handlebars').create({defaultLayout:'main'});
app.engine('handlebars',handlebars.engine);
app.set('view engine','handlebars');



//for sql connection
const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Arnab200!',
    database: 'pharmacy'
  });
  
  con.connect(function(err) {
    if (err) throw err;
    console.log('Connected....');
  });

// set table name
let tableName = '';

//set port
app.set('port',process.env.PORT || 3000);

//for file use
app.use(express.static(__dirname + '/'));


//for home page
app.get('/',function(req,res){
    res.render('home');
});

//stocks
app.get('/stocks',function(req,res){
    res.render('stock');
});

//market analysis
app.get('/analysis',function(req,res){
    res.render('analysis');
});

//company
app.get('/company',function(req,res){
    tableName='company';
    res.render('company');
});

//customer
app.get('/customer',function(req,res){
    tableName='customer';
    res.render('customer');
});

//employee
app.get('/employee',function(req,res){
    tableName = 'employee';
    res.render('employee');
});

//medicine 
app.get('/medicine',function(req,res){
  tableName = 'medicine';
  res.render('medicine');

});


//customer card details
app.get('/customer_card_detail',function(req,res){
    tableName='customer_card';
    res.render('card');
});

//customer card details
app.get('/purchases',function(req,res){
    tableName='purchase_from_company';
    res.render('purchase');
});

//customer card details
app.get('/sales',function(req,res){
    tableName='sales';
    res.render('sales');
});

//customer card details
app.get('/manufacture',function(req,res){
    tableName='manufacture';
    res.render('manufacture');
});

//for fatch json file to ajax
app.get('/data', (req, res) => {
  const sql = `SELECT * FROM ${tableName}`;
  console.log(sql);
  con.query(sql, (err, result) => {
    if (err) {
      console.error('Error in fetching data: ', err);
      res.status(500).send('Error in fetching data');
      console.log(result);
    } else {
      res.json(result);
      console.log(result);
    }
  });
});

//after submit
app.post('/submit', (req, res) => {

    var data=req.body;

    for (let key in data) {
      if ((data.hasOwnProperty(key) && data[key] === '')|| data[key] === undefined  ){
          data[key] = null;
      }
    }
    console.log(data);

    const insertQuery = `INSERT INTO ${tableName} SET ?`;

    con.query(insertQuery, [data], (err, result) => {
        if (err) throw err;
        console.log('Data inserted successfully!');
        res.send('Data inserted successfully!');
    });
    
    // const checkIfExistsQuery = `SELECT * FROM ${tableName} WHERE name = ?`;
    // con.query(checkIfExistsQuery, [req.body.name], (error, results, fields) => {
    //     if (error) throw error;
    //     else if(req.body.name==null){
    //         res.send(`enter ${tableName} Name.`);
    //     }
    //     else if (results.length > 0) {
    //       res.send(`${tableName} already exists.`);
    //     } 
    //     else {
    //         const insertQuery = `INSERT INTO ${tableName} SET ?`;
    //         con.query(insertQuery, [data], (err, result) => {
    //           if (err) throw err;
    //           console.log('Data inserted successfully!');
    //           res.send('Data inserted successfully!');
    //         });
    //     }
    //   });

});


//for customer card details data show
app.get('/cardData', (req, res) => {
  const Tquery = `
    SELECT customer.CID, customer.name, customer_card.number, customer_card.CVV ,
    customer_card.valid_form,customer_card.upto FROM customer INNER JOIN customer_card ON customer.CID = customer_card.CID;
  `;
  con.query(Tquery, (error, results1, fields) => {
    if (error) {
      console.error('Error in fetching data: ', err);
      res.status(500).send('Error in fetching data');
    }
    con.query('SELECT CID,name FROM customer', (error, results2) => {
      if (error) throw error;
      // Combine the results from both queries
      let data = {
        result1: results1,
        result2: results2
      };

      console.log(data);

      res.json(data); // Send the data as JSON
    });
  });
});



app.listen(app.get('port'),function(req,res){
    console.log('the server is start on http://localhost:'+app.get('port'));
});