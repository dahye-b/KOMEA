package egovframework.komea.comp.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

public interface KomeaCompService {

	/**
	 * 글 목록을 조회한다.
	 * @param compVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<KomeaCompVO> SelectCompList(KomeaCompVO compVO) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 * @param compVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	public int SelectCompListTotCnt(KomeaCompVO compVO) throws Exception;
	
	/**
	 * 글 내용을 조회한다.
	 * @param compVO - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	public KomeaCompVO SelectCompView(KomeaCompVO compVO) throws Exception;
	
	/**
	 * 글 내용을 수정 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void InsertComp(KomeaCompVO compVO) throws Exception;
	
	/**
	 * 글 내용을 수정 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void DeleteComp(KomeaCompVO compVO) throws Exception;
	
	/**
	 * 글 내용을 수정 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void DeleteCompId(KomeaCompVO compVO) throws Exception;
	
	/**
	 * 글 내용을 수정 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void InsertMberComp(KomeaCompVO compVO) throws Exception; 
	
	/**
	 * 글 내용을 수정 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void UpdateCompArea(KomeaCompVO compVO) throws Exception;
	
	/**
	 * 글 내용을 수정 한다.
	 * @param bbsvo - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void DeleteCompAll(KomeaCompVO compVO) throws Exception;	
	
	@Transactional
	public List<?> InsertCompExcelList(String fileName) throws Exception;
}
