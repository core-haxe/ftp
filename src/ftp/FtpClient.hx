package ftp;

import promises.Promise;
import ftp.impl.sftp.IFtpClient;
import haxe.io.Bytes;

class FtpClient implements IFtpClient {
    private var secure:Bool = true;
    private var clientImpl:IFtpClient = null;

    public function new(secure:Bool = true) {
        this.secure = secure;
        createClient();

    }

    public function connect(details:FtpConnectionDetails):Promise<Bool> {
        if (details.port == null) {
            details.port = 22;
        }
        return clientImpl.connect(details);
    }

    public function disconnect():Promise<Bool> {
        return clientImpl.disconnect();
    }

    public function list(path:String = null):Promise<Array<FtpFileDetails>> {
        if (path == null) {
            path = ".";
        }
        return clientImpl.list(path);
    }

    public function get(filename:String):Promise<Bytes> {
        return clientImpl.get(filename);
    }

    private function createClient() {
        if (secure) {
            clientImpl = new ftp.impl.sftp.SftpClient();
        }
    }
}