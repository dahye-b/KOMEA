package egovframework.komeaweb.com.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.transaction.annotation.Transactional;



public interface MberService {
	
	/**
	 * 글 내용을 조회한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	public MberVO SelectMber(MberVO mberVO) throws Exception;
	
	/**
	 * 글 내용을 수정 한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void UpdateLevel(MberVO mberVO) throws Exception;
	
	/**
	 * 글 목록을 조회한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<MberVO> SelectMberList(MberVO mberVO) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	public int SelectMberListTotCnt(MberVO mberVO) throws Exception;
	
	/**
	 * 글 총 갯수를 조회한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	public int userIdCheck(MberVO mberVO) throws Exception;
	
	/**
	 * 글 내용을 등록 한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void InsertMber(MberVO mberVO, HttpServletRequest request) throws Exception;
	
	/**
	 * 글 내용을 조회한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	public MberVO SelectMberView(MberVO mberVO) throws Exception;
	
	/**
	 * 글 목록을 조회한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<MberVO> SelectMberPointView(MberVO mberVO) throws Exception;
	
	/**
	 * 글 내용을 수정 한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void UpdateMberConfm(MberVO mberVO) throws Exception;
	
	/**
	 * 글 내용을 수정 한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void UpdateUnionCompYn(MberVO mberVO) throws Exception;
	
	/**
	 * 글 내용을 수정 한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void UpdateMber(MberVO mberVO, HttpServletRequest request) throws Exception;
	
	/**
	 * 비밀번호 수정.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void updateMemberPass(MberVO mberVO) throws Exception;
	
	/**
	 * 글 내용을 삭제 한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	@Transactional
	public void DeleteMber(MberVO mberVO, HttpServletRequest request) throws Exception;
	
	/**
	 * 글 목록을 조회한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<MberVO> CompPointList(MberVO mberVO) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	public int CompPointListSum(MberVO mberVO) throws Exception;
	
	/**
	 * 글 내용을 조회한다.
	 * @param mberVO - 조회할 정보가 담긴 VO
	 * @return 글 내용
	 * @exception Exception
	 */
	public MberVO MberPwCheck(MberVO mberVO) throws Exception;
	
	@Transactional
	public void DeleteMberUploadFile(MberVO mberVO) throws Exception;
	
}
