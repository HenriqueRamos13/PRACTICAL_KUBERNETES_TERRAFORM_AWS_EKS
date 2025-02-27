import { fastify, FastifyRequest, FastifyReply } from 'fastify'
import { fastifyCors } from '@fastify/cors'
import { validatorCompiler, serializerCompiler, ZodTypeProvider, jsonSchemaTransform } from 'fastify-type-provider-zod'
import { fastifySwagger } from '@fastify/swagger'
import { fastifySwaggerUi } from '@fastify/swagger-ui'
import { routes } from './routes'
import fastifyCookie from 'fastify-cookie';

const app = fastify().withTypeProvider<ZodTypeProvider>()

app.setValidatorCompiler(validatorCompiler)
app.setSerializerCompiler(serializerCompiler)

app.register(fastifyCors, {
    origin: '*'
})

app.register(fastifyCookie);

app.decorate('authenticate', async (request: FastifyRequest, reply: FastifyReply, done: any) => {
    done()
    const token = request.cookies.token; // supondo que o cookie se chame 'token'
    return
    if (!token) {
        return reply.code(401).send({ message: 'Acesso não autorizado' });
    }
    // Aqui você pode adicionar lógica para validar o token, ex: verificar assinatura, expiração, etc.
});


app.register(fastifySwagger, {
    openapi: {
        info: {
            title: 'Auth Service',
            version: '1.0.0',
        },
    },
    transform: jsonSchemaTransform
})

app.register(fastifySwaggerUi, {
    routePrefix: '/docs',
})

app.register(routes as any)

app.listen({
    port: process.env.PORT ? Number(process.env.PORT) : 3333, host: '0.0.0.0'
}).then(() => {
    console.log('HTTP server running!')
})