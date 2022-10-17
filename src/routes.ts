import { Router } from 'express';

import { UserController } from './controllers/User/CreateUserController';

const router = Router();

router.post('/users', new UserController().createUser)
router.post('/login', new UserController().loginUser)

export { router }