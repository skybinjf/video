package com.jmu.video.util;

import java.util.Comparator;

import com.jmu.video.entity.Chapter;

public class ComparatorChapter implements Comparator<Chapter>{
	/**
	 * 先按章节的名称排序，如果名称相同，则按ID排
	 */
	@Override
	public int compare(Chapter o1, Chapter o2) {
		int flag = o1.getChapterName().compareTo(o2.getChapterName());
		
		if(flag == 0){
			return o1.getChapterId().compareTo(o2.getChapterId());
		}else {
			return flag;
		}
	}

}
