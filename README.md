1. a1Board 간단한 설명 :  
데이터베이스를 사용하지 않으므로 DAO에 List를 선언한여 데이터베이스 대용으로 사용하였습니다.  
게시글등록은 List의 add 함수를 사용하였습니다.  
게시글수정은 List의 set 함수를 사용하였습니다.  
게시글삭제는 List의 remove 함수를 사용하였습니다.  
검색은 jquery로 keyup 이벤트처리로 구현하였습니다.  
게시글 등록한 닉네임은 다음 게시글 등록에도 자동으로 닉네임칸에 입력됩니다.  
게시글 등록시 중요 체크박스에 체크를 하면 타이틀과 본문의 테이블칸의 배경이 빨간색으로 변합니다.

2. a1Board 실행방법  
Spring Tool Suite를 실행  
-> git Perspective에 가서 repository를 복제  
-> 다시 java Perspective에 가서 Import > Maven > Existing Maven Projects를 해서 프로젝트를 가져옵니다.  
-> 프로젝트를 우클릭하여 Rus As -> Spring Boot App를 눌러 프로젝트를 시작해줍니다.  
-> localhost/a1/boardList < 복사하여 크롬에 붙여넣기해서 게시판을 켜줍니다.  
-> A1 게시판이라는 제목 밑에 게시글 등록 버튼을 눌러 게시글을 등록해줍니다.  
-> 게시글 등록 후 게시글의 수정/삭제, 검색분류를 선택하고 검색이 가능합니다.  
