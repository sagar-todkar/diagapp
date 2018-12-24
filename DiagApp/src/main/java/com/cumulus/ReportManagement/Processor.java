package com.cumulus.ReportManagement;
import java.io.File;
import java.io.FileInputStream;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

public class Processor {
	private String host;
	private Integer port;
	private String user;
	private String password;
	private String SessionId;
	
	private JSch jsch;
	private Session session;
	private Channel channel;
	private ChannelSftp sftpChannel;
	
	public Processor(String host, Integer port, String user, String password,String sessionId) {
		this.host = host;
		this.port = port;
		this.user = user;
		this.password = password;
		this.SessionId = sessionId;
	}
	public void connect() {
		System.out.println("connecting..."+host);
		try {
			jsch = new JSch();
			session = jsch.getSession(user, host,port);
			session.setConfig("StrictHostKeyChecking", "no");
		    session.setConfig("PreferredAuthentications","publickey,keyboard-interactive,password");
			session.setPassword(password);
			session.connect();

			channel = session.openChannel("sftp");
			channel.connect();
			sftpChannel = (ChannelSftp) channel;

		} catch (JSchException e) {
			e.printStackTrace();
		}
	}
	public void disconnect() {
		System.out.println("disconnecting...");
		sftpChannel.disconnect();
		channel.disconnect();
		session.disconnect();
	}
	
	public void upload(File fileName, String remoteDir,String origianlFileName) {
		FileInputStream fis = null;
		connect();
		try {
			// Change to output directory
			sftpChannel.mkdir("/data/work/"+SessionId);
			sftpChannel.cd(remoteDir+"/"+SessionId);

			// Upload file
			fis = new FileInputStream(fileName);
			sftpChannel.put(fis, origianlFileName);

			fis.close();
			System.out.println("File uploaded successfully - "+ fileName.getAbsolutePath());

		} catch (Exception e) {
			e.printStackTrace();
		}
		disconnect();
	}
}
