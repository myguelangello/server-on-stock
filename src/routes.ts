import { Router } from 'express';

import { CreateUserController } from './controllers/User/CreateUserController';

const router = Router();

router.post('/users', new CreateUserController().handle)
router.post('/login', new CreateUserController().handle)

export { router }