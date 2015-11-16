/**
 * 
 */
package com.sunrise.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface IDataList extends List<Map<String,Object>>,Serializable{
	public IData getData(int index);
	public String toString();
}
