package test;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

public class TestFtp {
	  
	public static void main(String[] args) throws SocketException,
	IOException {
		FTPClient  ftp = new FTPClient();
		ftp.connect("192.168.40.134");
		ftp.login("admin","admin");
		FileInputStream inputStream = 
				new FileInputStream(new File("D:\\img\\test1.png"));
		ftp.setFileType(FTP.BINARY_FILE_TYPE);
		ftp.changeWorkingDirectory("/home/admin/images");
		ftp.storeFile("xiaoqiang.png",inputStream);
		inputStream.close();
		//关闭此次传输的服务器
		ftp.logout();
		
	}

}
