const http = require('http');
const fs = require('fs');
const ws = require('ws');

const wss = new ws.Server({noServer: true});

function accept(req, res) {
    if (req.url === '/ws' && req.headers.upgrade &&
        req.headers.upgrade.toLowerCase() === 'websocket' &&
        req.headers.connection.match(/\bupgrade\b/i))
    {
        wss.handleUpgrade(req, req.socket, Buffer.alloc(0), onSocketConnect);
    } else if (req.url === '/')  {
        fs.createReadStream('./index.html').pipe(res);
    } else {
        res.writeHead(404);
        res.end();
    }
}
const clients = new Set();

function onSocketConnect(ws) {
    clients.add(ws);
    ws.on('message', function(message) {
        const packet = JSON.parse(message.toString());
        packet = {...packet, message: packet.message.slice(0, 50)};
        for (const client of clients) {
            client.send(JSON.stringify(packet));
        }
    });
    ws.on('close', function() {
        log(`Connection closed`);
        clients.delete(ws);
    });
}

let log

if (require.main) { // TODO !module["parent"] ?
    log = console.log;
    http.createServer(accept).listen(8080);
} else {
    log = ()=>{};
    exports.accept = accept;
}
/*
cd Harjutus11Vestlusruum

node server.js

npm init -y

npm install http fs ws

npm run start
*/