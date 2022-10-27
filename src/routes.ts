import { Router } from 'express';
<<<<<<< HEAD
import { AuthController } from './controllers/User/AuthController';
=======
import { UserController } from './controllers/User/UserController';
>>>>>>> master

const userControl = new UserController();
const router = Router();

<<<<<<< HEAD
router.post('/users', new CreateUserController().handle)
router.post('/login', new AuthController().handle)
=======

router.post('/signup', userControl.createUser)
router.post('/login', userControl.loginUser)

router.get('/', (request, response)=>{
    response.send("Server is running on port 3000");
})

router.get('/allUser', userControl.allUser);

>>>>>>> master

export { router }