package ftp.impl.sftp;

import promises.Promise;
import haxe.io.Bytes;

interface IFtpClient {
    function connect(details:FtpConnectionDetails):Promise<Bool>;
    function list(path:String = null):Promise<Array<FtpFileDetails>>;
    function get(filename:String):Promise<Bytes>;
    function disconnect():Promise<Bool>;
}