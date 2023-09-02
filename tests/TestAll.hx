package;

import utest.ui.common.HeaderDisplayMode;
import utest.ui.Report;
import utest.Runner;
import cases.*;
import ftp.externs.sftp.Client as NativeClient;

class TestAll {
    public static function main() {
        var runner = new Runner();
        
        runner.addCase(new cases.sftp.TestBasic());

        Report.create(runner, SuccessResultsDisplayMode.AlwaysShowSuccessResults, HeaderDisplayMode.NeverShowHeader);
        runner.run();

        /*
        var nativeClient = new NativeClient();
        nativeClient.connect({
            host: "test.rebex.net",
            username: "demo",
            password : "password",
            port : 22
        }).then(_ -> {
                trace("connected");
          return nativeClient.end();      
        }).then(_ -> {
        }, error -> {
            trace("-------------------------------->>>>>>>>>>>>>>>>>>> ", error);
        });
        */

    }
}