package baseSrc.common;

import java.io.File;



public class Constants {
	//上传文件根目录
	public static String UPLOAD_PATH = "/usr";
				
    //上传文件路径
	public static String UPLOAD_DIR = File.separator+"sys"+File.separator+"sysUpload"+File.separator;
	//系统路径
	public static String ROOT_PATH="E:" + File.separator;//该路径未发现使用
	//单个文件上传数据最大值
	public static long UPLOAD_FILE_SIZE_MAX = 2 * 1024 * 1024;//2M
}
  