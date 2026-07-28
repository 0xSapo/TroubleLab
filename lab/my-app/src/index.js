const http = require('http');

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200, {'Content-Type': 'application/json'});
    res.end(JSON.stringify({ status: 'ok', version: '1.0.0' }));
  } else {
    res.writeHead(200);
    res.end('Hello from my lab!\n');
  }
});

server.listen(3001, () => console.log('Running on port 3001'));
