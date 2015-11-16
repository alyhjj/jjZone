package com.sunrise.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sunrise.dao.ImageDao;
import com.sunrise.entity.Image;


@Repository
public class ImageDaoImpl implements ImageDao{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int insertImage(Image images) {
		return this.sqlSessionTemplate.insert("com.sunrise.dao.ImageDao.insertImage",images);
	}

	public int updateImageAdress(Image images) {
		return this.sqlSessionTemplate.update("com.sunrise.dao.ImageDao.updateImageAdress",images);
	}

	public Image selectImage(Image image) {
		return this.sqlSessionTemplate.selectOne("com.sunrise.dao.ImageDao.selectImage",image);
	}

	public List<Image> selectAllImageByPhotoId(Image image) {
		return this.sqlSessionTemplate.selectList("com.sunrise.dao.ImageDao.selectAllImageByPhotoId",image);
	}

	public int selectCountByPhotoId(Image image) {
		return this.sqlSessionTemplate.selectOne("com.sunrise.dao.ImageDao.selectCountByPhotoId",image);
	}
	
	
}
