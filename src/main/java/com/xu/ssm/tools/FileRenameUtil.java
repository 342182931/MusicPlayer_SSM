package com.xu.ssm.tools;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.apache.commons.io.FileUtils;

/**
 * 
 * <p>
 * Title: FileRenameUtil
 * </p>
 * <p>
 * Description:随机创建文件名字-工具类
 * </p>
 * 
 * @author xujianfeng
 * @date 2020年1月29日
 */
public class FileRenameUtil {
	public static String fileRename() {//生成序列号
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String time = sdf.format(new Date());
		StringBuffer buf = new StringBuffer(time);
		Random r = new Random();
		for (int x = 0; x < 3; x++) {// 循环取得三个不大于10的随机整数
			buf.append(r.nextInt(10));
		}
		return buf.toString();
	}
	//生成当前时间
	public static Date systime() throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.parse(sdf.format(new Date()));
	}
	//下载文件
	public static void downloadFile(String fileUrl, String fileLocal) throws Exception {
		URL url = new URL(fileUrl);
		HttpURLConnection urlCon = (HttpURLConnection) url.openConnection();
		urlCon.setConnectTimeout(6000);
		urlCon.setReadTimeout(6000);
		int code = urlCon.getResponseCode();
		if (code != HttpURLConnection.HTTP_OK) {
			throw new Exception("文件读取失败");
		}
		// 读文件流；
		DataInputStream in = new DataInputStream(urlCon.getInputStream());
		DataOutputStream out = new DataOutputStream(new FileOutputStream(fileLocal));
		byte[] buffer = new byte[2048];
		int count = 0;
		while ((count = in.read(buffer)) > 0) {
			out.write(buffer, 0, count);
		}
		out.close();
		in.close();
	}
	public static void downloadURL(String fileUrl, String fileLocal) {
		try {
			FileUtils.copyURLToFile(new URL(fileUrl), new File(""));
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("不合法的URL");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("下载失败");
		}
	}
}
