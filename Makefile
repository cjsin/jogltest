SHELL=/bin/bash
TAG=opengltest:latest
SRCDIR=src
CONTAINER_SRCS= Dockerfile $(wildcard *.sh)
CP=$(SRCDIR):lib/gluegen-rt.jar:lib/gluegen-rt-natives-linux-amd64.jar:lib/jogl-all.jar:lib/jogl-all-natives-linux-amd64.jar
JAVA_SRCS=$(shell find "$(SRCDIR)" -name "*.java")
JAVA=java $(OPENS)
OPENS=--add-opens java.desktop/sun.awt=ALL-UNNAMED
HELLO=$(JAVA) -cp $(CP) hello.Hello
FRAME=$(JAVA) -cp $(CP) hello.TestFrame
DOCKER=podman

clean:
	rm -f $(shell find "$(SRCDIR)" -name "*.class")
	rm -f .container.stamp

container: .container.stamp
.container.stamp: $(CONTAINER_SRCS)
	$(DOCKER) build -t $(TAG) -f Dockerfile .
	touch $@

compile: $(JAVA_SRCS)
	javac -cp $(CP) $(JAVA_SRCS)

jarlist:
	jar tvf lib/gluegen-rt.jar
	jar tvf lib/gluegen-rt-natives-linux-amd64.jar
	jar tvf lib/jogl-all.jar
	jar tvf lib/jogl-all-natives-linux-amd64.jar

debughello: compile
	LD_DEBUG=all LIBGL_DEBUG=verbose $(HELLO)

hello: compile
	java --version
	$(HELLO)

debugframe: compile
	LD_DEBUG=all LIBGL_DEBUG=verbose $(FRAME)

frame: compile
	java --version
	$(FRAME)
