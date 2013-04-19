PDF:=$(wildcard *.pdf)
PDF:=$(patsubst livret.pdf,,$(PDF))
PDF:=$(patsubst xxx.pdf,,$(PDF))
TROMBI:=./trombi

TABMIAGE:=$(wildcard Extra/Info_*MIAGE_*.txt)
TABMIAGE:=$(TABMIAGE:Extra/Info_%.txt=Tableau_Info_%.tex)

TAB:=$(wildcard Extra/Info_*.txt)
TAB:=$(TAB:Extra/Info_%.txt=Tableau_Info_%.tex)
TABPDF:=$(TAB:.tex=.pdf)

PREAMB:=$(wildcard Preambule_Info_*.tex)

DETAIL:=$(wildcard Detail_*.tex)
DETAIL:=$(DETAIL:.tex=.pdf)

TABLEAUX:=$(wildcard Preambule_Info_*.tex)

#Sources des masters
SRCMasterCCI:= Tableau_Info_MasterCCI_S3S4.tex Tableau_Info_MasterCCI_S3S4.pdf Preambule_Info_MasterCCI.pdf Detail_Info_m2_CCI.pdf
SRCMasterMoCaHP:=  Tableau_Info_MasterMoCaHP_S1S2.tex  Tableau_Info_MasterMoCaHP_S3S4.tex Tableau_Info_MasterMoCaHP_S1S2.pdf Tableau_Info_MasterMoCaHP_S3S4.pdf Preambule_Info_MasterMoCaHP.pdf Preambule_Info_MasterMoCaHP_S1S2.pdf Preambule_Info_MasterMoCaHP_S3S4.pdf Detail_Info_m_MoCaHP.pdf
SRCMasterVIP:=Tableau_Info_MasterVIP_S3S4.tex Tableau_Info_MasterVIP_S3S4.pdf Preambule_Info_MasterVIP_S3S4.pdf Preambule_Info_MasterVIP.pdf Detail_Info_m2_VIP.pdf
SRCMasterINIS:=Tableau_Info_MasterINIS_S3S4.tex Tableau_Info_MasterINIS_S3S4.pdf Preambule_Info_MasterINIS_S3S4.pdf Preambule_Info_MasterINIS.pdf Detail_Info_m2_INIS.pdf
SRCMasterMIAGE:= Tableau_Info_MasterMIAGE_S1S2.tex Tableau_Info_MasterMIAGE_SIMSA_S3S4.tex Tableau_Info_MasterMIAGE_SIR_S3S4.tex Tableau_Info_MasterMIAGE_S1S2.pdf Tableau_Info_MasterMIAGE_SIMSA_S3S4.pdf Tableau_Info_MasterMIAGE_SIR_S3S4.pdf Preambule_Info_MasterMIAGE.pdf Preambule_Info_MasterMIAGE_S1S2.pdf Preambule_Info_MasterMIAGE_SIMSA.pdf Preambule_Info_MasterMIAGE_SIMSA_S3S4.pdf Preambule_Info_MasterMIAGE_SIR.pdf Preambule_Info_MasterMIAGE_SIR_S3S4.pdf Detail_Info_m1_MIAGE.pdf

#Sources des licences
SRCLicence1et2:= Tableau_Info_LicenceMATHINFO_S1.tex Tableau_Info_LicenceINFO_S2.tex Tableau_Info_LicenceINFO_S3S4.tex Tableau_Info_LicenceMATHINFO_S1.pdf Tableau_Info_LicenceINFO_S2.pdf Tableau_Info_LicenceINFO_S3S4.pdf Preambule_Info_LicenceINFO_S2.pdf Preambule_Info_LicenceINFO_S3S4.pdf Preambule_Info_Licence.pdf Detail_Info_Licence1et2.pdf
SRCLicence3INFO:= Tableau_Info_LicenceINFO_S5S6.tex Tableau_Info_LicenceINFO_S5S6.pdf Preambule_Info_LicenceINFO_S5S6.pdf Detail_Info_Licence3_INFO.pdf
SRCLicence3MIAGE:= Tableau_Info_LicenceMIAGE_S5S6.tex Tableau_Info_LicenceMIAGE_S5S6.pdf Preambule_Info_LicenceMIAGE_S5S6.pdf  Detail_Info_Licence3_MIAGE.pdf

#Sources finales
SRCLicence:=   $(SRCLicence1et2)  $(SRCLicence3INFO) $(SRCLicence3MIAGE)
SRCMasterINFO:=Tableau_Info_MasterINFO_S1S2.tex Tableau_Info_MasterINFO_S1S2.pdf $(SRCMasterCCI) $(SRCMasterINIS) $(SRCMasterVIP) $(SRCMasterMoCaHP) Preambule_Info_MasterINFO.pdf Detail_Info_m1.pdf

all : livret.pdf $(TABLEAUX)
	echo LIVRET REGÉNÉRÉ

Tableau_Info_%.tex : Extra/Info_%.txt
	./generer_tableau_modules $^ > $@

Preambule_%.pdf : Preambule_%.tex
	pdflatex -interaction=nonstopmode $^

%.pdf : %.tex
	./compillatex $^
	mv xxx.pdf $@

livret.pdf : $(SRCLicence) $(SRCMasterINFO) $(SRCMasterMIAGE) 
	$(TROMBI)
	pdflatex -interaction=nonstopmode livret.tex

trombino : 
	$(TROMBI)

#preambule : $(PREAMB)
#	@for i in $(PREAMB); do \
#	pdflatex -interaction=nonstopmode $$i; \
#	done

#tableau : $(TAB) $(TABPDF)
#	echo Tableaux créés

#detail : $(DETAIL)
#	@echo Détails créés

livretMasterCCI.pdf :   $(SRCMasterCCI) livretMasterCCI.tex
	$(TROMBI)
	pdflatex livretMasterCCI.tex
	@sleep 1
	@touch $(SRCMasterCCI) livretMasterCCI.tex

livretMasterMoCaHP.pdf : $(SRCMasterMoCaHP) livretMasterMoCaHP.tex
	$(TROMBI)
	pdflatex livretMasterMoCaHP.tex

livretMasterVIP.pdf : $(SRCMasterVIP) livretMasterVIP.tex
	 $(TROMBI)
	pdflatex livretMasterVIP.tex

livretMasterINIS.pdf : $(SRCMasterINIS) livretMasterINIS.tex
	$(TROMBI)
	pdflatex livretMasterINIS.tex

livretLicence1et2.pdf : $(SRCLicence1et2) livretLicence1et2.tex
	$(TROMBI)
	pdflatex livretLicence1et2.tex

livretLicence.pdf : $(SRCLicence) livretLicence.tex
	$(TROMBI)
	pdflatex livretLicence.tex

livretMasterINFO.pdf : $(SRCMasterINFO) livretMasterINFO.tex
	$(TROMBI)
	pdflatex livretMasterINFO.tex


#	cat DEBUT.tex $^ FIN.tex > xxx.tex
#	pdflatex xxx.tex && mv xxx.pdf $@