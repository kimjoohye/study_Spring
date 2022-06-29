package com.pcwk.ehr.board.dao;

import java.sql.SQLException;
import java.util.List;

import com.pcwk.ehr.board.domain.BoardVO;
import com.pcwk.ehr.cmn.DTO;

public interface BoardDao {
	
	/**
	 * 조회 건수 증가
	 * @param inVO
	 * @return 
	 * @throws SQLException
	 */
	int updateReadCnt(BoardVO inVO) throws SQLException;
	
	/**
	 * 목록 조회
	 * @return List<BoardVO>
	 * @throws SQLException
	 */
	List<BoardVO> doRetrieve(DTO dto) throws SQLException;
	/**
	 * 사용자 삭제
	 * @param inVO
	 * @return 1(성공) / 0(실패)
	 * @throws SQLException
	 */
	int doDelete(BoardVO inVO) throws SQLException;
	
	/**
	 * 사용자 수정 기능
	 * @param inVO
	 * @return 1(성공) / 0(실패)
	 * @throws SQLException
	 */
	int doUpdate(BoardVO inVO) throws SQLException;

	int getCount(BoardVO inVO) throws SQLException;

	/**
	 * 회원 단건 
	 * 
	 * @param inVO
	 * @return BoardVO
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	BoardVO doSelectOne(BoardVO inVO) throws SQLException;

	/**
	 * 사용자 등록
	 * 
	 * @param inVO
	 * @return 1(성공)/0(실패)
	 * @throws ClassCastException
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	int doInsert(BoardVO inVO) throws SQLException; //수정
}
