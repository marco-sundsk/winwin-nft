RFLAGS="-C link-arg=-s"

build: winwinnft


test: build
ifdef TC
	RUSTFLAGS=$(RFLAGS) cargo test $(TC) -p winwinnft --lib -- --nocapture
else
	RUSTFLAGS=$(RFLAGS) cargo test -p winwinnft --lib -- --nocapture
endif

winwinnft: contracts/winwinnft
	rustup target add wasm32-unknown-unknown
	RUSTFLAGS=$(RFLAGS) cargo build -p winwinnft --target wasm32-unknown-unknown --release
	mkdir -p res
	cp target/wasm32-unknown-unknown/release/winwinnft.wasm ./res/winwinnft.wasm


clean:
	cargo clean
	rm -rf res/

