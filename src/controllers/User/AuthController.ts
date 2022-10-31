import { compare } from 'bcryptjs';
import { Request, Response } from 'express';
import { generateToken } from '../../../utils/utilities';
import { prismaClient } from '../../database/prismaClient';

export class AuthController {
  async handle(request: Request, response: Response) {
    const { email, password } = request.body;


    const user = await prismaClient.user.findUnique({
      where: {
        email
      }
    })

    if (!user) {
      return response.json({ failed: "Email ou senha incorretos." })
    }

    const passwordMatch = await compare(password, user.password);

    if (!passwordMatch) {
      return response.json({ failed: "Email ou senha incorretos." })
    }

    const token = generateToken({ id: user.id })

    return response.json(token);
  }
}