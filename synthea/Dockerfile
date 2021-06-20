FROM java:8 as synthea

RUN git clone https://github.com/synthetichealth/synthea.git && \
    mkdir /synthea/output

WORKDIR /synthea
RUN ./gradlew build

COPY ./modules/ ./src/main/resources/modules/
RUN ./run_synthea -p 2

FROM golang:1.10 as uploader

RUN git clone https://github.com/synthetichealth/uploader.git $GOPATH/src/uploader

# Set the Current Working Directory inside the container
WORKDIR $GOPATH/src/uploader

RUN go build -o /out/uploader .

CMD ./out/uploader -help

FROM golang:1.10 as runtime

COPY --from=uploader /out/uploader /app/uploader
COPY --from=synthea /synthea/output /app/output/

WORKDIR /app

CMD ./uploader -fhir http://db:8080 -path ./output/fhir/

# TODO: currently getting the following error:
#Uploading bundles from ./output/fhir/ to http://0.0.0.0:8080/ .panic: runtime error: invalid memory address or nil pointer dereference
#synthea_1     | [signal SIGSEGV: segmentation violation code=0x1 addr=0x48 pc=0x63ccca]
#synthea_1     |
#synthea_1     | goroutine 1 [running]:
#synthea_1     | main.updateBundleForTx(0xc42009e780)
#synthea_1     |         /go/src/uploader/main.go:100 +0xca
#synthea_1     | main.main()
#synthea_1     |         /go/src/uploader/main.go:60 +0x5e6
