package ftp.impl.sftp;

import promises.Promise;

interface IFtpClient {
    function connect(details:FtpConnectionDetails):Promise<Bool>;
    function list(path:String = null):Promise<Array<FtpFileDetails>>;
    function disconnect():Promise<Bool>;
}