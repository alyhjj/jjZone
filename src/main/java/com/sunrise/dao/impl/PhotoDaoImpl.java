package com.sunrise.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sunrise.dao.PhotoDao;
import com.sunrise.entity.Photo;

@Repository
public class PhotoDaoImpl implements PhotoDao{
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public List<Photo> selectPhotoByUserId(Photo photo) {
		return this.sessionTemplate.selectList("com.sunrise.dao.PhotoDao.selectPhotoByUserId",photo);
	}
	
	
}
