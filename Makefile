#======================================================================
# GARIDOMAKARONADA OT MAKEFILE
#======================================================================

FILE = Garidomakaronada_OT
LUALATEX = lualatex
FLAGS = -interaction=nonstopmode

.PHONY: all read print hand clean

all: read print hand

#----------------------------------------------------------------------
#   READ MODE (Color)
#----------------------------------------------------------------------
read:
	@echo "╔═══════════════════════════════════════════════════════════════╗"
	@echo "║  Building READ mode (Color)                                   ║"
	@echo "╚═══════════════════════════════════════════════════════════════╝"
	$(LUALATEX) $(FLAGS) --jobname=$(FILE)_Read $(FILE).tex
	$(LUALATEX) $(FLAGS) --jobname=$(FILE)_Read $(FILE).tex
	@echo "Cleaning up auxiliary files..."
	@rm -f $(FILE)_Read.aux $(FILE)_Read.log $(FILE)_Read.out $(FILE)_Read.toc 2>/dev/null || true
	@echo "✓ Output: $(FILE)_Read.pdf"
	@echo ""

#----------------------------------------------------------------------
#   PRINT MODE (B&W)
#----------------------------------------------------------------------
print:
	@echo "╔═══════════════════════════════════════════════════════════════╗"
	@echo "║  Building PRINT mode (B&W)                                    ║"
	@echo "╚═══════════════════════════════════════════════════════════════╝"
	$(LUALATEX) $(FLAGS) --jobname=$(FILE)_Print "\def\printmodeflag{}\input{$(FILE).tex}"
	$(LUALATEX) $(FLAGS) --jobname=$(FILE)_Print "\def\printmodeflag{}\input{$(FILE).tex}"
	@echo "Cleaning up auxiliary files..."
	@rm -f $(FILE)_Print.aux $(FILE)_Print.log $(FILE)_Print.out $(FILE)_Print.toc 2>/dev/null || true
	@echo "✓ Output: $(FILE)_Print.pdf"
	@echo ""

#----------------------------------------------------------------------
#   HANDWRITING MODE
#----------------------------------------------------------------------
hand:
	@echo "╔═══════════════════════════════════════════════════════════════╗"
	@echo "║  Building HANDWRITING mode                                    ║"
	@echo "╚═══════════════════════════════════════════════════════════════╝"
	$(LUALATEX) $(FLAGS) --jobname=$(FILE)_Hand "\def\handmodeflag{}\input{$(FILE).tex}"
	$(LUALATEX) $(FLAGS) --jobname=$(FILE)_Hand "\def\handmodeflag{}\input{$(FILE).tex}"
	@echo "Cleaning up auxiliary files..."
	@rm -f $(FILE)_Hand.aux $(FILE)_Hand.log $(FILE)_Hand.out $(FILE)_Hand.toc 2>/dev/null || true
	@echo "✓ Output: $(FILE)_Hand.pdf"
	@echo ""

clean:
	@echo "Cleaning up all build artifacts..."
	rm -f *.aux *.log *.out *.toc *.synctex.gz 2>/dev/null || true
	rm -f $(FILE)_Read.pdf $(FILE)_Print.pdf $(FILE)_Hand.pdf
	@echo "✓ Clean complete"
