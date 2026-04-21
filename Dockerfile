FROM alpine:latest

RUN echo "Layer 1 Updated" > layer1.txt
RUN echo "Layer 2" > layer2.txt

ENV MY_SECRET_TOKEN=SuperSecret123