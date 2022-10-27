import { Router } from 'express';
import { AuthController } from './controllers/User/AuthController';
import { CreateUserController } from './controllers/User/CreateUserController';

const router = Router();

router.post('/users', new CreateUserController().handle)
router.post('/login', new AuthController().handle)

export { router }