<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:import href="../system.xsl"/>

<xsl:template match="/">
    <div class="container-fluid">
	<div class="row no-gutter slick-enable-here">
        <xsl:for-each select="/ROOT/CHILDREN/OBJECT">
            <xsl:sort select="SORTKEY" data-type="number"/>
            <div class="col-md-3 col-sm-6">
				<a href="{URL}" class="portfolio-box" title="{CAPTION}">
                <xsl:choose>
                    <xsl:when test="contains(URL, 'pdf')"><xsl:attribute name="target">_blank</xsl:attribute></xsl:when>
                    <xsl:otherwise><xsl:attribute name="target">_self</xsl:attribute></xsl:otherwise>
                </xsl:choose>
                        <img src="{$ROOTDIR}/getimage.asp?id={ID}&amp;filename={IMAGE/NAME}&amp;mode=8" alt="{NAME}" class="img-responsive"/>
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    <xsl:value-of select="NAME"/>
                                </div>
                                <div class="project-name">
                                    <xsl:value-of select="TEXT"/>
                                </div>
                            </div>
                        </div>
                </a>
			</div>
        </xsl:for-each>
     </div> 
    </div>
	
</xsl:template>

<xsl:template name="ShowPage" ></xsl:template>


</xsl:stylesheet>

	