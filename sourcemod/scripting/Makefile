CC := ./spcomp
FILE := ""
BUILD_DIR := ../plugins

SFTP_ADDR=""
SFTP_PORT=""
SFTP_USER=""
SFTP_FLDR=""

$(BUILD_DIR)/$(SMX): $(FILE).sp
	$(CC) $^

install:
	mv $(FILE).smx $(BUILD_DIR)

scp:
	scp -P $(SFTP_PORT) $(FILE).smx $(SFTP_USER)@$(SFTP_ADDR):$(SFTP_FLDR)
