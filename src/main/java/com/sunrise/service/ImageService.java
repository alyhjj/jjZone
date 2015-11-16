package com.sunrise.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunrise.dao.ImageDao;
import com.sunrise.entity.Image;


@Service
public class ImageService {
	@Autowired
	private ImageDao dao;
	
	public int insertImages(Image images){
		return this.dao.insertImage(images);
	}
	public int updateImageAdress(Image images){
		return this.dao.updateImageAdress(images);
	}
	public Image selectImage(Image image){
		return this.dao.selectImage(image);
	}
	public List<Image> selectAllImageByPhotoId(Image image){
		return this.dao.selectAllImageByPhotoId(image);
	}
	public int selectCountByPhotoId(Image image){
		return this.dao.selectCountByPhotoId(image);
	}
	
}
