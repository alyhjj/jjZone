package com.sunrise.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunrise.dao.PhotoDao;
import com.sunrise.entity.Photo;

@Service
public class PhotoService {
	@Autowired
	private PhotoDao dao;
	
	public List<Photo> selectPhotoByUserId(Photo photo){
		return this.dao.selectPhotoByUserId(photo);
	}
}
