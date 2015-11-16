package com.sunrise.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sunrise.entity.User;

@Controller
@RequestMapping("/system")
public class SystemController extends HttpServlet{
	
	/*退出*/
	@RequestMapping("/exit")
	public String systemOut(HttpServletRequest req){
		User user = (User)req.getSession().getAttribute("user");
		System.out.println(user.getUserName());
		if(user != null){
			req.getSession().removeAttribute("user");
		}
		return "index";
	}
	
	/*上传文件*/
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");// 防止中文名乱码
		int sizeThreshold = 1024 * 6; // 缓存区大小
		String basePath = this.getServletContext().getRealPath("/upload/");
		File repository = new File(basePath); // 缓存区目录
		long sizeMax = 1024 * 1024 * 2;// 设置文件的大小为2M
		final String allowExtNames = "jpg,gif,bmp,rar,rar,txt,docx";
		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
		diskFileItemFactory.setRepository(repository);
		diskFileItemFactory.setSizeThreshold(sizeThreshold);
		ServletFileUpload servletFileUpload = new ServletFileUpload(
				diskFileItemFactory);
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
				String fileName = filePath.substring(filePath
						.lastIndexOf(File.separator) + 1);
				// String fileName=String.valueOf(System.currentTimeMillis());
				String extName = filePath
						.substring(filePath.lastIndexOf(".") + 1);
				// fileName+="."+extName;
				if (allowExtNames.indexOf(extName) != -1) {
					try {
						fileItem.write(new File(basePath + File.separator
								+ fileName));
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
}
