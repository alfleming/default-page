<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt">

<xsl:import href="../system.xsl"/>

<xsl:template match="/">

	<xsl:variable name="items">
		<ROOT><xsl:copy-of select="/ROOT/SETTINGS"/><xsl:copy-of select="/ROOT/ACCESSRIGHTS"/><xsl:copy-of select="/ROOT/OBJECT"/></ROOT>
		<xsl:for-each select="/ROOT/OBJECT/IMAGE">
			<xsl:sort select="SORTKEY" data-type="number"/>
			<xsl:copy-of select="."/>
		</xsl:for-each>
	</xsl:variable>
    
    <div id="bootstrap-carousel" class="carousel slide" data-ride="carousel">
    
     <ol class="carousel-indicators">
      <xsl:for-each select="msxsl:node-set($items)/IMAGE">
                <xsl:variable name="slidecount" select="position()-1"/>
        		<li data-target="#bootstrap-carousel" data-slide-to="{$slidecount}"><xsl:if test="position() = 1"><xsl:attribute name="class">active</xsl:attribute></xsl:if></li>
        </xsl:for-each>
	</ol>
        <div class="carousel-inner">
                        
             <xsl:for-each select="msxsl:node-set($items)/IMAGE">
              	<xsl:variable name="numbered" select="position()"/>
                <xsl:variable name="carouselpos">
                <xsl:choose>
                	<xsl:when test="CAROUSELPOSIT[not(.='')]"><xsl:value-of select="CAROUSELPOSIT"/></xsl:when>
                    <xsl:otherwise>center</xsl:otherwise>
                </xsl:choose>
                </xsl:variable>
                <div class="item"><xsl:if test="position() = 1"><xsl:attribute name="class">item active</xsl:attribute></xsl:if>
                <div class="image-holder">
                    <div class="image-carousel-3" style="background:url('{$ROOTDIR}/getimage.asp?id={/ROOT/OBJECT/ID}&amp;filename={NAME}&amp;mode=9') no-repeat center {$carouselpos}; background-size:cover;-webkit-background-size:cover; -o-background-size:cover; -moz-background-size:cover;"></div>
                 </div>       
                        <xsl:if test="CAPTION[not(.='')]">
                        <div class="carousel-caption">
							<p class="lead"><xsl:value-of select="CAPTION"/></p>
                        </div>
                        </xsl:if>
                </div>
            </xsl:for-each>
        
        </div>
         <a class="left carousel-control" href="#bootstrap-carousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		<a class="right carousel-control" href="#bootstrap-carousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
    
    

</xsl:template>

<xsl:template name="ShowPage" ></xsl:template>

</xsl:stylesheet>

	