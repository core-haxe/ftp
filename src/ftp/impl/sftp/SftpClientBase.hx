package ftp.impl.sftp;

import promises.Promise;
import haxe.io.Bytes;

class SftpClientBase implements IFtpClient {
    public function new() {
    }

    public function connect(details:FtpConnectionDetails):Promise<Bool> {
        return new Promise((resolve, reject) -> {
            reject("not implemented");
        });
    }

    public function list(path:String = null):Promise<Array<FtpFileDetails>> {
        return new Promise((resolve, reject) -> {
            reject("not implemented");
        });
    }

    public function get(filename:String):Promise<Bytes> {
        return new Promise((resolve, reject) -> {
            reject("not implemented");
        });
    }

    public function disconnect():Promise<Bool> {
        return new Promise((resolve, reject) -> {
            reject("not implemented");
        });
    }
}