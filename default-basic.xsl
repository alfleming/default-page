<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="../system.xsl"/>
<xsl:output method="html" indent="yes"/>


<xsl:template match="/">
<div class="container-fluid">
	<ul class="styled-list">
        <xsl:for-each select='/ROOT/CHILDREN/OBJECT'>
            <xsl:sort select="SORTKEY" data-type="number"/>
            <li>
            	<p class="lead"><xsl:value-of select="NAME"/></p>
				<xsl:if test="DESCRIPTION[not(.='')]"><p><xsl:value-of select="DESCRIPTION" disable-output-escaping="yes"/></p></xsl:if>
				<a href="{ID}" class="btn btn-sm btn-primary pull-right">More <i class="fa fa-angle-double-right"></i></a>
				<div class="clearfix"></div>
			</li>
        </xsl:for-each>
         </ul>   
</div>
</xsl:template>

<xsl:template name="ShowPage"></xsl:template>

</xsl:stylesheet>

	