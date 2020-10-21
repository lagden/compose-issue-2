'use strict'

const http = require('http')

const {
	PORT = 3000,
	PORT_PUBLISHED = 3000
} = process.env

const server = http.createServer((req, res) => {
	res.end('ok')
})

server.on('clientError', (error, socket) => {
	if (error.code === 'ECONNRESET' || !socket.writable) {
		return
	}
	socket.end('HTTP/1.1 400 Bad Request\r\n\r\n');
})

server.listen(PORT, () => {
	process.stdout.write('\n')
	process.stdout.write('Server listening...\n')
	process.stdout.write('-------------------\n')
	process.stdout.write(`Local:    http://127.0.0.1:${PORT}\n`)
	process.stdout.write(`External: http://0.0.0.0:${PORT_PUBLISHED}\n`)
})
