package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iu.board.BoardDAO;
import com.iu.board.BoardDTO;
import com.iu.page.RowNumber;
import com.iu.util.DBControl;
import com.oreilly.servlet.MultipartRequest;



public class NoticeDAO implements BoardDAO{
	

	@Override
	public List<BoardDTO> selectList(RowNumber rowNumber) throws Exception {
		
		Connection con = DBControl.getconnect();
		String sql = "select * from "
				+ "(select rownum R, N.* from "
				+ "(select num,title,writer,reg_date,hit from notice "
				+ "where "+rowNumber.getSearch().getKind()+" like ? "
				+ "order by num desc) N) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+rowNumber.getSearch().getSearch()+"%");
		st.setInt(2, rowNumber.getStartRow());
		st.setInt(3, rowNumber.getLastRow());
		
		ResultSet rs = st.executeQuery();
		List<BoardDTO> ar = new ArrayList<>();
		NoticeDTO nDto = null;
		while(rs.next()) {
			nDto = new NoticeDTO();
			nDto.setNum(rs.getInt("num"));
			nDto.setTitle(rs.getString("title"));
			nDto.setWriter(rs.getString("writer"));
			nDto.setReg_date(rs.getDate("reg_date"));
			nDto.setHit(rs.getInt("hit"));
			
			ar.add(nDto);
		}
		DBControl.disconnect(rs, st, con);
		return ar;
	}

	@Override
	public BoardDTO selectOne(int num) throws Exception {
		Connection con = DBControl.getconnect();
		String sql = "select * from notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		NoticeDTO nDto = null;
		if(rs.next()) {
			nDto=new NoticeDTO();
			nDto.setNum(rs.getInt("num"));
			nDto.setTitle(rs.getString("title"));
			nDto.setContents(rs.getString("contents"));
			nDto.setWriter(rs.getString("writer"));
			nDto.setReg_date(rs.getDate("reg_date"));
			nDto.setHit(rs.getInt("hit"));
			
		}
		DBControl.disconnect(rs, st, con);
		return nDto;
	}
	
	//seq가져오기
	public int getNum() throws Exception{
		Connection con = DBControl.getconnect();
		String sql = "select notice_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		DBControl.disconnect(rs, st, con);
		return result;
	}

	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		Connection con = DBControl.getconnect();
		String sql = "insert into notice values(?,?,?,?,sysdate,0)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, boardDTO.getNum());
		st.setString(2, boardDTO.getTitle());
		st.setString(3, boardDTO.getContents());
		st.setString(4, boardDTO.getWriter());
		
		int result = st.executeUpdate();
		
		DBControl.disconnect(st, con);
		
		return result;
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		
		return 0;
	}

	@Override
	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getCount(String kind, String search) throws Exception {
		Connection con = DBControl.getconnect();
		String sql = "select count(num) from notice "
				+ "where "+kind+" like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int result = rs.getInt(1);
		
		DBControl.disconnect(rs, st, con);
		
		return result;
	}
	

}
