# AudioNoiseRemoval
- 사용 언어: MATLAB
- MATLAB 기반으로 만든, Audio Noise Removal application 입니다.
	- 이 프로그램은 음성파일에서 일정한 진동수를 가진 오디오를 지워줍니다.
	 - 프로그램에서 사용된 음성 파일들은 source_files/ 폴더에 있습니다.
	- 모든 음성에 대한 결과값은 results/ 폴더에 있습니다.
- 개발기간: 10일
- 마지막 수정일: 2022년 11월
  
## 사용방법
- **MATLAB이 컴퓨터내에 설치되어 있어야 합니다.**
- MATLAB 프로그램을 실행 후, 폴더 위치를 code/ 로 설정해줍니다.
- 그 후, 실행 버튼을 누르면 됩니다.

---
## 프로그램에서 주목해서 봐야할 점
- Fourier transform을 이용한, 진동수(frequency) 시각화
- 특정 고주파를 음성파일에서 제거 (Band-stop filter)
