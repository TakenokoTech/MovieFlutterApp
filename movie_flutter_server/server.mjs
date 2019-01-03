const http = require("http");
const connect = require("connect");
const serveStatic = require("serve-static");

const app = connect().use(serveStatic("static"));
http.createServer(app).listen(3000);
