FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -yq git
RUN git clone https://github.com/fetchai/ledger.git
RUN apt-get install -yq libssl-dev cmake python3-dev clang libprotobuf-dev protobuf-compiler sudo
RUN cd ledger && ./scripts/quickstart.sh
RUN cd ledger/build/apps/constellation && rm -f *.db
RUN cd ledger/build/apps/constellation && git checkout release/v0.7.x
RUN cd ledger/build/apps/constellation && ls
RUN cd ledger && ./scripts/quickstart.sh
COPY start.sh start.sh
CMD sh ./start.sh
