package com.sunrise.dao;

import java.util.List;

import com.sunrise.entity.Publish;


public interface PublishDao {
	/**
	 * 发表说说
	 * @param publish
	 * @return
	 */
	public int insertPublish(Publish publish);
	/**
	 * 删除说说
	 * @param publish
	 * @return
	 */
	public int deletePublish(Publish publish);
	/**
	 * 用户登录时，查询用户下发表的所有说说
	 * @param publish
	 * @return
	 */
	public List<Publish> selectPublish(Publish publish);
}
