const http = require("http");
const connect = require("connect");
const serveStatic = require("serve-static");
const HLSServer = require("hls-server");
const express = require("express");
const app = express();

const hls = new HLSServer(app, {
    path: "/streams",
    dir: "movie"
});

// app.get('/', (req, res) => res.send('Hello World!'))
app.use(express.static("static"));

app.listen(3000, () =>
    console.log("Example app listening on port http://localhost:3000")
);
