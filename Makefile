update:
	rm -rf Brewfile;
	brew bundle dump;
	flutter pub global list > pub-global-list.txt;
	cargo install --list > crates.txt;
	
