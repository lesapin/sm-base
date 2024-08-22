CC := ./spcomp
FILE := 
OUT := $(FILE).smx
BUILD_DIR := ../plugins
INSTALL_DIR := ./

SFTP_ADDR=
SFTP_PORT=
SFTP_USER=
SFTP_FLDR=

$(BUILD_DIR)/$(OUT): $(FILE).sp
	$(CC) $^
	mv $(OUT) $(BUILD_DIR)

install:
	cp $(BUILD_DIR)/$(OUT) $(INSTALL_DIR)/$(OUT)

scp:
	scp -P $(SFTP_PORT) $(BUILD_DIR)/$(OUT) $(SFTP_USER)@$(SFTP_ADDR):$(SFTP_FLDR)
