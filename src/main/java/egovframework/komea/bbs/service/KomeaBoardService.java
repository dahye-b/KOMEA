package egovframework.komea.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;

public interface KomeaBoardService {
	
	/**
	 * 글 목록을 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<KomeabbsVO> SelectKomeaMainList(KomeabbsVO bbsVO) throws Exception;

	/**
	 * 글 목록을 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<KomeabbsVO> SelectKomeaList(KomeabbsVO bbsVO) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	public int SelectKomeaListTotCnt(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 내용을 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	public KomeabbsVO SelectKomeaView(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 첨부파일 정보을 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	public KomeabbsVO SelectKomeaFileInfo(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 첨부파일 다운로드시 다운로드횟수를 업데이트 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void UpdateKomeaFileDownCnt(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 첨부파일 다운로드시 다운로드횟수를 업데이트 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void UpdateKomeaDeleteFileIdx(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 *첨부파일 목록을 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<KomeabbsVO> SelectKomeaFileList(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 *이전글, 다음글 목록을 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<KomeabbsVO> SelectKomeaPreNextList(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 내용을 조회할때 조회수를 업데이트 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void UpdateKomeaBoardCnt(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 내용을 등록 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void InsertKomeaBoard(KomeabbsVO bbsVO, HttpServletRequest request) throws Exception;
	
	@Transactional
	public void DeleteBoardFile(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 내용을 수정 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void UpdateKomeaBoard(KomeabbsVO bbsVO, HttpServletRequest request) throws Exception;
	
	/**
	 * 글 내용을 삭제 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void DeleteKomeaBoard(KomeabbsVO bbsVO, HttpServletRequest request) throws Exception;
	
	
	/**
	 * 글 목록을 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<KomeabbsVO> SelectBbsList(KomeabbsVO bbsVO) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	public int SelectBbsListTotCnt(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 내용을 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	public KomeabbsVO SelectBbsView(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 목록을 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<KomeabbsVO> SelectQnaList(KomeabbsVO bbsVO) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	public int SelectQnaListTotCnt(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 내용을 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	public KomeabbsVO SelectQnaView(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 내용을 등록 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void InsertQnaBoard(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 내용을 등록 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void InsertQnaReplyBoard(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 내용을 수정 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void UpdateQnaBoard(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 내용을 삭제 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void DeleteQnaBoard(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 총 갯수를 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	public int SelectQnaReplyTotCnt(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 총 갯수를 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	public int SelectLogTotCnt(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 총 갯수를 조회한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	public int SelectVisitTotCnt(KomeabbsVO bbsVO) throws Exception;

	/**
	 * 글 내용을 등록 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void InsertLogCnt(KomeabbsVO bbsVO) throws Exception;
	
	/**
	 * 글 내용을 수정 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void UpdateLogCnt(KomeabbsVO bbsVO) throws Exception;
}
