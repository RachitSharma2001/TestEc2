FROM amazonlinux:2 as builder
RUN amazon-linux-extras install aws-nitro-enclaves-cli && \
    yum install aws-nitro-enclaves-cli-devel jq -y

RUN yum install golang -y
COPY . .
RUN go build -o server example.go
CMD /server