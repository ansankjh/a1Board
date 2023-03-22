package goodee.gdj58.a1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import goodee.gdj58.a1.dao.BoardDao;
import goodee.gdj58.a1.vo.Board;


@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao;
	
	// a1 게시글 삭제
	public void removeBoard(String boardTitle) {
		System.out.println(boardTitle + "<-- boardTitle 서비스단 삭제액션 디버깅");
		boardDao.deleteBoard(boardTitle);
	}
	
	// a1 게시글 수정
	public void modifyBoard(Board board) {
		// System.out.println(board.getBoardTitle() + "<-- boardTitle 서비스단 수정액션 디버깅");
		// System.out.println(board.getBoardMemo()+ "<-- boardMemo 서비스단 수정액션 디버깅");
		// System.out.println(board.getBoardLevel() + "<-- boardLevel 서비스단 수정액션 디버깅");
		boardDao.updateBoard(board);
	}
	
	// a1 게시글 등록
	public void addBoard(Board board) {
		boardDao.insertBoard(board);
    }
	
	// a1 게시글 조회
	public List<Board> getBoardList() {
		return boardDao.selectBoardList();
	}
}
