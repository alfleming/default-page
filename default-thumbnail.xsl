<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:import href="../system.xsl"/>

<xsl:template match="/">
    <div class="container-fluid">
	<div class="row slick-enable-here mag-slick">
        <xsl:for-each select="/ROOT/CHILDREN/OBJECT">
            <xsl:sort select="SORTKEY" data-type="number"/>
            <xsl:variable name="buttontexts">
            	<xsl:choose>
                	<xsl:when test="BUTTON[not(.='')]"><xsl:value-of select="BUTTON"/></xsl:when>
                    <xsl:otherwise>Learn More</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
             <xsl:variable name="buttonurl">
            	<xsl:choose>
                	<xsl:when test="URL[not(.='')]"><xsl:value-of select="URL"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$ROOTDIR"/><xsl:value-of select="ID"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <div class="col-sm-3 col-md-2">
                    <div class="thumbnail">
                    	<a href="{URL}"><img src="{$ROOTDIR}/getimage.asp?id={ID}&amp;filename={IMAGE/NAME}&amp;mode=6" alt="{NAME}" class="img-responsive"/></a>
                        <div class="caption">
                            <h4 class="text-center"><xsl:value-of select="NAME"/></h4>
                            <hr/>
                            <a href="{$buttonurl}" class="btn btn-sm btn-primary btn-block"><strong><xsl:value-of select="$buttontexts"/></strong></a>
                        </div>
                    </div>
               </div>
        </xsl:for-each>
     </div> 
    </div>
	
</xsl:template>

<xsl:template name="ShowPage" ></xsl:template>


</xsl:stylesheet>

	