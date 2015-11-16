package com.sunrise.dao;

import java.util.List;

import com.sunrise.entity.Image;


public interface ImageDao {
	/**
	 * 用户注册后，默认头像
	 * @param images
	 * @return
	 */
	public int insertImage(Image images);
	/**
	 * 更改头像
	 * @param images
	 * @return
	 */
	public int updateImageAdress(Image images);
	/**
	 * 查询此用户的头像地址
	 * @param image
	 * @return
	 */
	public Image selectImage(Image image);
	/**
	 * 根据用户ID和相册id遍历图片
	 * @param image
	 * @return
	 */
	public List<Image> selectAllImageByPhotoId(Image image);
	/**
	 * 计算某相册的相片数量
	 * @param image
	 * @return
	 */
	public int selectCountByPhotoId(Image image);
	
}
