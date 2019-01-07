// アプリケーション作成用のモジュールを読み込み
const { app, BrowserWindow } = require("electron");
const log = require("electron-log");
const path = require("path");

// メインウィンドウ
let mainWindow;
app.disableHardwareAcceleration();

app.on("ready", () => {
    log.info("createWindow");
    mainWindow = new BrowserWindow({
        width: 1920,
        height: 1080
        // frame: false,
        // toolbar: false
    });
    mainWindow.webContents.openDevTools();
    mainWindow.loadFile("html/index.html");
    mainWindow.on("closed", () => {
        mainWindow = null;
    });
    showButtonWindow();
});

app.on("window-all-closed", () => {
    log.info("window-all-closed");
    if (process.platform !== "darwin") {
        app.quit();
    }
});

app.on("activate", () => {
    log.info("activate");
    if (mainWindow === null) {
        createWindow();
    }
});

console.log(
    `${process.versions.node}, Chrome ${process.versions.chrome} and Electron ${
        process.versions.electron
    }.`
);

function showButtonWindow() {
    let win = new BrowserWindow({
        width: 300,
        height: 300
        // frame: false
        // titleBarStyle: "hidden"
    });
    // win.webContents.openDevTools();
    win.loadURL(path.join("file://", __dirname, "html/button.html"));
    win.on("close", () => {
        win = null;
    });
    win.show();
}
