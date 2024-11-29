# ☕️ CoCafe
![](https://velog.velcdn.com/images/soycong/post/6aac0ceb-0dad-405a-bfd9-8ea5b8fd22bd/image.png)

> 함정수사를 하기 위해 코난이 만든 카페의 모바일 주문 앱입니다.
> #### 해당 앱을 통해 더 편리하고 빠르게 주문을 할 수 있습니다.

<br>

## 👥 팀 구성

| 이름      | 역할       | GitHub                           |
| -------- | -------- | --------------------------------- |
| 김하민   | 구조체 구성 | [@dev-hamin-kim](https://github.com/dev-hamin-kim) |
| 김동글   | 메뉴 주문 화면 | [@nemo-semo](https://github.com/nemo-semo) |
| 백서희   | 메뉴 상단 카테고리 바 | [@soycong](https://github.com/soycong) |
| 이명지   | 주문 내역 테이블뷰 | [@zzangmmz](https://github.com/zzangmmz) |
| 최성준   | 주문 총합 / 결제하기 버튼 | [@Choi-jun08](https://github.com/Choi-jun08) |

<br>

## ⏰ 개발 기간
> 2024.11.25-2024.11.28

<br>

## 🛠️ 기술 스택

### 🍎 개발 환경
```  swift
Xcode Version: 16.1
Language: Swift 5
Minimum Deplyments: iOS 16
Frameworks: UIKit
```

### 📐 아키텍처 및 관리 도구

| **항목**              | **설명**                      |
|----------------------|-------------------------------|
| **아키텍처**           | MVC (Model-View-Controller)   |
| **데이터 전달**        | Delegate Pattern              |
| **소스 관리**          | GitHub                        |
| **커뮤니케이션 도구**  | Slack, Zep                    |

<br>

## ⚙️ 구현 기능
- 🧾 메뉴선택 기능
  - 카테고리 선택
  - 메뉴 선택
- 🛒 장바구니 기능
  - 메뉴 수량 추가 및 삭제
  - 총 주문 갯수, 비용
  - 전체 취소 및 결제 기능

<br>

## 🎨 와이어프레임
![](https://velog.velcdn.com/images/soycong/post/f141ffe5-a320-4fec-a964-40bbc3e4803e/image.png)

<br>

## 📱 시연
![Simulator Screen Recording - iPhone 16 - 2024-11-29 at 13 12 10](https://github.com/user-attachments/assets/1742445d-e541-4550-b8dc-a66d8273d1bb)

[실제 시연 영상](https://youtube.com/shorts/t5Kwp7IA9ps?si=d_npExXX8PWYIU-g)

<br>

## 🗣️ Commit Convention

| **태그** | **설명**                                                                                      |
|---------------|-----------------------------------------------------------------------------------------------|
| `add`         | 새로운 파일 및 폴더 추가                                                                      |
| `feat`        | 화면, 컴포넌트, 기능 추가 및 수정 (주요 변경사항) / 이미지 추가                                |
| `fix`         | 버그 수정                                                                                     |
| `update`      | 간단한 변경 사항                                                                              |
| `refactor`    | 코드 정리 및 단순화 / 스타일 수정 / 파일·폴더 이름이나 위치 변경 / 주석·콘솔 관리 / Fontello 변경 |
| `delete`      | 폴더 및 파일 삭제                                                                             |
| `docs`        | 문서 추가, 수정, 삭제 (예: README.md)                                                         |
| `test`        | 테스트 코드 작성, 수정, 삭제                                                                  |
| `chore`       | 패키지·라이브러리 추가, 버전 변경, 삭제                                                       
