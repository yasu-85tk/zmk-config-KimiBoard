CONFIG_DIR = config

SRCS = $(shell find $(CONFIG_DIR) -type f)

TARGET = ../zmk/app/build/zephyr/zmk.uf2

.PHONY: build clean

build: $(TARGET)

$(TARGET): $(SRCS)
	docker exec -w /workspaces/zmk/app -it $(container_name) west build -b seeeduino_xiao_ble -- -DSHIELD=kimi -DZMK_CONFIG="/workspaces/zmk-config/config" -DZMK_EXTRA_MODULES="/workspaces/zmk-modules/zmk-pmw3610-driver"
clean:
	docker exec -it $(container_name) rm -rf /workspaces/zmk/app/build
