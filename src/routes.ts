import { Router } from 'express';
import { UserController } from './controllers/User/UserController';

const userControl = new UserController();
const router = Router();


router.post('/signup', userControl.createUser)
router.post('/login', userControl.loginUser)

router.get('/', (request, response)=>{
    response.send("Server is running on port 3000");
})

router.get('/allUser', userControl.allUser);


export { router }