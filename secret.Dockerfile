FROM alpine:latest

RUN echo "Layer 1 Updated" > layer1.txt
RUN echo "Layer 2" > layer2.txt

RUN --mount=type=secret,id=env_sec ls $(cat /run/secrets/MYSECRET)