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
		
		<!-- onr recup l'id de la promo avant insertion, si elle n'existe pas  -->
		
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
		
		<!-- maintenant on ajoute tous les modules -->
		<xsl:apply-templates select="//module"/>
		
	</xsl:template>
	
	<!-- pour les modules -->
	<xsl:template match="module">
		
		<!-- On vérifie si le module existe deja ou non sur la base de données -->
		<xsl:text>SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='</xsl:text>
		<xsl:value-of select="./titre"/>
		<xsl:text>' AND _ECTS_='</xsl:text>
		<xsl:value-of select="@ects"/>
		<xsl:text>' AND _CODE_MAT_='</xsl:text>
		<xsl:value-of select="@matiere"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<!-- ajout des informations complémentaire du module -->
		<xsl:text>INSERT IGNORE INTO livret_module (_ID_MOD_ , _CODE_MAT_, _LIBELLE_MOD_, _SEMESTRE_, _NBH_C_, _NBH_TD_, _NBH_TP_, _NBH_CTD_, _ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_, _METHODE_EVAL_, _MOD_CC_1_, _MOD_CC_2_,  _CALCUL_NF_1_, _CALCUL_NF_2_, _PREREQUIS_, _LIEN_RESSOURCE_, _BIBLIOGRAPHIE_, _NOTE_ELIM_, _OBLIGATOIRE_) VALUES (@id_mod, '</xsl:text>
		<xsl:value-of select="@matiere"/>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="./titre"/>
		<xsl:text>', '</xsl:text>
		<xsl:value-of select="@semestre"/>
		<xsl:text>', '</xsl:text>
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
		<!-- les langues sont separe par des "_" -->
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
		<xsl:value-of select="./textePrerequis"/>
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
		
		<!-- on recup l'id du mod au cas ou il n'existait pas avant -->
		<xsl:text>SET @id_mod := (SELECT DISTINCT _ID_MOD_ FROM livret_module WHERE _LIBELLE_MOD_='</xsl:text>
		<xsl:value-of select="./titre"/>
		<xsl:text>' AND _ECTS_='</xsl:text>
		<xsl:value-of select="@ects"/>
		<xsl:text>' AND _CODE_MAT_='</xsl:text>
		<xsl:value-of select="@matiere"/>
		<xsl:text>');&#xA;</xsl:text>
		
		<!-- ajout de relation entre la matiere et la promotion -->
		<xsl:text>INSERT IGNORE INTO livret_programme (_ID_PROMO_, _ID_MOD_) VALUES (@id_promo, @id_mod);&#xA;</xsl:text>
		
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
			<xsl:text>INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens1, 1);&#xA;</xsl:text>
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
			<xsl:text>INSERT IGNORE INTO livret_responsable_module (_ID_MOD_, _ID_ENS_, _QUALITE_) VALUES (@id_mod, @id_ens2, 2);&#xA;</xsl:text>
		</xsl:if>
		
		<!-- Ajout du code Apogee s'il existe -->
		<xsl:if test="./codeApogee1">
			<xsl:text>INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('</xsl:text>
			<xsl:value-of select="./codeApogee1"/>
			<xsl:text>', @id_mod);&#xA;</xsl:text>
		</xsl:if>
		
		<!-- Ajout du second code apogee s'il existe -->
		<xsl:if test="./codeApogee2">
			<xsl:text>INSERT IGNORE INTO livret_ue (_APOGEE_,_ID_MOD_) VALUES ('</xsl:text>
			<xsl:value-of select="./codeApogee2"/>
			<xsl:text>', @id_mod);&#xA;</xsl:text>
		</xsl:if>
		
	</xsl:template>
	
	
</xsl:stylesheet>