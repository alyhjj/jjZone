package com.sunrise.dao;

import java.util.List;

import com.sunrise.entity.Photo;



public interface PhotoDao {
	/**
	 * 通过用户ID查询出相册的相关信息
	 * @param photo
	 * @return
	 */
	public List<Photo> selectPhotoByUserId(Photo photo);
}
