const express = require('express')
const cors = require('cors')
const app = express()
const pg = require('pg');
const port = 8000
const db = new pg.Pool({
  connectionString: 'postgres://dev:dev@localhost/raidmanager',
  ssl: {
    rejectUnauthorized: false
  }
});

app.use(express.json())
app.use(cors())

app.get('/api/game', (req, res) => {
  const sql = `
    select *
      from "game"
  `;
  db.query(sql)
    .then(result => {
      res.json(result.rows);
    })
    .catch(err => {
      console.error(err);
      res.status(500).json({
        error: 'an unexpected error occurred'
      });
    });
})

app.post('/api/game', (req, res) => {
  const body = req.body;

  const sql = `
  insert into "game" ("gameName")
  values ($1)
  returning *
  `;
  const values = [body.gameName];

  db.query(sql, values)
    .then(result => {
      const games = result.rows[0];
      res.status(201).json(games);
    })
    .catch(error => {
      // eslint-disable-next-line no-console
      console.log(error);
      res.status(500).json({ error: 'An unexpected error occurred.' });
    });
})

app.listen(port, () => {
  console.log(`server listening on port ${port}`)
})
