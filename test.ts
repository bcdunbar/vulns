import express from 'express';

const app = express();
app.use(express.json());

app.get('/', (req, res) => {
    const name = req.query.name;

    res.send(`Hello, ${name}!`);
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});

app.post("/records", (request, response) => {
  const data = request.body;
  const query = `SELECT * FROM health_records WHERE id = (${data.id})`;
  connection.query(query, (err, rows) => {
    if(err) throw err;
    response.json({data:rows});
  });
});
