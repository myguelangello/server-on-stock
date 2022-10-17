import { router } from './routes';
import express from 'express';
import cors from 'cors';


const app = express();

app.use(express.json());
app.use(cors());

//app.use(express.urlencoded({ extended: false }))

app.use(router);

app.listen(3000, () => {
  console.log('🚀 listening in port 3000');
})