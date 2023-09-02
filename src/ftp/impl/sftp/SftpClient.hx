package ftp.impl.sftp;

#if nodejs

typedef SftpClient = ftp.impl.sftp.nodejs.SftpClient;

#else

typedef SftpClient = ftp.impl.sftp.fallback.SftpClient;

#end