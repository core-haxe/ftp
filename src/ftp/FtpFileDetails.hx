package ftp;

typedef FtpFileDetails = {
    var type:FtpFileType;
    var name:String;
    var modifyTime:Int;
    var accessTime:Int;
    var size:Int;
}