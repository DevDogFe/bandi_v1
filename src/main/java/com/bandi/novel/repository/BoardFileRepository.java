package com.bandi.novel.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;
import com.bandi.novel.model.BoardFile;


@Mapper
public interface BoardFileRepository {
	
	// 파일 업로드
	int insertFile(@Param("boardId") Integer boardId, @Param("rawFileName") String rawFileName, @Param("encodedFileName") String encodedFileName);
	// 파일 조회
	List<BoardFile> selectFileList(Integer boardId);
	// 파일 삭제
	int deleteFile(Integer id);
	// 파일 수정
	int updateFile(@Param("boardId") Integer boardId, @Param("rawFileName") String rawFileName, @Param("encodedFileName") String encodedFileName);
}
