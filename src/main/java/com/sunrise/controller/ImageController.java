package com.sunrise.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sunrise.entity.Data;
import com.sunrise.entity.IData;
import com.sunrise.entity.Image;
import com.sunrise.entity.Photo;
import com.sunrise.entity.User;
import com.sunrise.service.ImageService;
import com.sunrise.service.PhotoService;

@Controller
@RequestMapping("/images")
public class ImageController {
	@Autowired
	private ImageService imageService;
	@Autowired
	private PhotoService photoService;
	/**
	 * 查看相册名和相册id和相册照片数量
	 * @param req
	 * @param res
	 * @return
	 */
	@RequestMapping("/selectPhoto")
	@ResponseBody
	public String selectPhoto(HttpServletRequest req,HttpServletResponse res){
		User ss = (User)req.getSession().getAttribute("user");
		//需要Photo---id 、 name 、 id--number
		Photo photo = new Photo();
		photo.setUserId(ss.getUserId());
		List<Photo> pho = photoService.selectPhotoByUserId(photo);
		Image image = new Image();
		image.setUserId(ss.getUserId());
		//List<HashMap<Integer, Object>> map = new ArrayList<HashMap<Integer,Object>>();
		List<IData> map = new ArrayList<IData>();
		if(pho.size() != 0){
			for (int i = 0; i < pho.size(); i++) {
				image.setPhotoId(pho.get(i).getPhotoId());
				int photoByNumber = imageService.selectCountByPhotoId(image);
				//HashMap<Integer, Object> resultImages = new HashMap<Integer, Object>();
				//先存id和name、再存id和数量
				IData data = new Data();
				data.put("id", pho.get(i).getPhotoId());
				data.put("name", pho.get(i).getPhotoName());
				data.put("num", photoByNumber);
				map.add(data);
				/*resultImages.put(pho.get(i).getPhotoId(), pho.get(i).getPhotoName());
				resultImages.put(pho.get(i).getPhotoId(), photoByNumber);
				map.add(resultImages);*/
				
			}
		}
		
		
		
		return new JSONArray(map).toString();
	}
	/**
	 * 根据相册ID和用户ID查找下面的图片
	 * @param req
	 * @param res
	 * @return
	 */
	@RequestMapping("/selectImages")
	@ResponseBody
	public String selectImages(HttpServletRequest req,HttpServletResponse res,Image image){
		User ss = (User)req.getSession().getAttribute("user");
		System.out.println(image.getPhotoId());
		image.setUserId(ss.getUserId());
		List<Image> images = imageService.selectAllImageByPhotoId(image);
		return new JSONArray(images).toString();
	}
}
