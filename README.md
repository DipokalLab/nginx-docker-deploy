# nginx-docker-deploy
> 모든 길은 nginx-docker-deploy로 통한다.

제 메인 맥미니 서버에서 동작하는 배포 스크립트 입니다. 새롭게 docker 컨테이너가 추가됨과 동시에 80, 443 포트로 배포되고 acme-companion컨테이너에서 ssl 인증서를 발급합니다. 