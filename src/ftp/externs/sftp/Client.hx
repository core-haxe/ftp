package ftp.externs.sftp;

import js.lib.Promise;

@:jsRequire("ssh2-sftp-client")
extern class Client {
    public function new();
    public function connect(details:Dynamic):Promise<Dynamic>;
    public function list(path:String):Promise<Array<Dynamic>>;
    public function get(path:String, ?dst:Dynamic, ?options:Dynamic):Promise<Dynamic>;
    public function cwd():String;
    public function end():Promise<Dynamic>;
}