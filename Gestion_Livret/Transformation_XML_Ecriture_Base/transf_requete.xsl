<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- configuration des parametre : composition, filiere et promotion -->
	<xsl:param name="compo"/>
		<xsl:output method="text"/>
	<xsl:param name="filiere"/>
		<xsl:output method="text"/>
	<xsl:param name="promo"/>
		<xsl:output method="text"/>
	
			
	<xsl:template match="/">
		
		<!-- on recupere l'id de la composition avant l'insertion-->
		<xsl:text>SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = '</xsl:text>
		<xsl:value-of select="$compo"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<!-- on insert d'abord dans la table de composante si la composante n'existe pas -->
		<xsl:text>INSERT IGNORE INTO livret_compo (_ID_COMPO_, _LIBELLE_COMPO_) VALUES (@id_compo, '</xsl:text>
		<xsl:value-of select="$compo"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<!-- recup de valeur des variables de composition, filiere et promotion qui seront utilisé tout au long -->
		<xsl:text>SET @id_compo := (SELECT _ID_COMPO_ FROM livret_compo WHERE _LIBELLE_COMPO_ = '</xsl:text>
		<xsl:value-of select="$compo"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<!-- on recupere l'id de la filiere avant l'insertion -->
		<xsl:text>SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = '</xsl:text>
		<xsl:value-of select="$filiere"/>
		<xsl:text>' AND _ID_COMPO_ = @id_compo);&#xA;</xsl:text>
		
		<!-- on insert dans la table filiere si la filiere n'existe pas deja -->
		<xsl:text>INSERT IGNORE INTO livret_filiere (_ID_FILIERE_ , _LIBELLE_FILIERE_ , _ID_COMPO_) VALUES (@id_filiere, '</xsl:text>
		<xsl:value-of select="$filiere"/>
		<xsl:text>', @id_compo);&#xA;</xsl:text>
		
		<xsl:text>SET @id_filiere := (SELECT _ID_FILIERE_ FROM livret_filiere WHERE _LIBELLE_FILIERE_ = '</xsl:text>
		<xsl:value-of select="$filiere"/>
		<xsl:text>' AND _ID_COMPO_ = @id_compo);&#xA;</xsl:text>
		
		<xsl:text>SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = '</xsl:text>
		<xsl:value-of select="$promo"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<!-- On insert la Promotion si elle n'existe pas deja -->
		<xsl:text>INSERT IGNORE INTO livret_promotion (_ID_PROMO_, _LIBELLE_PROMO_) VALUES (@id_promo, '</xsl:text>
		<xsl:value-of select="$promo"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<xsl:text>SET @id_promo := (SELECT DISTINCT _ID_PROMO_ FROM livret_promotion WHERE _LIBELLE_PROMO_ = '</xsl:text>
		<xsl:value-of select="$promo"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<!-- on insert dans la table de parcours meme procédure -->
		<xsl:text>INSERT IGNORE INTO livret_parcours (_ID_FILIERE_, _ID_PROMO_) VALUES (@id_filiere , @id_promo);&#xA;</xsl:text>
		
		<xsl:apply-templates select="//module"/>
		
	</xsl:template>
	
	<!-- pour les modules -->
	<xsl:template match="module">
		
		<!-- on recupere l'id de la matiere avant l'insertion pour eviter les doublons-->
		<xsl:text>SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_ = '</xsl:text>
		<xsl:value-of select="./titre"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<!-- insertion table matiere -->
		<xsl:text>INSERT IGNORE INTO livret_matiere (_ID_MAT_, _ID_PROMO_, _LIBELLE_MAT_, _CODE_APOG_MAT_, _ID_UE_) VALUES (@id_matiere, @id_promo, '</xsl:text>
		<xsl:value-of select="./titre"/>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="@codeApogee"/>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="@codeue"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<!-- on recupere l'id de la matiere -->
		<xsl:text>SET @id_matiere := (SELECT _ID_MAT_ FROM livret_matiere WHERE _ID_PROMO_ = @id_promo AND _LIBELLE_MAT_='</xsl:text>
		<xsl:value-of select="./titre"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<!-- ajout de relation entre semestre et la matiere -->
		<xsl:text>INSERT IGNORE INTO livret_semestre (_ID_PROMO_, _ID_MAT_, _SEMESTRE_) VALUES (@id_promo, @id_matiere, '</xsl:text>
		<xsl:value-of select="@semestre"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<!-- ajout des informations complémentaire du module -->
		<xsl:text>INSERT IGNORE INTO livret_module (_ID_MAT_ , _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_matiere, '</xsl:text>
		<xsl:choose> 
			<xsl:when test="@cours = ''"> 
				<xsl:text>0</xsl:text>
			</xsl:when>
			<xsl:otherwise> <xsl:value-of select="@cours"/> </xsl:otherwise>
		</xsl:choose>
		<xsl:text>', '</xsl:text>
		<xsl:choose>
			<xsl:when test="@td = ''">
				<xsl:text>0</xsl:text>
			</xsl:when>
			<xsl:otherwise> <xsl:value-of select="@td"/> </xsl:otherwise>
		</xsl:choose>
		<xsl:text>', '</xsl:text>
		<xsl:choose> 
			<xsl:when test="@tp = ''"> 
				<xsl:text>0</xsl:text>
			</xsl:when>
			<xsl:otherwise> <xsl:value-of select="@tp"/> </xsl:otherwise>
		</xsl:choose>
		<xsl:text>', '</xsl:text>
		<xsl:choose> 
			<xsl:when test="@ctd = ''"> 
				<xsl:text>0</xsl:text>
			</xsl:when>
			<xsl:otherwise> <xsl:value-of select="@ctd"/> </xsl:otherwise>
		</xsl:choose>
		<xsl:text>', '</xsl:text>
		<xsl:choose> 
			<xsl:when test="@ects = ''"> 
				<xsl:text>0</xsl:text>
			</xsl:when>
			<xsl:otherwise> <xsl:value-of select="@ects"/> </xsl:otherwise>
		</xsl:choose>
		<xsl:text>', '</xsl:text>
		<xsl:choose> 
			<xsl:when test="@coeff = ''"> 
				<xsl:text>0</xsl:text>
			</xsl:when>
			<xsl:otherwise> <xsl:value-of select="@coeff"/> </xsl:otherwise>
		</xsl:choose>
		<xsl:text>', '</xsl:text>
		<!-- les langues sont separe par des '_' -->
		<xsl:for-each select="langues/langue">
			<xsl:value-of select="."/><xsl:text>_</xsl:text>
		</xsl:for-each>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="./objectifs"/>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="./descriptionLongue"/>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="./methodeEval"/>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="./modalitesCCSemestreUn"/>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="./modalitesCCSemestreDeux"/>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="./CalculNFSessionUne"/>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="./CalculNFSessionDeux"/>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="./ressources"/>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="./biblio"/>
		<xsl:text>', '</xsl:text>
		<xsl:choose> 
			<xsl:when test="./noteEliminatoire = ''"> 
				<xsl:text>0</xsl:text>
			</xsl:when>
			<xsl:otherwise> <xsl:value-of select="./noteEliminatoire"/> </xsl:otherwise>
		</xsl:choose>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="./descriptionCourte"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<!-- ajout des prérequis -->
		<xsl:for-each select="./lesPrerequis/prerequis">
			<xsl:choose>
				<xsl:when test="not(.)">
				</xsl:when>
				<xsl:otherwise>
					<xsl:text> INSERT IGNORE INTO livret_pre_requis (_ID_MOD_FILS_, _ID_MOD_PERE_ ,_DESCRIPTION_) VALUES (@id_matiere, </xsl:text>
					<xsl:value-of select="."/>
					<xsl:text>, '</xsl:text>
					<xsl:value-of select="../textPrerequis"/>
					<xsl:text>');&#xA;</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		
		<!-- ajout d'enseignant principal et son e-mail -->
		<xsl:if test="./nomPremierResp">
			<!-- Extraction des informations du Premier Responsable -->
			<xsl:variable name="lastName" select="substring-before(./nomPremierResp, ' ')" />
			<xsl:variable name="firstName" select="substring-after(./nomPremierResp, ' ')" />
			<!--recup avnat 'insertion au cas ou il existe deja pour l'ignorer -->
			<xsl:text>SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '</xsl:text>
			<xsl:value-of select="$lastName"/>
			<xsl:text>' AND _PRENOM_ENS_='</xsl:text>
			<xsl:value-of select="$firstName"/>
			<xsl:text>' AND _EMAIL_ENS_='</xsl:text>
			<xsl:value-of select="./emailSecondResp"/>
			<xsl:text>');&#xA;</xsl:text>
			
			<xsl:text>INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens1, '</xsl:text>
			<xsl:value-of select="$lastName"/>
			<xsl:text>', '</xsl:text>
			<xsl:value-of select="$firstName"/>
			<xsl:text>', '</xsl:text>
			<xsl:value-of select="./emailPremierResp"/>
			<xsl:text>');&#xA;</xsl:text>
			
			<!-- mise a jour de l'id du premier ens au cas il n'existait pas avant -->
			<xsl:text>SET @id_ens1 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_='</xsl:text>
			<xsl:value-of select="$lastName"/>
			<xsl:text>' AND _PRENOM_ENS_='</xsl:text>
			<xsl:value-of select="$firstName"/>
			<xsl:text>' AND _EMAIL_ENS_='</xsl:text>
			<xsl:value-of select="./emailSecondResp"/>
			<xsl:text>');&#xA;</xsl:text>
			
			<!-- ajout comme responsable -->
			<xsl:text>INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_matiere, @id_ens1);&#xA;</xsl:text>
		</xsl:if>
		
		
		<!-- Ajout de responsable secondaire et son e-mail Meme principe que le Premier -->
		<xsl:if test="./nomSecondResp">
			<!-- Extraction du nom et prenom du second enseignant -->
			<xsl:variable name="lastName" select="substring-before(./nomSecondResp, ' ')" />
			<xsl:variable name="firstName" select="substring-after(./nomSecondResp, ' ')" />

			<xsl:text>SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '</xsl:text>
			<xsl:value-of select="$lastName"/>
			<xsl:text>' AND _PRENOM_ENS_='</xsl:text>
			<xsl:value-of select="$firstName"/>
			<xsl:text>' AND _EMAIL_ENS_='</xsl:text>
			<xsl:value-of select="./emailSecondResp"/>
			<xsl:text>');&#xA;</xsl:text>
			
			<xsl:text>INSERT IGNORE INTO livret_enseignant (_ID_ENS_, _NOM_ENS_, _PRENOM_ENS_, _EMAIL_ENS_) VALUES (@id_ens2,'</xsl:text>
			<xsl:value-of select="$lastName"/>
			<xsl:text>', '</xsl:text>
			<xsl:value-of select="$firstName"/>
			<xsl:text>', '</xsl:text>
			<xsl:value-of select="./emailSecondResp"/>
			<xsl:text>');&#xA;</xsl:text>
			
			<xsl:text>SET @id_ens2 := (SELECT DISTINCT _ID_ENS_ FROM livret_enseignant WHERE _NOM_ENS_ = '</xsl:text>
			<xsl:value-of select="$lastName"/>
			<xsl:text>' AND _PRENOM_ENS_='</xsl:text>
			<xsl:value-of select="$firstName"/>
			<xsl:text>' AND _EMAIL_ENS_='</xsl:text>
			<xsl:value-of select="./emailSecondResp"/>
			<xsl:text>');&#xA;</xsl:text>
			
			<!-- ajout comme responsable -->
			<xsl:text>INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_) VALUES (@id_matiere, @id_ens2);&#xA;</xsl:text>
		</xsl:if>		
		
	</xsl:template>
	
	
</xsl:stylesheet>