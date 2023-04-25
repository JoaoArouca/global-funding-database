import fastify from 'fastify'
import dotenv from 'dotenv'

dotenv.config()
const app = fastify()

app
  .listen({
    port: Number(process.env.PORT),
  })
  .then(() => {
    console.log(`HTTP server running in port ${process.env.PORT}`)
  })
