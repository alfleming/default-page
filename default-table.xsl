<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="../system.xsl"/>
<xsl:output method="html" indent="yes"/>


<xsl:template match="/">
<table class="table table-hover">
	<tbody>
    
        <xsl:for-each select='/ROOT/CHILDREN/OBJECT'>
            <xsl:sort select="SORTKEY" data-type="number"/>
            <xsl:variable name="imglink">
            	<xsl:choose>
                	<xsl:when test="THUMBNAILURL[not(.='')]"><xsl:value-of select="THUMBNAILURL" disable-output-escaping="yes"/></xsl:when>
                    <xsl:when test="IMAGE[not(.='')]"><xsl:value-of select="ROOTDIR"/>/getimage.asp?id=/<xsl:value-of select="ID"/>/&amp;filename=<xsl:value-of select="IMAGE/NAME" />&amp;mode=6</xsl:when>
                    <xsl:otherwise>http://placehold.it/300/000/000/&amp;text=placeholder</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            
            <tr>
            
            	<xsl:if test="THUMBNAILURL[not(.='')] or IMAGE[not(.='')]">
            	<td class="col-xs-3">
                	<div class="thumbnail">
                    	<img src="{$imglink}" class="img-responsive"/>
                    </div>
                </td>
                </xsl:if>
                <td><xsl:if test="THUMBNAILURL[not(.='')] or IMAGE[not(.='')]"><xsl:attribute name="class">col-xs-9</xsl:attribute></xsl:if>
					<p><strong><xsl:value-of select="NAME"/></strong></p>
					<xsl:if test="DESCRIPTION[not(.='')]"><p><xsl:value-of select="DESCRIPTION" disable-output-escaping="yes"/></p></xsl:if>
					<a href="{ID}" class="btn btn-xs btn-default pull-right">More <i class="fa fa-angle-double-right"></i></a>
                    <div class="clearfix"></div>
				</td>
                </tr>
        </xsl:for-each>
	</tbody>
</table>
</xsl:template>

<xsl:template name="ShowPage"></xsl:template>

</xsl:stylesheet>

	