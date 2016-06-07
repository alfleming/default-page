<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="../system.xsl"/>
<xsl:output method="html" indent="yes"/>


<xsl:template match="/">
<div class="container-fluid">
	<div class="row">
    	<div class="col-md-8 col-md-offset-2">
    
        <xsl:for-each select='/ROOT/CHILDREN/OBJECT'>
            <xsl:sort select="SORTKEY" data-type="number"/>
            <xsl:variable name="imglink">
            	<xsl:choose>
                	<xsl:when test="THUMBNAILURL[not(.='')]"><xsl:value-of select="THUMBNAILURL" disable-output-escaping="yes"/></xsl:when>
                    <xsl:when test="IMAGE[not(.='')]"><xsl:value-of select="ROOTDIR"/>/getimage.asp?id=/<xsl:value-of select="ID"/>/&amp;filename=<xsl:value-of select="IMAGE/NAME" />&amp;mode=6</xsl:when>
                    <xsl:otherwise>http://placehold.it/300/000/000/&amp;text=placeholder</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            
            <div class="well well-sm container-fluid">
            <div class="row">
            	<xsl:if test="THUMBNAILURL[not(.='')] or IMAGE[not(.='')]">
            	<div class="col-sm-3">
                	<div class="thumbnail">
                    	<div class="img-thumb" style="background: url({$imglink}) no-repeat center center; background-size:cover; -webkit-background-size:cover; -moz-background-size:cover; -o-background-size:cover; display:block; height:140px;"></div>
                    </div>
                </div>
                </xsl:if>
                <div class="col-sm-12"><xsl:if test="THUMBNAILURL[not(.='')] or IMAGE[not(.='')]"><xsl:attribute name="class">col-sm-9</xsl:attribute></xsl:if>
					<h3><xsl:value-of select="NAME"/></h3>
					<xsl:if test="DESCRIPTION[not(.='')]"><p><xsl:value-of select="DESCRIPTION" disable-output-escaping="yes"/></p></xsl:if>
					<a href="{ID}" class="btn btn-sm btn-primary pull-right">More <i class="fa fa-angle-double-right"></i></a>
                    <div class="clearfix"></div>
            		</div>
                </div>
                </div>
        </xsl:for-each>
         </div>
    </div>   
</div>
</xsl:template>

<xsl:template name="ShowPage"></xsl:template>

</xsl:stylesheet>

	