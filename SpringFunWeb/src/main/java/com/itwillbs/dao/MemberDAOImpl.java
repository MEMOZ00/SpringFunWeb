package com.itwillbs.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
//import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	//마이바티스 디비연결 
	//@inject => root-context.xml 파일에 객체생성된 "sqlSession" 찾아서 자동으로 가져옴
	@Inject
	private SqlSession sqlSession;
	
	static String namespace="com.itwillbs.mappers.memberMapper";
	
	@Override
	public void insertMember(MemberDTO memberDTO) {
		// 디비작업 
		System.out.println("MemberDAOImpl insertMember()");
		memberDTO.setDate(new Timestamp(System.currentTimeMillis()));
		// template.update(sql, memberDTO.getId(), memberDTO.getPass(),memberDTO.getName(), memberDTO.getDate());
		// myBatise memberMapper.xml의 sql 구문 호출하여 사용
		// .insert(sql구문이름, ?표에입력될 변수명)
		sqlSession.insert(namespace+".insertMember", memberDTO);
	}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberDAOImpl userCheck()");
		//return 값이 하나일 때 selectOne 사용
		// .selectOne(sql구문이름, ?표에입력될 변수명) 쿼리 결과를 resultType으로 가져옴
		return sqlSession.selectOne(namespace+".userCheck", memberDTO);
	}
	
	@Override
	public MemberDTO getMember(String id) {
		System.out.println("MemberDAOImpl getMember()");
		//return 값이 하나일 때 selectOne 사용
		// .selectOne(sql구문이름, ?표에입력될 변수명) 쿼리 결과를 resultType으로 가져옴
		return sqlSession.selectOne(namespace+".getMember", id); 
	}
	
	@Override
	public void updateMember(MemberDTO memberDTO) {
		// 디비작업 
		System.out.println("MemberDAOImpl updateMember()");
		// template.update(sql, memberDTO.getId(), memberDTO.getPass(),memberDTO.getName(), memberDTO.getDate());
		// myBatise memberMapper.xml의 sql 구문 호출하여 사용
		// .insert(sql구문이름, ?표에입력될 변수명)
		sqlSession.update(namespace+".updateMember", memberDTO);
	}
	
	@Override
	public void deleteMember(MemberDTO memberDTO) {
		// 디비작업 
		System.out.println("MemberDAOImpl deleteMember()");
		// template.update(sql, memberDTO.getId(), memberDTO.getPass(),memberDTO.getName(), memberDTO.getDate());
		// myBatise memberMapper.xml의 sql 구문 호출하여 사용
		// .insert(sql구문이름, ?표에입력될 변수명)
		sqlSession.delete(namespace+".deleteMember", memberDTO);
	}
	
	@Override
	public List<MemberDTO> getMemberList() {
		// 디비작업 
		System.out.println("MemberDAOImpl deleteMember()");
		// template.update(sql, memberDTO.getId(), memberDTO.getPass(),memberDTO.getName(), memberDTO.getDate());
		// myBatise memberMapper.xml의 sql 구문 호출하여 사용
		// .insert(sql구문이름, ?표에입력될 변수명)
		return sqlSession.selectList(namespace+".getMemberList"); 
	}
	
	@Override
	public List<Map<String, Object>> getMemberListMap() {
		System.out.println("MemberDAOImpl getMemberListMap()");
		
		return sqlSession.selectList(namespace+".getMemberListMap");
	};
	
}// class
