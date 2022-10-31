import { hash } from 'bcryptjs';
import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

/**
 * Query: muito usado para persistir estado - ex rota: /ads/page=2
 * Route: muito usado para identificação de recurso, não são nomeados, são entendidos intrinsecamente: /post/como-criar-uma-api
 * Body: usado paa enviar várias infos numa requisição, corpo da requisição;
 */

interface UserResquest {
  id: string;
  name: string;
  email: string;
  login: string;
  password: string;
  address: string | '';
  role: 'CUSTOMER' | 'ADMIN';
  phone: string;
}


export class CreateUserController {
  async handle(request: Request, response: Response) {
    const {
      name,
      email,
      login,
      password,
      address,
      role,
      phone
    } = request.body as UserResquest;

    const hash_password = await hash(password, 8)

    const result = await prismaClient.user.create({
      data: {
        name,
        email,
        login,
        password: hash_password,
        address,
        role,
        phone
      }
    })

    return response.status(201).json({ name, email, login, role });
  }
}