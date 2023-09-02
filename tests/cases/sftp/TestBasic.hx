package cases.sftp;

import ftp.FtpFileType;
import utest.Assert;
import utest.Async;
import utest.Test;

import ftp.FtpClient;

@:timeout(20000)
class TestBasic extends Test {
    function testBasic(async:Async) {
        Assert.equals(1, 1);
        var client = new FtpClient();
        client.connect({
            host: "test.rebex.net",
            username: "demo", 
            password: "password"
        }).then(_ -> {
            return client.list(".");
        }).then(files -> {
            Assert.equals(2, files.length);

            Assert.equals(FtpFileType.Folder, files[0].type);
            Assert.equals("pub", files[0].name);
            Assert.equals(0, files[0].size);

            Assert.equals(FtpFileType.File, files[1].type);
            Assert.equals("readme.txt", files[1].name);
            Assert.equals(405, files[1].size);
        }).then(_ -> {
            return client.disconnect();
        }).then(_ -> {
            async.done();
        }, error -> {
            trace(error);
        });
    }
}