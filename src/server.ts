import express from 'express';

const app = express();

app.get('/', (request, response) => {
  return response.json("Hello world");
})

app.listen(3000, () => {
  console.log('🚀 listening in port 3000');
})