package ftp.impl.sftp.nodejs;

import ftp.externs.sftp.Client as NativeClient;
import promises.Promise;
import haxe.io.Bytes;
import js.node.Buffer;

class SftpClient extends SftpClientBase {
    private var nativeClient:NativeClient;
    public function new() {
        super();
        nativeClient = new NativeClient();
    }

    public override function connect(details:FtpConnectionDetails):Promise<Bool> {
        return new Promise((resolve, reject) -> {
            nativeClient.connect(details).then(_ -> {
                resolve(true);
            }, error -> {
                reject(new FtpError(error));
            });
        });
    }

    public override function list(path:String = null):Promise<Array<FtpFileDetails>> {
        return new Promise((resolve, reject) -> {
            nativeClient.list(path).then(files -> {
                var resultArray = [];
                for (file in files) {
                    var type:FtpFileType = File;
                    if (file.type == "d") {
                        type = Folder;
                    }
                    resultArray.push({
                        type: type,
                        name: file.name,
                        size: file.size,
                        modifyTime: file.modifyTime,
                        accessTime: file.accessTime
                    });
                }
                resolve(resultArray);
            }, error -> {
                reject(new FtpError(error));
            });
        });
    }

    public override function get(filename:String):Promise<Bytes> {
        return new Promise((resolve, reject) -> {
            nativeClient.get(filename).then(buffer -> {
                var nativeBuffer:Buffer = buffer;
                var bytes = nativeBuffer.hxToBytes();
                resolve(bytes);
            }, error -> {
                reject(error);
            });
        });
    }

    public override function disconnect():Promise<Bool> {
        return new Promise((resolve, reject) -> {
            nativeClient.end().then(_ -> {
                resolve(true);
            }, error -> {
                reject(new FtpError(error));
            });
        });
    }
}