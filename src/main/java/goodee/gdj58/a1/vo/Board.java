package goodee.gdj58.a1.vo;

import lombok.Data;


@Data
public class Board {
	private String boardTitle; // 타이틀
	private String boardMemo; // 본문
	private String boardName; // 닉네임
	private String boardLevel; // 0과 1 1이면 중요 게시물
}
