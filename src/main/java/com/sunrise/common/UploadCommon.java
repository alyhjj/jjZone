package com.sunrise.common;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UploadCommon {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7381943793149858196L;

	
	public void uploadFileName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");// 防止中文名乱码
		int sizeThreshold = 1024 * 6; // 缓存区大小
		String basePath = request.getRealPath("/upload/");
		File repository = new File(basePath); // 缓存区目录
		long sizeMax = 1024 * 1024 * 2;// 设置文件的大小为2M
		final String allowExtNames = "jpg,gif,bmp,rar,rar,txt,docx";
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		diskFileItemFactory.setRepository(repository);
		diskFileItemFactory.setSizeThreshold(sizeThreshold);
		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
		servletFileUpload.setSizeMax(sizeMax);

		List<FileItem> fileItems = null;
		try {
			fileItems = servletFileUpload.parseRequest(request);

			for (FileItem fileItem : fileItems) {
				long size = 0;
				String filePath = fileItem.getName();
				System.out.println(filePath);
				if (filePath == null || filePath.trim().length() == 0)
					continue;
				String fileName = filePath.substring(filePath.lastIndexOf(File.separator) + 1);
				// String fileName=String.valueOf(System.currentTimeMillis());
				String extName = filePath.substring(filePath.lastIndexOf(".") + 1);
				// fileName+="."+extName;
				if (allowExtNames.indexOf(extName) != -1) {
					try {
						fileItem.write(new File(basePath + File.separator + fileName));
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					throw new FileUploadException("file type is not allowed");
				}
			}
		} catch (FileSizeLimitExceededException e) {
			System.out.println("file size is not allowed");
		} catch (FileUploadException e1) {
			e1.printStackTrace();
		}

	}
	
	
	/**
	 * 实现文件上传
	 * @param req 页面http请求
	 * @param res 相应
	 * @return String 服务器图片的路径
	 */
	public static String getUploadFile(HttpServletRequest req,HttpServletResponse res){
		String fileName = null;
		try {
			//设置http请求对象的编码集 utf-8
			req.setCharacterEncoding("utf-8");
			//判断提交过来的表单是否为文件上传的表单
			boolean bol = ServletFileUpload .isMultipartContent(req);
			if(bol){
				//构造一个文件上传的对象
				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				//定义迭代器
				Iterator items = upload.parseRequest(req).iterator();
				while (items.hasNext()) {
					FileItem item =  (FileItem)items.next();//返回一个文件对象
					//判断参数作用域是普通的表单还是文件上传的域
					boolean ite = item.isFormField();
					if(!ite){
						//获取上传文件名
						fileName = item.getName();
						//创建上传文件的上传位置
						String filePath = req.getRealPath("resources/i/");
						File f = new File(filePath);
						//判断是否存在此文件夹
						if(!f.exists()){
							f.mkdirs();
						}
						//构造上传文件的路径
						File uploadFile = new File(filePath + "\\" + fileName);
						//获取文件的大小
						//Long l = item.getSize();
						item.write(uploadFile);
					}
				}
			}
			System.out.println(fileName);
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
