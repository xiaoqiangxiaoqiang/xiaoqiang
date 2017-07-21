/*****************************************
 *  所属版本  LVDS短信平台       *
 *****************************************/
package com.zdz.hbwj.util;

import java.util.List;

/**
 * Description:
 * 
 * @version $Revision: 1.1 $
 * @author jet li
 * @date: Oct 30, 2007
 * @time: 5:02:32 PM
 */
public class PageModel {
	
	public static final int DEFAULT_PAGE_SIZE = 10;
	
    /**
     * 每页的记录数，实际记录数小于或等于它
     */
    private int pageSize = DEFAULT_PAGE_SIZE;
    /**
     * 总页数
     */
	private int totalCount;
	
	/**
     * 当前页中存放的记录
     */
	private Object data;
	
	/**
     * 当前页第一条数据在数据库中的位置
     */        
    private int offset;
    
    /**
     * 构造方法，只构造空页
     */
    @SuppressWarnings("unused")
	private PageModel() {
    }
    
    /**
     * 默认构造方法
     *
     * @param offset     本页数据在数据库中的起始位置
     * @param totalSize 数据库中总记录条数
     * @param pageSize  本页容量
     * @param data      本页包含的数据
     */
    public PageModel(int offset, int pageSize, int totalCount, Object data) {
        this.pageSize = (pageSize<=0?DEFAULT_PAGE_SIZE:pageSize);
        this.offset = (offset<0?0:offset) ;
        this.totalCount = (totalCount<0?0:totalCount);
        this.data = data;
    }

	/**
	 * @return Returns the pageSize.
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @return Returns the totalCount.
	 */
	public int getTotalCount() {
		return totalCount;
	}

	/**
	 * @return Returns the data.
	 */
	public Object getData() {
		return data;
	}

	/**
	 * @return Returns the offset.
	 */
	public int getOffset() {
		return offset;
	}

    public int getCurrentPage() {
    	return ((offset/pageSize) + 1);
    }
    
    public int getFactCount() {
    	return data==null?0:((List<?>)data).size();
    }
	
    public int getPageCount() {
    	if(totalCount == 0) return 1;
    	
    	int pageCount = totalCount / pageSize;
    	if(totalCount % pageSize != 0) {
    		pageCount++;
    	}
  
    	return pageCount ;
    }
    
}
