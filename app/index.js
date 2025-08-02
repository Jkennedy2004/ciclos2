// const express = require('express');
// const sqlite3 = require('sqlite3').verbose();
// const app = express();
// const port = 3000;

// let db = new sqlite3.Database(':memory:');

// db.serialize(() => {
//   db.run("CREATE TABLE users (id INT, name TEXT)");
//   db.run("INSERT INTO users VALUES (1, 'Alice')");
// });

// app.get('/user', (req, res) => {
//   const name = req.query.name;
//   const query = `SELECT * FROM users WHERE name = '${name}'`; // vulnerable
//   db.all(query, [], (err, rows) => {
//     if (err) {
//       res.status(500).send('Error');
//     } else {
//       res.json(rows);
//     }
//   });
// });

// app.listen(port, () => {
//   console.log(`App listening at http://localhost:${port}`);
// });


const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const app = express();
const port = 3000;

let db = new sqlite3.Database(':memory:');

db.serialize(() => {
  db.run("CREATE TABLE users (id INT, name TEXT)");
  db.run("INSERT INTO users VALUES (1, 'Alice')");
});

app.get('/user', (req, res) => {
  const name = req.query.name;
  const query = `SELECT * FROM users WHERE name = ?`; // consulta parametrizada segura

  db.all(query, [name], (err, rows) => {
    if (err) {
      res.status(500).send('Error');
    } else {
      res.json(rows);
    }
  });
});

app.listen(port, () => {
  console.log(`App listening at http://localhost:${port}`);
});
