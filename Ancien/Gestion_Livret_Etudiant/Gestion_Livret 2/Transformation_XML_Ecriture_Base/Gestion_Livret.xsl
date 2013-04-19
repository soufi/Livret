<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="composition"/>
	<xsl:output method="text"/>

<xsl:param name="filiere"/>
	<xsl:output method="text"/>

<xsl:param name="promo"/>
	<xsl:output method="text"/>

<xsl:template match="/">  
 <xsl:apply-templates select="//module"/>
</xsl:template>


<xsl:template match="module">



<xsl:text>insert into livret_matiere (_ID_PROMO_ , _NOM_MAT_ , _ABBR_MAT_ , _CODE_APOG_MAT_) values(</xsl:text>
<xsl:text>(select _ID_PROMO_ from livret_promotion where _NOM_PROMO_ = '</xsl:text>
<xsl:value-of select="$promo"/>
<xsl:text>'),'</xsl:text>
<xsl:value-of select="./titre"/>
<xsl:text>','','</xsl:text>
<xsl:value-of select="@codeApogee"/>
<xsl:text>'</xsl:text>
<xsl:text>);&#xA;</xsl:text>

<!--
<xsl:text>insert into livret_module (_ID_MOD_ , _ID_MAT_ , _ID_PROMO_ , _NOM_MOD_ , _CONTENU_MOD_ , _NB_SEM_MOD_ , _NUM_SEM1_MOD_ , _CODE_APOG_MOD_) values ((select MAX(_ID_MAT_) from com_matiere),(select MAX(_ID_MAT_) from com_matiere),'</xsl:text>
<xsl:value-of select="@promo"/>
<xsl:text>','</xsl:text>
<xsl:value-of select="./titre"/>
<xsl:text>','</xsl:text>
<xsl:value-of select="./descriptionCourte"/>
<xsl:text>','0','0','</xsl:text>
<xsl:value-of select="@codeApogee"/>
<xsl:text>'</xsl:text>
<xsl:text>);&#xA;</xsl:text>
-->
<xsl:for-each select="./lesPrerequis/prerequis">
<xsl:text>insert into livret_pre_requis (_ID_MOD_FILS_,_ID_MOD_PERE_) values((select MAX(_ID_MAT_) from livret_matiere),'</xsl:text>
<xsl:value-of select="."/>
<xsl:text>');&#xA;</xsl:text>
</xsl:for-each>

	<xsl:text>insert into livret_module (_ID_MOD_,_ID_MAT_ ,_ID_PROMO_,_NOM_MOD_ , _CODE_APOG_MOD_,_NBH_C_,_NBH_TD_,_NBH_TP_,_NBH_CTD_, _NB_ECTS_, _COEF_, _LANGUE_, _OBJECTIF_, _DESCRIPTION_,</xsl:text>
	<xsl:text>_METHODE_EVAL_,_MOD_CC_1_,_MOD_CC_2_, _CALCUL_NF_1_,_CALCUL_NF_2_,_LIEN_RESSOURCE_,_BIBLIOGRAPHIE_,</xsl:text>
	<xsl:text>_NOTE_ELIM_,_PREREQUIS_,_ID_UE_) values((select MAX(_ID_MAT_) from livret_matiere),(select MAX(_ID_MAT_) from livret_matiere),</xsl:text>
	<xsl:text>(select _ID_PROMO_ from livret_promotion where _NOM_PROMO_ = '</xsl:text>
	<xsl:value-of select="$promo"/>
	<xsl:text>'),'</xsl:text>
	<xsl:value-of select="./titre"/>
	<xsl:text>','</xsl:text>
	<xsl:value-of select="@codeApogee"/>
	<xsl:text>','</xsl:text>
	<xsl:choose>
	<xsl:when test="@cours = ''">
	<xsl:text>0</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	<xsl:value-of select="@coeff"/>
	</xsl:otherwise>
	</xsl:choose> 
	<xsl:text>','</xsl:text>
	<xsl:choose>
	<xsl:when test="@td = ''">
	<xsl:text>0</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	<xsl:value-of select="@td"/>
	</xsl:otherwise>
	</xsl:choose> 
	<xsl:text>','</xsl:text>
	<xsl:choose>
	<xsl:when test="@tp = ''">
	<xsl:text>0</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	<xsl:value-of select="@tp"/>
	</xsl:otherwise>
	</xsl:choose> 
	<xsl:text>','</xsl:text>
	<xsl:choose>
	<xsl:when test="@ctd = ''">
	<xsl:text>0</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	<xsl:value-of select="@ctd"/>
	</xsl:otherwise>
	</xsl:choose> 
	<xsl:text>','</xsl:text>
	<xsl:choose>
	<xsl:when test="@ects = ''">
	<xsl:text>0</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	<xsl:value-of select="@ects"/>
	</xsl:otherwise>
	</xsl:choose> 
	<xsl:text>','</xsl:text>
	<xsl:choose>
	<xsl:when test="@coeff = ''">
	<xsl:text>0</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	<xsl:value-of select="@coeff"/>
	</xsl:otherwise>
	</xsl:choose> 
	<xsl:text>','</xsl:text>
	<xsl:value-of select="//langues"/>
	<xsl:text>','</xsl:text>
	<xsl:value-of select="./objectifs"/>
	<xsl:text>','</xsl:text>
	<xsl:value-of select="./descriptionLongue"/>
	<xsl:text>','</xsl:text>
	<xsl:value-of select="./methodeEval"/>
	<xsl:text>','</xsl:text>
	<xsl:value-of select="./modalitesCCSemestreUn"/>
	<xsl:text>','</xsl:text>
	<xsl:value-of select="./modalitesCCSemestreDeux"/>
	<xsl:text>','</xsl:text>
	<xsl:value-of select="./CalculNFSessionUne"/>
	<xsl:text>','</xsl:text>
	<xsl:value-of select="./CalculNFSessionDeux"/>
	<xsl:text>','</xsl:text>
	<xsl:value-of select="./ressources"/>
	<xsl:text>','</xsl:text>
	<xsl:value-of select="./biblio"/>
	<xsl:text>','</xsl:text>
	<xsl:choose>
	<xsl:when test="./noteEliminatoire != ''">
	<xsl:value-of select="./noteEliminatoire"/>
	</xsl:when>
	<xsl:otherwise>
	<xsl:text>0</xsl:text>
	</xsl:otherwise>
	</xsl:choose> 
	<xsl:text>','</xsl:text>
	<xsl:value-of select="./textePrerequis"/>
	<xsl:text>','</xsl:text>
	<xsl:value-of select="@codeue"/>
	<xsl:text>'</xsl:text>
	<xsl:text>);&#xA;</xsl:text>
<!-- 
<xsl:text>select _ID_ENS_ from com_enseignant where _EMAIL_ENS_ = '</xsl:text>
<xsl:value-of select="emailPremierResp"/>
<xsl:text>';&#xA;</xsl:text>
-->
 
<xsl:value-of select="./nomPremierResp"/>
<xsl:text>&#xA;</xsl:text>
<xsl:value-of select="./emailPremierResp"/>
<xsl:if test="./nomSecondResp != ''">
<xsl:text>&#xA;</xsl:text>
<xsl:value-of select="./nomSecondResp"/>
<xsl:text>&#xA;</xsl:text>
<xsl:value-of select="./emailSecondResp"/>
</xsl:if>
<xsl:text>&#xA;</xsl:text>

<!--
<xsl:text>insert into livret_responsable_module (_ID_MOD_ , _ID_ENS_ , commentaire) values( (select MAX(_ID_MOD_) from com_module) ,(select MAX(_ID_ENS_) from com_enseignant where _EMAIL_ENS_ = '</xsl:text>
<xsl:value-of select="./emailPremierResp"/>
<xsl:text>'),'');&#xA;</xsl:text>
<xsl:if test="./nomSecondResp != ''">
<xsl:text>insert into livret_responsable_module (_ID_MOD_ , _ID_ENS_ , commentaire) values( (select MAX(_ID_MOD_) from com_module) ,(select MAX(_ID_ENS_) from com_enseignant where _EMAIL_ENS_ = '</xsl:text>
<xsl:value-of select="./emailSecondResp"/>
<xsl:text>'),'');&#xA;</xsl:text>
</xsl:if>
<xsl:text>&#xA;</xsl:text>
-->


<!--
<xsl:text>insert into com_enseignant IFNULL((select _ID_ENS_ from com_enseignant where _EMAIL_ENS_ = '</xsl:text>
<xsl:value-of select="./emailPremierResp"/>
<xsl:text>'),((_ID_CAT_ , _ID_UTIL_ , _EMAIL_ENS_) values(4,4,'</xsl:text>
<xsl:value-of select="./emailPremierResp"/>
<xsl:text>'));</xsl:text>
<xsl:text>&#xA;</xsl:text>



<xsl:text>IF EXISTS (select _ID_ENS_ from com_enseignant where _EMAIL_ENS_ = '</xsl:text>
<xsl:value-of select="./emailPremierResp"/>
<xsl:text>') insert into com_enseignant (_ID_CAT_ , _ID_UTIL_ , _EMAIL_ENS_) values(4,4,'</xsl:text>
<xsl:value-of select="./emailPremierResp"/>
<xsl:text>');</xsl:text>
<xsl:text>&#xA;</xsl:text>

<!
<xsl:text>insert into livret_pre_requis (_ID_MOD_FILS_ , _ID_MOD_PERE_ , _COMMENTAIRE_) values((select MAX(_ID_MOD_) from com_module),'409'); </xsl:text>
-->

	<!--<xsl:value-of select="//lesPrerequis"/>
	<xsl:text>','</xsl:text>-->

<!--
    <xsl:if test="@nomPremierResp not(.=text() or .=node())">
	<xsl:text> select _NOM_ENS_ ,_PRENOM_ENS_,_EMAIL_ENS_ from com_enseignant <xsl:text>
	   <xsl:if test="_NOM_ENS_  not(.=text() or .=node())">  
           <xsl:if test="_PRENOM_ENS_  not(.=text() or .=node())">
	          <xsl:if test="_EMAIL_ENS_  not(.=text() or .=node())">
	                 <xsl:text>insert into livret_responsable_module(_ID_MOD_, _ID_ENS_)values(</xsl:text>
                                       
							<xsl:value-of select="./@ID_Module_"/>
							<xsl:text>','</xsl:text>
							<xsl:value-of select="./@ID_ENS_"/>
							<xsl:text>'</xsl:text>
							<xsl:text>);&#xA;</xsl:text>
	
	          </xsl:if>
            </xsl:if>
	    <xsl:elseif>

					<xsl:text>insert into com_enseignant(_ID_ENS_,_ID_CAT_,_ID_UTIL_,_NUM_IND_ENS_,_ID_COMP_,_NOM_ENS_,_PRENOM_ENS_,_EMAIL_ENS_,_NUM_TEL_ENS_,_NUM_TEL2_ENS_,_PRCT_PRESENCE_,_REDUC_SERV_,_INFORMATICIEN_)values(</xsl:text>
                                       
							<xsl:value-of select="./@ID_Module_"/>
							<xsl:text>','</xsl:text>
							<xsl:value-of select="./@ID_ENS_"/>
							<xsl:text>'</xsl:text>
							<xsl:text>);&#xA;</xsl:text>
	  </xsl:if>
    </xsl:if>
-->	
<!--	<xsl:text>insert into com_module( _NOM_MOD_ , _CONTENU_MOD_)values(</xsl:text>
			<xsl:value-of select="./@_NOM_MOD_"/>
			<xsl:text>','</xsl:text>
			<xsl:value-of select="./@_CONTENU_MOD_"/>
			<xsl:text>'</xsl:text>
	<xsl:text>);&#xA;</xsl:text>

<xsl:comment>
	<xsl:value-of select="./nomPremierResp"/>
	<xsl:text>,'</xsl:text>
	<xsl:value-of select="./emailPremierResp"/>
	<xsl:text>,'</xsl:text>
	<xsl:value-of select="./nomSecondResp"/>
	<xsl:text>,'</xsl:text>
	<xsl:value-of select="./emailSecondResp"/>
	<xsl:t</xsl:stylesheet>ext>,'</xsl:text>

	<xsl:value-of select="./descriptionCourte"/>
	<xsl:text>,'</xsl:text>
</xsl:comment>
-->

</xsl:template>
</xsl:stylesheet>










