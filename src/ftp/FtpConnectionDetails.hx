package ftp;

typedef FtpConnectionDetails = {
    public var host:String;
    @:optional var port:Null<Int>;
    @:optional var username:String;
    @:optional var password:String;
}