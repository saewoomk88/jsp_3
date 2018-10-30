package com.iu.qna;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBControl;

public class QnaDAO {
	
	public int reply(QnaDTO qnaDTO) throws Exception{
		Connection con = DBControl.getconnect();
		String sql = "insert into qna values(qna_seq.nextval,?,?,?,sysdate,0,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getContents());
		st.setString(3, qnaDTO.getWriter());
		st.setInt(4, qnaDTO.getRef());
		st.setInt(5, qnaDTO.getStep());
		st.setInt(6, qnaDTO.getDepth());
		int result = st.executeUpdate();
		DBControl.disconnect(st, con);
		return result;
	}
	
	public int stepUpdate(QnaDTO parent) throws Exception {
		Connection con = DBControl.getconnect();
		String sql = "update qna set step=step+1 where ref=? and step>?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, parent.getRef());
		st.setInt(2, parent.getStep());
		int result = st.executeUpdate();
		
		DBControl.disconnect(st, con);
		return result;
		
	}
	
	
	public QnaDTO selectOne(int num) throws Exception{
		Connection con = DBControl.getconnect();
		String sql = "select * from qna where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		QnaDTO qnaDTO = null;
		if(rs.next()) {
			qnaDTO = new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setContents(rs.getString("contents"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			qnaDTO.setHit(rs.getInt("hit"));
			qnaDTO.setRef(rs.getInt("ref"));
			qnaDTO.setStep(rs.getInt("step"));
			qnaDTO.setDepth(rs.getInt("depth"));
		}
		DBControl.disconnect(rs, st, con);
		return qnaDTO;
	}
	
	public int insert(QnaDTO qnaDTO) throws Exception {
		Connection con = DBControl.getconnect();
		String sql = "insert into qna values(qna_seq.nextval,?,?,?,sysdate,0,qna_seq.currval,0,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, qnaDTO.getTitle());
		st.setString(2, qnaDTO.getContents());
		st.setString(3, qnaDTO.getWriter());
		int result = st.executeUpdate();
		DBControl.disconnect(st, con);
		return result;
	}
	
	public int getCount(String kind, String search) throws Exception{
		Connection con = DBControl.getconnect();
		String sql = "select count(num) from qna "
				+ "where "+kind+" like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int result =rs.getInt(1);
		
		DBControl.disconnect(rs, st, con);
		return result;
		
	}
	
	//selectList
	public ArrayList<QnaDTO> selectList (int startRow, int lastRow, String kind, String search) throws Exception{
		Connection con = DBControl.getconnect();
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from qna where "+kind+" like ? order by ref desc, step asc) N) "
						+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		
		ResultSet rs = st.executeQuery();
		ArrayList<QnaDTO> ar = new ArrayList<>();
		QnaDTO qnaDTO = null;
		while(rs.next()) {
			qnaDTO= new QnaDTO();
			qnaDTO.setNum(rs.getInt("num"));
			qnaDTO.setTitle(rs.getString("title"));
			qnaDTO.setWriter(rs.getString("writer"));
			qnaDTO.setReg_date(rs.getDate("reg_date"));
			qnaDTO.setHit(rs.getInt("hit"));
			qnaDTO.setDepth(rs.getInt("depth"));
			
			ar.add(qnaDTO);
			
			
		}
		DBControl.disconnect(rs, st, con);
		return ar;
		
		
	}

}
