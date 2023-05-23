package com.bandi.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bandi.novel.dto.BoardDetailDto;
import com.bandi.novel.dto.BoardDto;
import com.bandi.novel.dto.BoardSearchDto;
import com.bandi.novel.dto.CategorySelectDto;
import com.bandi.novel.model.BoardFile;
import com.bandi.novel.model.BoardType;
import com.bandi.novel.repository.BoardCategoryRepository;
import com.bandi.novel.repository.BoardFileRepository;
import com.bandi.novel.repository.BoardRepository;
import com.bandi.novel.repository.BoardTypeRepository;

@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;
	@Autowired
	private BoardTypeRepository boardTypeRepository;
	@Autowired
	private BoardCategoryRepository boardCategoryRepository;
	@Autowired
	private BoardFileRepository boardFileRepository;

	// 게시물 등록
	@Transactional
	public void createBoard(BoardDto boardDto) {
		// board_tb에 저장
		int resultRowCount = boardRepository.insert(boardDto);
		// 위에서 저장할 때 자동생성된 boardId 끌어오기
		Integer boardId = boardRepository.selectBoardIdByDTO(boardDto);
		
		boardDto.setId(boardId);
		if(boardDto.getFiles() != null) {
			for(int i = 0; i < boardDto.getFileName().size(); i++) {
				boardFileRepository.insertFile(boardId, boardDto.getRawFileName().get(i), boardDto.getFileName().get(i));
			}
		}
		if(resultRowCount != 1) {
			System.out.println("등록 실패");
		}
	}
	
	// 게시물 카테고리 리스트 불러오기
	@Transactional
	public List<CategorySelectDto> selectCategory(Integer boardTypeId) {
		List<CategorySelectDto> list = boardCategoryRepository.selectCategory(boardTypeId);
		return list;
	}
	
	// 게시물 종류 리스트 불러오기
	@Transactional
	public List<BoardType> selectBoardType() {
		List<BoardType> list = boardTypeRepository.selectBoardTypeAll();
		return list;
	}
	
	// 게시판 종류 별 게시물 리스트 불러오기
	@Transactional
	public List<BoardDto> selectBoardList(Integer boardTypeId) {
		List<BoardDto> list = boardRepository.selectBoardListByBoardTypeId(boardTypeId);
		return list;
	}
	
	// 카테고리별 게시물 리스트 불러오기 
	@Transactional
	public List<BoardDto> selectBoardListByCategoryId(Integer categoryId) {
		List<BoardDto> list = boardRepository.selectBoardListByCategoryId(categoryId);
		return list;
	}
	
	// 게시물 상세보기
	@Transactional
	public BoardDetailDto selectBoardDetailById(Integer id) {
		
		return boardRepository.selectBoardDetailById(id);
	}
	
	// 게시물 수정하기
	@Transactional
	public int updateBoard(BoardDto boardDto) {
		int resultRowCount = boardRepository.updateBoard(boardDto);
		
		if(boardDto.getFiles() != null) {
			for(int i = 0; i < boardDto.getFileName().size(); i++) {
				boardFileRepository.insertFile(boardDto.getId(), boardDto.getRawFileName().get(i), boardDto.getFileName().get(i));
			}
		}
		if(resultRowCount != 1) {
			System.out.println("수정 실패");
		}
		return resultRowCount;
	}
	
	// 게시물 삭제하기
	@Transactional
	public int deleteBoard(Integer id) {
		int resultRowCount = boardRepository.deleteById(id);
		if(resultRowCount != 1) {
			System.out.println("삭제 실패");
		}
		return resultRowCount;
	}
	
	// 게시물 조회수 증가 
	@Transactional
	public void boardViewPlus(Integer boardId) {
		boardRepository.updateViewById(boardId);
	}
	
	// 게시물 검색
	@Transactional
	public List<BoardDto> searchList(BoardSearchDto boardSearchDto) {
		
		return boardRepository.selectSearchList(boardSearchDto);
	}
	
	// 파일 조회
	@Transactional
	public List<BoardFile> selectFileList(Integer boardId) {
		return boardFileRepository.selectFileList(boardId);
	}
	
	// 파일 삭제
	@Transactional
	public int deleteFile(Integer id) {
		int resultRowCount = boardFileRepository.deleteFile(id);
		if(resultRowCount != 1) {
			System.out.println("삭제 실패");
		}
		return resultRowCount;
	}

}
