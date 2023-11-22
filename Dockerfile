FROM alpine AS builder
RUN apk add go
COPY . /proxy
WORKDIR /proxy
RUN go install
FROM alpine
COPY --from=builder /root/go/bin/mjpeg-proxy /mjpeg-proxy
COPY sources.json /sources.json
CMD /mjpeg-proxy -sources /sources.json
