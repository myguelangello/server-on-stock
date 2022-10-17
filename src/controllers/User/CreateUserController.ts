import { hash } from 'bcryptjs';
import { Request, Response } from 'express';
import { prismaClient } from '../../database/prismaClient';

/**
 * Query: muito usado para persistir estado - ex rota: /ads/page=2
 * Route: muito usado para identificação de recurso, não são nomeados, são entendidos intrinsecamente: /post/como-criar-uma-api
 * Body: usado paa enviar várias infos numa requisição, corpo da requisição;
 */

export class CreateUserController {
  async handle(request: Request, response: Response) {
    const {
      name,
      email,
      login,
      password,
      address,
      role
    } = request.body

    const hash_password = await hash(password, 8)

    const result = await prismaClient.user.create({
      data: {
        name,
        email,
        login,
        password: hash_password,
        address,
        //  role
      }
    })

    return response.status(201).json(result);
  }
}