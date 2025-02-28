import z from 'zod';
import { FastifyTypedInstance } from './types';
import { randomUUID } from 'crypto';
import bcrypt from 'bcryptjs';

interface User {
    id: string;
    name: string;
    email: string;
    password: string;
}

const users: User[] = [];

export async function routes(app: FastifyTypedInstance) {
    app.get('/users', {
        // preHandler: [app.authenticate],
        schema: {
            tags: ['users'],
            description: 'Get all users',
            response: {
                200: z.object({
                    users: z.array(z.object({ id: z.string(), name: z.string(), email: z.string() })),
                }),
            },
        },
    }, async (request, reply) => {
        return reply.status(200).send({ users })
    })

    app.post('/users', {
        schema: {
            tags: ['users'],
            description: 'Create a new user',
            body: z.object({
                name: z.string(),
                email: z.string().email(),
                password: z.string().min(8),
            }),
            response: {
                201: z.object({
                    message: z.string(),
                    user: z.object({ id: z.string(), name: z.string(), email: z.string() }),
                }),
                400: z.object({
                    message: z.string(),
                }),
            },
        },
    }, async (request, reply) => {
        const { name, email, password } = request.body;

        const userAlreadyExists = users.find((user) => user.email === email);
        if (userAlreadyExists)
            return reply.status(400).send({ message: 'User already exists' })

        const user: User = {
            id: randomUUID(),
            name,
            email,
            password: await bcrypt.hash(password, 10),
        }
        users.push(user);

        const toReturn = {
            message: 'User created',
            user: {
                id: user.id,
                name: user.name,
                email: user.email,
            },
        }

        return reply.status(201).send(toReturn)
    })

    app.get('/cpu-intensive', {
        schema: {
            tags: ['stress-test'],
            description: 'Rota para simular carga pesada de CPU',
        },
    }, async (request, reply) => {
        const start = Date.now();
        let sum = 0;
        // Loop que simula uma operação intensiva de CPU.
        for (let i = 0; i < 1e9; i++) {
            sum += i % 10;
        }
        const duration = Date.now() - start;
        return reply.send({ sum, duration });
    });
}