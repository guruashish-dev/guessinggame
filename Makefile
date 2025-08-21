README.md: guessinggame.sh
	@echo "# Bash Guessing Game" > README.md
	@echo "" >> README.md
	@echo "**Date generated:** $$(date)" >> README.md
	@echo "" >> README.md
	@echo "**Lines in guessinggame.sh:** $$(wc -l < guessinggame.sh)" >> README.md
	@echo "" >> README.md
	@echo "This project is a Bash-based guessing game. Run with: bash guessinggame.sh" >> README.md
